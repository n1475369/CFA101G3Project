package com.member.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class MemDAOImpl implements MemDAO{
	
	
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
	
	//驗證帳密是否存在
	@Override
	public MemVO findByUsernameAndPassword(String username,String password) {
		
		try {
			String sql = "select * from member where mem_username = ? and mem_password = ?";
			MemVO member = template.queryForObject(sql, new BeanPropertyRowMapper<MemVO>(MemVO.class),username,password);
			return member;
		} catch (Exception e) {
			System.out.println("找不到用戶");
			return null;
		}
	}
	
	//驗證帳號是否存在
	@Override
	public MemVO findByUsername(String username) {
		
		try {
			String sql = "select * from member where mem_username = ?";
			MemVO member = template.queryForObject(sql, new BeanPropertyRowMapper<MemVO>(MemVO.class),username);
			return member;
		} catch (Exception e) {
			System.out.println("帳號可以使用");
			return null;
		}
	}

}

