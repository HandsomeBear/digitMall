package com.sh.mall.repository.customer;

import java.util.List;

import com.sh.mall.domain.ReceiptAddress;

public interface IAddressDAO {

	/**
	 * show list of receipt address
	 * @param nickname
	 * @return
	 */
	public List<ReceiptAddress> showReceiptAddress(String nickname);
	
	/**
	 * save receipt address
	 * @param nickname
	 */
	public void saveReceiptAddress(ReceiptAddress address);
	
	/**
	 * delete receipt address
	 */
	public void deleteReceiptAddress(final List<Integer> address_ids);
}
