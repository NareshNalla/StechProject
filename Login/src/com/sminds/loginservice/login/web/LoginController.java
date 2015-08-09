package com.sminds.loginservice.login.web;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sminds.loginservice.login.dao.UserDAOI;
import com.sminds.loginservice.login.service.LoginService;
import com.sminds.loginservice.login.utils.LoginLogger;
import com.sminds.loginservice.login.vo.User;

@Controller
public class LoginController 
{

	@Autowired
	private UserDAOI udao;


	@Autowired
	private LoginService ls;

	private Logger log = LoginLogger.getLogger();

	@RequestMapping(value="/login.spring",method=RequestMethod.GET)
	public ModelAndView loginForm()throws Exception {
		log.debug("LoginController.loginForm");
		log.debug("...............................");
		return new ModelAndView("login");
	}

	@RequestMapping(value="/login.spring",method=RequestMethod.POST)
	public ModelAndView processLogin(@ModelAttribute("user") User user)throws Exception  {
		log.debug("LoginController.processLogin");
		boolean flag=ls.findUser(user);
		log.debug(flag);
		if(flag==false){
			log.debug(user.getUserName()+"!=="+user.getPassword());
			log.debug("...............................");
			return new ModelAndView("login");

		}
		log.debug(user.getUserName()+"=="+user.getPassword());
		log.debug("...............................");
		return new ModelAndView("dashboard");
	}
	@RequestMapping(value="/forgotform.spring",method=RequestMethod.GET)
	public ModelAndView forgetPassForm(){
		System.out.println("LoginController.forgetPassForm");

		return new ModelAndView("forgotpass");

	}


	@RequestMapping(value="/forgotpass.spring",method=RequestMethod.GET)
	public ModelAndView forgotPasswordForm()throws Exception  {
		log.debug("LoginController.forgotPasswordForm");
		log.debug("...............................");
		return new ModelAndView("changepass");

	}


	@RequestMapping(value="/forgotpass.spring",method=RequestMethod.POST)
	public ModelAndView forgotPassword(User user,WebRequest wr)throws Exception  {
		log.debug("LoginController.forgotPassword");
		Random random=new Random();
		int tempOTP=random.nextInt(10000);
		log.debug("OTP: "+tempOTP);
		user.tempOTP=tempOTP;
		
		boolean flag=ls.findUserEmail(user);
		log.debug(flag);
		if(flag){
			wr.setAttribute("userFirst",user,WebRequest.SCOPE_SESSION);
		}
		if(flag==false){
			log.debug("forgotPassword changes fail");
			log.debug("...............................");
			return new ModelAndView("forgotpass");
		}
		log.debug("forgotPassword changes success");
		log.debug("...............................");
		return new ModelAndView("changepass","user",user);
	}


	@RequestMapping(value="changepassword.spring",method=RequestMethod.POST)
	public ModelAndView changePassword(User userNew,HttpSession session)throws Exception{
		log.debug("LoginController.changePassword");
		User userSs=(User)session.getAttribute("userFirst");
		/*String email=user1.getEmail();
		user.setEmail(email);*/
		
		boolean flag=ls.changePass(userSs,userNew);

		if(flag==false){
			log.debug("password changes fail");
			log.debug("...............................");
			return new ModelAndView("changefail");
		}
		log.debug("password changes success ");
		log.debug("...............................");		
		return new ModelAndView("changesuccess");
	}
}
