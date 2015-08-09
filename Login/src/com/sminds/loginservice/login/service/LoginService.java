package com.sminds.loginservice.login.service;

import java.util.Random;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sminds.loginservice.login.dao.jdbc.UserDAO;
import com.sminds.loginservice.login.service.mail.MailService;
import com.sminds.loginservice.login.utils.LoginLogger;
import com.sminds.loginservice.login.vo.User;

@Service
public class LoginService {
	@Autowired
	private UserDAO udao;

	@Autowired
	private MailService ms;

	private Logger log = LoginLogger.getLogger();

	public boolean  findUser(User user){
		log.debug("LoginService.findUser");
		boolean flag=udao.findUser(user);
		log.debug("LoginService.findUser return :"+flag);
		return flag;
	}
	public boolean  findUserEmail(User user){
		log.debug("LoginService.findUserEmail");
		boolean flag=udao.findUserEmail(user.email);
		/*Random random=new Random();
		int tempOTP=random.nextInt(10000);
		log.debug("OTP: "+tempOTP);*/

		ms.sendMail("naresh.nrs24@gmail.com",user.email,"ForgotPassword","Hello.. :: '"+user.email
				+"'\n You got this becasue of ur forgot ur password\n\n"
				+ "\n Please note ur OPT(One time password):'"+user.tempOTP+"'"
				+ "\n Please follow the link:: \n http://localhost:8082/login/forgotpass.spring ");
		log.debug("Mail send to : "+user.email);
		log.debug("LoginService.findUserEmail return :"+flag);
		return flag;
	}

	public boolean changePass(User userSs, User userNew){
		log.debug("LoginService.changePass");
		boolean flag=false;

		if(userNew.otp == userSs.tempOTP){
			log.debug("OTP Correct:"+userNew.otp  +"== "+userSs.tempOTP);

			if(userNew.newPassword.equals(userNew.conformPassword)){
				flag=udao.changePass(userSs.email,userNew.newPassword);
				log.debug("LoginService.changePass return :"+flag);
				return flag;
			} else{
				log.debug(""+userNew.newPassword+"=!"+userNew.conformPassword);
				log.debug("LoginService.changePass : password(s) not matching");
				log.debug("LoginService.changePass return : flase");
				return flag;
					
			}
		}
		log.debug("LoginService.changePass : otp not match");
		log.debug("LoginService.changePass return : flase");
		return flag;
	}
	
}
