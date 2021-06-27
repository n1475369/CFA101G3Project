package com.member.model;


public class MemService {
	private MemDAO dao = new MemDAOImpl();
	//登入驗證方法
	public MemVO login(MemVO member) {
		return dao.findByUsernameAndPassword(member.getMem_username(), member.getMem_password());
	}
	
	//驗證帳號是否存在
	public MemVO findByUsername(MemVO member) {
		return dao.findByUsername(member.getMem_username());
	}
	
	//註冊會員帳號
	public int register(MemVO member) {
		return dao.insert(member);
	}
	
	//啟用信箱驗證
	public boolean active(String code) {
		MemVO user = dao.findByCode(code);
		if(user != null) {
			dao.updateEmailStatus(user);
			return true;
		}else {
			return false;
		}
	}
	
	//更新買家會員個人資料
	public boolean updateBuyProfile(MemVO member) {
		if(member != null) {
			dao.updateBuyProfile(member);
			return true;
		}else {
			return false;
		}
	}
	
	//更新買家會員個人頭像
	public boolean updateBuyHeadshot(MemVO member) {
		if(member != null) {
			dao.updateBuyHeadshot(member);
			return true;
		}else {
			return false;
		}
	}
}
