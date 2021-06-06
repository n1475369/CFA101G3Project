package com.member.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class MemberDaoImpl implements MemberDao{
	
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA101G3");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	JdbcTemplate template = new JdbcTemplate(ds);
	
	
	@Override
	public Member findMemberByUsernameAndPassword(String username,String password) {
		
		try {
			String sql = "select * from member where username_email = ? and password = ?";
			Member member = template.queryForObject(sql, new BeanPropertyRowMapper<Member>(Member.class),username,password);
			return member;
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("找不到用戶");
			return null;
		}
	}
	
}
