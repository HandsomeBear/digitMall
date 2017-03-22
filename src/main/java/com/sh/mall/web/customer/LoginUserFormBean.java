package com.sh.mall.web.customer;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotBlank;

public class LoginUserFormBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@NotBlank
	private String username;	//用户名
	@NotBlank
	private String password;	//密码

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

}
