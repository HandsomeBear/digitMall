package com.sh.mall.web.customer;

public class OrderRequest {

	private String digital_id;
	private String color;
	private String version;
	private String smalljpg;
	private String description;
	private String price;
	private String quantity;
	private String sum;
	
	private String address;
	
	public String getDigital_id() {
		return digital_id;
	}
	public void setDigital_id(String digital_id) {
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
	public String getSmalljpg() {
		return smalljpg;
	}
	public void setSmalljpg(String smalljpg) {
		this.smalljpg = smalljpg;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
