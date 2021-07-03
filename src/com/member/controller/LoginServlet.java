package com.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.*;


@WebServlet("/member/loginServlet")
public class LoginServlet extends HttpServlet {
       
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String action = request.getParameter("action");
		
		//登入驗證
		if("login".equals(action)) {
			MemService service = new MemService();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			MemVO user = service.login(username,password);
			HttpSession session = request.getSession();
			if(user != null) {
				session.setAttribute("user", user);
				response.getWriter().print("1");
			}else {
				response.getWriter().print("0");
			}
		}
		
		//登出
		if("logout".equals(action)) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/index.html");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
