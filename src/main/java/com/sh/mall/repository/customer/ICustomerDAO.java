package com.sh.mall.repository.customer;

import java.util.List;

import com.sh.mall.domain.Customer;

public interface ICustomerDAO {
	
	/**
	 * valid nickname unique
	 * @param nickrname
	 * @return
	 */
	public List<Customer> validUnique(String nickname);
	
	/**
	 * add customer
	 * @param customer
	 */
	public void addCustomer(Customer customer);
	
	/**
	 * get customer by nickname
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
