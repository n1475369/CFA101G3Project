package com.member.model;

public class MemService {
	private MemDAO dao = new MemDAOImpl();
	//登入驗證方法
	public MemVO login(MemVO member) {
		return dao.findByUsernameAndPassword(member.getMem_username(), member.getMem_password());
	}
	
	//驗證帳號是否存在
	public MemVO check(MemVO member) {
		return dao.findByUsername(member.getMem_username());
	}
	
	//註冊買家帳號
	public int registerBuy(MemVO member) {
		if(check(member) == null) {
			return dao.insert(member);
		}else {
			return 0;
		}
	}
}
