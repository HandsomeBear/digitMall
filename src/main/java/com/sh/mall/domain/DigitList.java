package com.sh.mall.domain;

import java.math.BigDecimal;

public class DigitList {

	private long digital_id;
	private String title;
	private String commentamount;
	private String sellamount;
	private String description;
	private BigDecimal price;
	private String image_address;
	
	public long getDigital_id() {
		return digital_id;
	}
	public void setDigital_id(long digital_id) {
		this.digital_id = digital_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCommentamount() {
		return commentamount;
	}
	public void setCommentamount(String commentamount) {
		this.commentamount = commentamount;
	}
	public String getSellamount() {
		return sellamount;
	}
	public void setSellamount(String sellamount) {
		this.sellamount = sellamount;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getImage_address() {
		return image_address;
	}
	public void setImage_address(String image_address) {
		this.image_address = image_address;
	}
}
