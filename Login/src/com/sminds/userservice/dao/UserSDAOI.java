package com.sminds.userservice.dao;

import java.util.List;

import com.sminds.userservice.vo.User;
import com.sminds.userservice.vo.ImagePojo;

public interface UserSDAOI {

	List<ImagePojo> userGroup();
	boolean userGroupnameEdit(String gname,String oldname);
	boolean userGroupnameDelete(String gname);
	boolean userGroupnameAdd(ImagePojo u);
	List<ImagePojo> userGroupnameSearch(String gname);
	List<User> userMailSearch(String email);


}
