package com.sh.mall.domain;

import java.math.BigDecimal;

public class ProductIndex {
	private int digital_id;
	private String title;
	private BigDecimal price;
	private String image_address;
	
	public int getDigital_id() {
		return digital_id;
	}
	public void setDigital_id(int digital_id) {
		this.digital_id = digital_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getImage_address(){
		return image_address;
	}
	public void setImage_address(String image_address){
		this.image_address = image_address;
	}
}
