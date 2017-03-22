package com.sh.mall.service.impl.customer;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.mall.domain.ReceiptAddress;
import com.sh.mall.repository.customer.IAddressDAO;
import com.sh.mall.service.customer.IAddressService;

@Service
public class AddressServiceImpl implements IAddressService {
	private static final Logger logger = LoggerFactory.getLogger(AddressServiceImpl.class);
	
	@Autowired
	private IAddressDAO addressDAO;
	
	/**
	 * 列表收货地址
	 */
	@Override
	public List<ReceiptAddress> showReceiptAddress(String nickname) {
		logger.info("Execute showReceiptAddress");
		
		return this.addressDAO.showReceiptAddress(nickname);
	}
	
	/**
	 * 保存新增的收货地址
	 */
	@Override
	public void saveReceiptAddress(ReceiptAddress address) {
		logger.info("Execute saveReceiptAddress");
		
		this.addressDAO.saveReceiptAddress(address);
	}

	/**
	 * 删除地址
	 */
	@Override
	public void deleteReceiptAddress(List<Integer> address_ids) {
		logger.info("Execute deleteReceiptAddress");
		
		this.addressDAO.deleteReceiptAddress(address_ids);
	}

}
