package com.locationimages.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.locationimages.model.*;
import com.locationroom.model.*;
/**
 * Servlet implementation class LociServlet
 */
// 重點 一定要
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
@WebServlet("/locationimages/LociServletAddImg")
public class LociServletAddImg extends HttpServlet {
  
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");


			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.


			ObjectMapper mapper = new ObjectMapper(); 
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				System.out.println("7");
				Integer LOCI_LOCR_ID =Integer.parseInt(request.getParameter("LOCR_ID"));
				System.out.println(LOCI_LOCR_ID);
				Part part = request.getPart("file1");
				System.out.println("9");
				InputStream in = part.getInputStream();

				LociService locisvc = new LociService();
				LociVO lociVO = new LociVO();
				byte[] buf = null;

				buf = new byte[in.available()];
				in.read(buf);
				in.close();

				if (!errorMsgs.isEmpty()) {
					
					response.setStatus(401);
					String Msg = mapper.writeValueAsString(errorMsgs);
					
					response.getWriter().print(Msg);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				System.out.println("10");
				lociVO.setLOCI_LOCR_ID(LOCI_LOCR_ID);
				lociVO.setLOCI_IMAGES(buf);
				locisvc.addLoci(LOCI_LOCR_ID, buf);
				
				Map map = new HashMap();
				map.put("msg","success" );
				String msg = mapper.writeValueAsString(map);
System.out.println(msg);
response.getWriter().print(msg);
				
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//				String url = "/locationroom/locationRoomServlet?action=locationRoomUpdate&locr_id=" + LOCI_LOCR_ID;
//				System.out.println("2");
//				RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(request, response);
				
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());

				e.printStackTrace();
				response.setStatus(401);
				String Msg = mapper.writeValueAsString(errorMsgs);
				
				response.getWriter().print(Msg);
			}
		}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
