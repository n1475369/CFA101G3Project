package com.shop_order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.member.model.MemVO;
import com.shop_order.model.SpoService;
import com.shop_order.model.SpoVO;
import com.shop_order_item.model.SpoiService;
import com.shop_order_item.model.SpoiVO;

@WebServlet("/shop_order/buyerSpoServlet")
public class BuyerSpoServlet extends HttpServlet {
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control","no-store");//清快取
		response.setHeader("Pragma","no-cache");//清快取
		response.setDateHeader("Expires",0);//清快取
		String action = request.getParameter("action");
		
		//獲取所有訂單
		if("getAll".equals(action)) {
			HttpSession session = request.getSession();
			MemVO memVO = (MemVO)session.getAttribute("user");
			Integer bmem_id = memVO.getMem_id();
			SpoService spoService = new SpoService();
			List<SpoVO> list = spoService.getAll();
			List<SpoVO> buyerSpoList = new ArrayList<SpoVO>();
			for (SpoVO spoVO : list) {
				if(spoVO.getSpo_bmem_id().equals(bmem_id)) {
					buyerSpoList.add(spoVO);
				}
			}
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(response.getWriter(), buyerSpoList);
		}
		
		//獲取商品訂單明細by Spo_id
		if("getBySpo_id".equals(action)) {
			String spo_idStr = request.getParameter("spo_id");
			if(spo_idStr != null) {
				SpoiService spoiService = new SpoiService();
				List<SpoiVO> list = spoiService.getBySpo_id(Integer.parseInt(spo_idStr));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getWriter(), list);
			}
		}
		
		//獲取單筆訂單
		if("getSpoVO".equals(action)) {
			String spo_idStr = request.getParameter("spo_id");
			if(spo_idStr!=null) {
				Integer spo_id = Integer.parseInt(spo_idStr);
				SpoService spoService = new SpoService();
				SpoVO spoVO = spoService.getOne(spo_id);
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getWriter(), spoVO);
			}
		}
		
		//取消訂單
		if("cancelOrder".equals(action)) {
			String spo_idStr = request.getParameter("spo_id");
			if(spo_idStr != null) {
				Integer spo_id = Integer.parseInt(spo_idStr);
				SpoService spoService = new SpoService();
				spoService.cancelOrder(spo_id);
				response.getWriter().print(true);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
