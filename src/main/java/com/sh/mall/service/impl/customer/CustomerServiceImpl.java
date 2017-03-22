package com.sh.mall.service.impl.customer;

import java.util.List;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Sha512Hash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.sh.mall.domain.Customer;
import com.sh.mall.repository.customer.ICustomerDAO;
import com.sh.mall.service.customer.ICustomerService;

@Service
@PropertySource("classpath:project.properties")
public class CustomerServiceImpl implements ICustomerService {
	private static final Logger logger = LoggerFactory.getLogger(CustomerServiceImpl.class);
	
	private SecureRandomNumberGenerator generator = new SecureRandomNumberGenerator();
	
	@Autowired
	private ICustomerDAO customerDAO;
	
	@Autowired
	private Environment environment;

	/**
	 * 验证用户名唯一
	 */
	@Override
	public boolean validUnique(String nickname) {
		logger.info("Execute validUnique");
		
		List<Customer> customers = this.customerDAO.validUnique(nickname);
		if(customers!=null&&customers.size()!=0){
			return false;
		}
		return true;
	}

	/**
	 * 用户注册
	 */
	@Override
	public void addCustomer(Customer customer) {
		logger.info("Execute addCustomer");
		
		customer.setSalt(this.getSalt());
		customer.setPassword(this.getEncodePassword(customer.getPassword(), customer.getSalt()));
		
		this.customerDAO.addCustomer(customer);
	}
	
	/**
	 * 根据nickname得到Customer
	 */
	@Override
	public Customer findCustomerByNickname(String nickname) {
		logger.info("Execute findCustomerByNickname");
		
		return this.customerDAO.findCustomerByNickname(nickname);
	}
	
	/**
	 * 保存用户修改信息
	 */
	@Override
	public void saveCustomer(Customer customer) {
		logger.info("Execute saveCustomer");
		
		this.customerDAO.saveCustomer(customer);
	}
	
	private String getSalt() {
		return this.generator.nextBytes().toBase64();
	}
	
	private String getCombinedSalt(String salt) {
		return this.environment.getProperty("shiro.applicationSalt") + ":" + salt;
	}
	
	private String getEncodePassword(String password, String salt) {
		return new Sha512Hash(password, getCombinedSalt(salt), getHashIterations()).toBase64();
	}
	
	private Integer getHashIterations() {
		return Integer.parseInt(this.environment.getProperty("shiro.hashIterations"));
	}

}
