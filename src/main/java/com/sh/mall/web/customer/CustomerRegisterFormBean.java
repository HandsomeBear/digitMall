package com.sh.mall.web.customer;

import org.hibernate.validator.constraints.NotBlank;

public class CustomerRegisterFormBean {
	
	@NotBlank
	private String username;
	@NotBlank
	private String password;
	@NotBlank
	private String rpassword;
	@NotBlank
	private String captcha;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRpassword() {
		return rpassword;
	}
	public void setRpassword(String rpassword) {
		this.rpassword = rpassword;
	}
	public String getCaptcha() {
		return captcha;
	}
	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}
	
}
