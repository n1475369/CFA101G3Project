package com.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class MemDAOImpl implements MemDAO{
	//註冊會員
	private static final String INSERT = "insert into member (mem_username, mem_password, mem_name, mem_role, mem_phone, mem_city, mem_cityarea, mem_street, mem_shop_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	
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
	
	//註冊會員
	@Override
	public int insert(MemVO member) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			pstmt.setString(1, member.getMem_username());
			pstmt.setString(2, member.getMem_password());
			pstmt.setString(3, member.getMem_name());
			pstmt.setInt(4, member.getMem_role());
			pstmt.setString(5, member.getMem_phone());
			pstmt.setString(6, member.getMem_city());
			pstmt.setString(7, member.getMem_cityarea());
			pstmt.setString(8, member.getMem_street());
			pstmt.setString(9, member.getMem_shop_name());
			int executeUpdate = pstmt.executeUpdate();
			return executeUpdate;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			if(pstmt != null)	{
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	//利用驗證啟用碼尋找會員
	@Override
	public MemVO findByCode(String code) {
		try {
			String sql = "select * from member where mem_code = ?";
			MemVO member = template.queryForObject(sql, new BeanPropertyRowMapper<MemVO>(MemVO.class),code);
			return member;
		} catch (Exception e) {
			System.out.println("找不到此驗證碼用戶");
			return null;
		}
	}
	
	//更新會員信箱驗證狀態
	@Override
	public void updateEmailStatus(MemVO member) {
		String sql = "update member set mem_status = 1 where mem_id = ?";
		template.update(sql,member.getMem_id());
	}
	
	//更新買家會員個人資料
	@Override
	public void updateBuyProfile(MemVO member) {
		String sql = "update member set mem_name = ?, mem_phone = ?, mem_city = ?, mem_cityarea = ?, mem_street = ? where mem_username = ?";
		template.update(sql,member.getMem_name(),member.getMem_phone(),member.getMem_city(),member.getMem_cityarea(),member.getMem_street(),member.getMem_username());
	}
	
	//更新買家會員個人頭像
	@Override
	public void updateBuyHeadshot(MemVO member) {
		String sql = "update member set mem_headshot = ? where mem_username = ?";
		template.update(sql,member.getMem_headshot(),member.getMem_username());
	}
}


