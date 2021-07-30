package com.locationprogram.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.locationprogram.model.LocpService;
import com.member.model.MemVO;

@WebServlet("/locationprogram/getAllLocSellerServlet")
public class GetAllLocSellerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		LocpService locpsvc = new LocpService();
		List<MemVO> list = locpsvc.getAllLoc();
		
		ObjectMapper mapper = new ObjectMapper(); 
		String data = mapper.writeValueAsString(list);
		out.println(data);
	}

}
