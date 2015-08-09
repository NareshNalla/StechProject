package com.sminds.loginservice.login.service.mail;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.sminds.loginservice.login.utils.LoginLogger;

@Service
public class MailService
{
	@Autowired
	private MailSender mailSender;
	private Logger log = LoginLogger.getLogger();
 	 
	public void sendMail(String from, String to, String subject, String msg) {
		log.debug("MailService.sendMail");
		SimpleMailMessage message = new SimpleMailMessage();
 
		message.setFrom(from);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(msg);
		log.debug(message);
		mailSender.send(message);	
		log.debug("MailService.sendMail completed");
	}
}