package com.member.model;

import java.util.List;

public class MemService {
	private MemDAO dao = new MemDAOImpl();
	//登入驗證方法
	public MemVO login(String username,String password) {
		return dao.findByUsernameAndPassword(username, password);
	}
	
	//驗證帳號是否存在
	public MemVO findByUsername(String username) {
		return dao.findByUsername(username);
	}
	
	//註冊會員帳號
	public int register(MemVO member) {
		return dao.insert(member);
	}
	
	//啟用信箱驗證
	public void active(String username) {
		dao.updateEmailStatus(username);
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
	
	//更新會員密碼
	public void updatePassword(String username,String passowrd) {
		MemVO memVO = new MemVO();
		memVO.setMem_username(username);
		memVO.setMem_password(passowrd);
		dao.updatePassword(memVO);
	}
	
	//獲取所有買家會員
	public List<MemVO> getAllByBuyMember(){
		return dao.getAllByBuyMember();
	}
}
