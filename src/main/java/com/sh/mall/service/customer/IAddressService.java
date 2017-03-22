package com.sh.mall.service.customer;

import java.util.List;

import com.sh.mall.domain.ReceiptAddress;

public interface IAddressService {

	/**
	 * show list of receipt address
	 * @param nickname
	 * @return
	 */
	public List<ReceiptAddress> showReceiptAddress(String nickname);
	
	/**
	 * save receipt address
	 * @param address
	 */
	public void saveReceiptAddress(ReceiptAddress address);
	
	/**
	 * delete receipt address
	 * @param address_ids
	 */
	public void deleteReceiptAddress(List<Integer> address_ids);
}
