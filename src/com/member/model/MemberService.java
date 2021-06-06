package com.member.model;

public class MemberService {
	private MemberDao dao = new MemberDaoImpl();
	
	public Member login(Member memberVo) {
		return dao.findMemberByUsernameAndPassword(memberVo.getUsername(), memberVo.getPassword());
	}
}
