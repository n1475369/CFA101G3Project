package com.member.controller;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemService;
import com.member.model.MemVO;


@WebServlet("/registerBuyServlet")
public class RegisterBuyServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		MemService service = new MemService();
		MemVO member = new MemVO();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		member.setMem_username(username);
		member.setMem_password(password);
		member.setMem_name(name);
		member.setMem_role(10);
		member.setMem_phone(phone);
		int count = service.registerBuy(member);
		if(count == 1) {
			RequestDispatcher rd = request.getRequestDispatcher("/loginServlet");
			rd.forward(request, response);
		}else {
			response.getWriter().print("0");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
