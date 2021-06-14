package com.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.member.model.MemVO;


@WebServlet("/buyProfileServlet")
public class BuyProfileServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		MemVO user = (MemVO)session.getAttribute("user");
		if(user!= null) {
			String username = user.getMem_username();
			String name = user.getMem_name();
			String phone = user.getMem_phone();
			String city = user.getMem_city();
			String cityarea = user.getMem_cityarea();
			String street = user.getMem_street();
			Map map = new HashMap();
			map.put("username", username);
			map.put("name", name);
			map.put("phone", phone);
			map.put("city", city);
			map.put("cityarea", cityarea);
			map.put("street", street);
			ObjectMapper mapper = new ObjectMapper();
	        mapper.writeValue(response.getWriter(), map);
		}else {
			response.getWriter().print("0");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}