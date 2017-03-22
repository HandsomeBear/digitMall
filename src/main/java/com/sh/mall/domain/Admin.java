package com.sh.mall.domain;

import java.util.Date;

public class Admin {
	
	private Integer admin_id;
	private String name;
	private String password;
	private String permiss_id;
	private String super_admin;
	private String upd_user;
	private Date upd_date;
	private String upd_ip;
	
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPermiss_id() {
		return permiss_id;
	}
	public void setPermiss_id(String permiss_id) {
		this.permiss_id = permiss_id;
	}
	public String getSuper_admin() {
		return super_admin;
	}
	public void setSuper_admin(String super_admin) {
		this.super_admin = super_admin;
	}
	public String getUpd_user() {
		return upd_user;
	}
	public void setUpd_user(String upd_user) {
		this.upd_user = upd_user;
	}
	public Date getUpd_date() {
		return upd_date;
	}
	public void setUpd_date(Date upd_date) {
		this.upd_date = upd_date;
	}
	public String getUpd_ip() {
		return upd_ip;
	}
	public void setUpd_ip(String upd_ip) {
		this.upd_ip = upd_ip;
	}
	
}
