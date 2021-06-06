package com.member.model;

public interface MemberDao {
	public Member findMemberByUsernameAndPassword(String username,String password);
}
