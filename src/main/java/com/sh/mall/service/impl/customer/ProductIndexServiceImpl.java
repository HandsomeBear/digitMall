package com.sh.mall.service.impl.customer;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.mall.domain.ProductIndex;
import com.sh.mall.repository.customer.IProductIndexDAO;
import com.sh.mall.service.customer.IProductIndexService;

@Service
public class ProductIndexServiceImpl implements IProductIndexService {
	private static final Logger logger = LoggerFactory.getLogger(ProductIndexServiceImpl.class);
	
	@Autowired
	private IProductIndexDAO productIndexDAO;
	
	/**
	 * index显示产品信息
	 */
	@Override
	public List<ProductIndex> list(String flag) {
		logger.info("Execute list ProductIndex");
		
		return this.productIndexDAO.list(flag);
	}

}
