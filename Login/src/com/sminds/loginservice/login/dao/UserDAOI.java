package com.sminds.loginservice.login.dao;

import com.sminds.loginservice.login.vo.User;

public interface UserDAOI {
	
	public boolean findUser(User user);

	public boolean findUserEmail(String email);

	public boolean changePass(String email,String newPassword);

}
