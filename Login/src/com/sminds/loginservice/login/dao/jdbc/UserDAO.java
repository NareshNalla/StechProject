package com.sminds.loginservice.login.dao.jdbc;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.sminds.loginservice.login.dao.UserDAOI;
import com.sminds.loginservice.login.utils.LoginLogger;
import com.sminds.loginservice.login.vo.User;

public class UserDAO extends JdbcDaoSupport implements UserDAOI{
	private Logger log = LoginLogger.getLogger();

	public boolean findUser(User user) {
		log.debug("UserDAO.findUser");
		log.debug(user.getUserName());
		int count=getJdbcTemplate().queryForInt("select count(email) from t_users_table where email='"+user.getUserName()+"' and password='"+user.getPassword()+"'");
		log.debug("UserDAOfindUser return : true  if count=1"+count);
		return (count==1);

	}

	public boolean findUserEmail(String email) {
		log.debug("UserDAO.findUserEmail");
		log.debug(email);
		int count=getJdbcTemplate().queryForInt("select count(email) from t_users_table where email='"+email+"'");
		log.debug("UserDAO.findUser return : true  if count=1"+count);
		return (count==1);
	}

	@Override
	public boolean changePass(String email,String newPassword) {		
		log.debug("UserDAO.changePass");
		log.debug(email+".."+newPassword);
		String sql="update t_users_table set password=? where email=?";
		
		int count=getJdbcTemplate().update(sql,new Object[]{newPassword,email} );
		log.debug("UserDAO.findUser return : true if count=1"+count);
		return (count==1);
	}

}
