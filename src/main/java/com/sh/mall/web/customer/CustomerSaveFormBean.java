package com.sh.mall.web.customer;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

public class CustomerSaveFormBean {

	private String username;
	private String realname;
	private String sex;
	@Length(min=11,max=11)
	private String phone;
	@Email
	private String email;
	private String birth_date;
	private String home_adress;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	public String getHome_adress() {
		return home_adress;
	}
	public void setHome_adress(String home_adress) {
		this.home_adress = home_adress;
	}
	
}
