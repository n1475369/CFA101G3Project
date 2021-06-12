package com.member.model;

public interface MemDAO {
	//驗證帳密是否存在
	public MemVO findByUsernameAndPassword(String username,String password);
	//驗證帳號是否存在
	public MemVO findByUsername(String username);
	//註冊會員
	public int insert(MemVO member);
}
