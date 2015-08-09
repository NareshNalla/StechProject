package com.sminds.userservice.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import com.sminds.loginservice.login.utils.LoginLogger;
import com.sminds.userservice.dao.UserSDAOI;
import com.sminds.userservice.vo.User;
import com.sminds.userservice.vo.ImagePojo;

public class UserSDAO implements UserSDAOI{
	@Autowired
	private JdbcTemplate jt;

	private Logger log = LoginLogger.getLogger();

	RowMapper<ImagePojo> ugMapper= new RowMapper<ImagePojo>(){
		@Override
		public ImagePojo mapRow(ResultSet rs, int index) throws SQLException {
			System.out.println("In UserGroup::mapRow()");

			ImagePojo u=new ImagePojo();
			u.setGroupname(rs.getString(1));
			System.out.println(rs.getString(1));
			return u;
		}
	};

	RowMapper<User> uMapper= new RowMapper<User>(){
		@Override
		public User mapRow(ResultSet rs, int index) throws SQLException {
			System.out.println("In UserGroup::mapRow()");

			User u=new User();
			u.setUser_id(rs.getString(1));
			u.setEmail(rs.getString(2));
			u.setPassword(rs.getString(3));
			u.setGroupnamef(rs.getString(4));
			

			log.debug("setting values to vo");


			return u;
		}
	};


	@Override
	public List<ImagePojo>  userGroup() {


		String sql="select * from usergroup";

		return (List<ImagePojo>)jt.query(sql, ugMapper);
	}
	public boolean userGroupnameEdit(String gname,String oldname) {
		log.debug("UserSDAO.userGroupnameEdit");
		System.out.println(gname+"..."+oldname);
		String sql="update usergroup set groupname=? where groupname=?";
		int count=jt.update(sql,gname,oldname);

		return (count==1);

	}

	public boolean userGroupnameDelete(String gname) {
		log.debug("UserSDAO.userGroupnameDelete");
		System.out.println(gname+"...");
		String sql="delete  from usergroup where groupname=?";
		int count=jt.update(sql,gname);

		return (count==1);

	}

	public List<ImagePojo> userGroupnameSearch(String gname) {
		log.debug("UserSDAO.userGroupnameSearch");
		System.out.println(gname+"...");
		return (List<ImagePojo>)jt.query("select * from usergroup where groupname like'"+gname+"%'",new ResultSetExtractor<List<ImagePojo>>() {
			@Override
			public List<ImagePojo> extractData(ResultSet rs)
					throws SQLException, DataAccessException {
				List<ImagePojo> list=new ArrayList<ImagePojo>();

				while(rs.next()){	
					ImagePojo u=new ImagePojo();
					u.setGroupname(rs.getString(1));
					System.out.println(rs.getString(1));
					list.add(u);
				}
				return list;
			}
		});

	}
	public boolean userGroupnameAdd(ImagePojo u) {
		log.debug("UserSDAO.userGroupnameAdd");
		System.out.println(u.getGroupname()+"...");
		String sql="insert into usergroup values(?)";
		int count=jt.update(sql,u.getGroupname());

		return (count==1);
	}
	public int addUserTOGroup(User ur) {
		log.debug("UserSDAO.addUserTOGroup");

		String[] emails = ur.getEmail().split(",");
		int count=0;
		for(String email : emails) {

			System.out.println("UserSDAO.addUserToGroup="+ur.getGroupnamef());

			String sql="INSERT INTO t_group_userdetails "
					+ "(user_id , email ,password ,groupname) "
					+ "VALUES (userid_seq.NEXTVAL, ?,'abc',(select groupname from usergroup where groupname=?))";
			count=jt.update(sql,email,ur.getGroupnamef());


		}
		return count;
	}
	public List<User> userList() {
		String sql="select * from t_group_userdetails";

		return (List<User>)jt.query(sql, uMapper);

	}
	public boolean userDeletet(String uid) {
		log.debug("UserSDAO.userDeletet");
		System.out.println(uid+"...");
		String sql="delete  from t_group_userdetails where USER_ID=?";
		int count=jt.update(sql,uid);

		return (count==1);
	}
	public List<User> userListByGroup(String groupname) {
		log.debug("UserSDAO.userListByGroup");
		String sql="select * from t_group_userdetails where groupname='"+groupname+"'";

		return (List<User>)jt.query(sql, uMapper);
	}
	public int importUserTOGroup(String[] emails) {
		log.debug("UserSDAO.importUserTOGroup");

	
		int count=0;
			System.out.println("UserSDAO.addUserToGroup="+emails[1]);
			String sql="INSERT INTO t_group_userdetails "
					+ "(user_id , email ,password ,groupname) "
					+ "VALUES (userid_seq.NEXTVAL, ?,'abc',(select groupname from usergroup where groupname=?))";
			count=jt.update(sql,emails[0],emails[1]);
		return count;
	}
	@Override
	public List<User> userMailSearch(String email) {
		log.debug("UserSDAO.userMailSearch");
		System.out.println(email+"...");
		return (List<User>)jt.query("select user_id,email, groupname from t_group_userdetails where email like'"+email+"%'",new ResultSetExtractor<List<User>>() {
			@Override
			public List<User> extractData(ResultSet rs)
					throws SQLException, DataAccessException {
				List<User> list=new ArrayList<User>();

				while(rs.next()){	
					User u=new User();
					u.setUser_id(rs.getString(1));
					u.setEmail(rs.getString(2));
					u.setGroupnamef(rs.getString(3));
					
					log.debug(rs.getString(1));
					log.debug(rs.getString(2));
					log.debug(rs.getString(3));
					list.add(u);
				}
				return list;
			}
		});

	}
}