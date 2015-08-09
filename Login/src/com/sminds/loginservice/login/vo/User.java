package com.sminds.loginservice.login.vo;


public class User {
	public String userName;
	public String password;
	public int tempOTP;
	public String email;
	public String newPassword;
	public String conformPassword;
	public int otp;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getTempOTP() {
		return tempOTP;
	}
	public void setTempOTP(int tempOTP) {
		this.tempOTP = tempOTP;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getConformPassword() {
		return conformPassword;
	}
	public void setConformPassword(String conformPassword) {
		this.conformPassword = conformPassword;
	}
	public int getOtp() {
		return otp;
	}
	@Override
	public String toString() {
		return "User [userName=" + userName + ", password=" + password
				+ ", tempOTP=" + tempOTP + ", email=" + email
				+ ", newPassword=" + newPassword + ", conformPassword="
				+ conformPassword + ", otp=" + otp + "]";
	}
	public void setOtp(int otp) {
		this.otp = otp;
	}
	
	
}
