package com.member.model;

public interface MemberDao {
	//驗證帳密是否存在
	public Member findMemberByUsernameAndPassword(String username,String password);
	//驗證帳號是否存在
	public Member findByUsername(String username);
}
