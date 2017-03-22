package com.sh.mall.domain;

import com.sh.mall.util.PageUtil;

public class OrderExt extends Order{

	private String description;
	private String image_small;
	private String operation;
	private PageUtil pageUtil;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage_small() {
		return image_small;
	}
	public void setImage_small(String image_small) {
		this.image_small = image_small;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public PageUtil getPageUtil() {
		return pageUtil;
	}
	public void setPageUtil(PageUtil pageUtil) {
		this.pageUtil = pageUtil;
	}
	
}
