package com.sminds.userservice.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sminds.loginservice.login.utils.LoginLogger;
import com.sminds.userservice.dao.jdbc.UserSDAO;
import com.sminds.userservice.vo.User;
import com.sminds.userservice.vo.ImagePojo;

@Service
public class UserSevice {
	@Autowired
	private UserSDAO dao;
	private Logger log = LoginLogger.getLogger();

	public List<ImagePojo> userGroup(){
		System.out.println("UserSevice.userGroup");
		List<ImagePojo> l=dao.userGroup();

		return l;


	}

	public boolean userGroupnameEdit(String gname,String oldname) {
		log.debug("UserSevice.userGroupnameEdit");
		boolean flag=dao.userGroupnameEdit(gname,oldname);
		return flag;
	}
	
	public boolean userGroupnameDelete(String gname) {
		log.debug("UserSevice.userGroupnameEdit");
		boolean flag=dao.userGroupnameDelete(gname);
		return flag;
	}
	
	public List<ImagePojo> userGroupnameSearch(String gname) {
		log.debug("UserSevice.userGroupnameSearch");
		List<ImagePojo> flag=dao.userGroupnameSearch(gname);
		return flag;
	}

	public boolean userGroupnameAdd(ImagePojo u) {
		log.debug("UserSevice.userGroupnameAdd");
		boolean flag=dao.userGroupnameAdd(u);
		return flag;
	}

	public int addUserToGroup(User u) {
		log.debug("UserService.addUserTOGroup");
		int result=dao.addUserTOGroup(u);
		
		return result;
	}

	public List<User> userList() {
		System.out.println("UserSevice.userList");
		List<User> l=dao.userList();

		return l;
	}

	public boolean userDeletet(String uid) {
		log.debug("UserSevice.userDeletet");
		boolean flag=dao.userDeletet(uid);
		return flag;	}

	public List<User> userListByGroup(String groupname) {
		System.out.println("UserSevice.userListByGroup"+groupname);
		
		List<User> l=dao.userListByGroup(groupname);
		log.debug("....Service");

		return l;
	}

	public int importUserTOGroup(String[] country) {
		log.debug("UserService.importUserTOGroup");
		int result=dao.importUserTOGroup(country);
		
		return result;
	}

	public List<User> userMailSearch(String gname) {
		log.debug("UserSevice.userMailSearch");
		List<User> flag=dao.userMailSearch(gname);
		return flag;
	}

}
