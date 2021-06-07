package com.member.model;
//會員JavaBean
public class Member {
	private Integer id;
	private String username;
	private String password;
	private String name;
	private String phone;
	private String address;
	private Integer memberRoleId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getMemberRoleId() {
		return memberRoleId;
	}
	public void setMemberRoleId(Integer memberRoleId) {
		this.memberRoleId = memberRoleId;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", username=" + username + ", password=" + password + ", name=" + name
				+ ", phone=" + phone + ", address=" + address + ", memberRoleId=" + memberRoleId + "]";
	}
	
}
