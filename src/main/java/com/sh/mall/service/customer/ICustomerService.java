package com.sh.mall.service.customer;

import com.sh.mall.domain.Customer;

public interface ICustomerService {

	/**
	 * valid nickname unique
	 * @param nickname
	 * @return
	 */
	public boolean validUnique(String nickname);
	
	/**
	 * customer register
	 * @param customer
	 */
	public void addCustomer(Customer customer);
	
	/**
	 * get Customer by nickname
	 * @param nickname
	 * @return
	 */
	public Customer findCustomerByNickname(String nickname);
	
	/**
	 * save customer infomation
	 * @param customer
	 */
	public void saveCustomer(Customer customer);
}
