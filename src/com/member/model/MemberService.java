package com.member.model;

public class MemberService {
	private MemberDao dao = new MemberDaoImpl();
	//登入驗證方法
	public Member login(Member member) {
		return dao.findMemberByUsernameAndPassword(member.getUsername(), member.getPassword());
	}
	
	//驗證帳號是否存在
	public Member check(Member member) {
		return dao.findByUsername(member.getUsername());
	}
}
