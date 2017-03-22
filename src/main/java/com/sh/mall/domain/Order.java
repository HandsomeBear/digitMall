package com.sh.mall.domain;

public class Order {

	private long order_id;
	private String order_no;
	private String shoppingDate;
	private String sendDate;
	private String amount;
	private String quantity;
	private String status;
	private String address;
	private String nickname;
	private long digital_id;
	private String color;
	private String version;
	private String comment_flag;
	private String upd_user;
	private String upd_date;
	private String upd_ip;
	
	public long getOrder_id() {
		return order_id;
	}
	public void setOrder_id(long order_id) {
		this.order_id = order_id;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getShoppingDate() {
		return shoppingDate;
	}
	public void setShoppingDate(String shoppingDate) {
		this.shoppingDate = shoppingDate;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public long getDigital_id() {
		return digital_id;
	}
	public void setDigital_id(long digital_id) {
		this.digital_id = digital_id;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getUpd_user() {
		return upd_user;
	}
	public void setUpd_user(String upd_user) {
		this.upd_user = upd_user;
	}
	public String getUpd_date() {
		return upd_date;
	}
	public void setUpd_date(String upd_date) {
		this.upd_date = upd_date;
	}
	public String getUpd_ip() {
		return upd_ip;
	}
	public void setUpd_ip(String upd_ip) {
		this.upd_ip = upd_ip;
	}
	public String getComment_flag() {
		return comment_flag;
	}
	public void setComment_flag(String comment_flag) {
		this.comment_flag = comment_flag;
	}
	
}
