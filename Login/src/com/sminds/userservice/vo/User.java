package com.sminds.userservice.vo;

public class User {
	private String user_id;
	private String email;
	private String password;
	private String groupnamef;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGroupnamef() {
		return groupnamef;
	}
	public void setGroupnamef(String groupnamef) {
		this.groupnamef = groupnamef;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", email=" + email + ", password="
				+ password + ", groupnamef=" + groupnamef + "]";
	}
	
}
