package com.sh.mall.service.customer;

import java.util.List;

import com.sh.mall.domain.ProductIndex;

public interface IProductIndexService {

	/**
	 * get digitals which are showed index
	 * @param flag
	 * @return
	 */
	public List<ProductIndex> list(String flag);
}
