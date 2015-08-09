package com.sminds.loginservice.login.utils;

import org.apache.log4j.Logger;

public class LoginLogger {
	
	public static Logger getLogger(){
		
		Logger log = Logger.getLogger("LOGGER");
		
		return log;
	}
}
