package com.sh.mall.repository.customer;

import java.util.List;

import com.sh.mall.domain.ProductIndex;

public interface IProductIndexDAO {
	
	/**
	 * return digits which are showed index
	 * @return
	 */
	public List<ProductIndex> list(String flag);
}
