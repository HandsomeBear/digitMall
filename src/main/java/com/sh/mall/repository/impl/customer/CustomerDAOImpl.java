package com.sh.mall.repository.impl.customer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.sh.mall.domain.Customer;
import com.sh.mall.repository.customer.ICustomerDAO;

@Repository
public class CustomerDAOImpl implements ICustomerDAO {
	private static final Logger logger = LoggerFactory.getLogger(CustomerDAOImpl.class);
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	/**
	 * 验证用户名唯一
	 */
	@Override
	public List<Customer> validUnique(String nickname) {
		logger.info("Execute validUnique");
		
		String validUniquesql = "SELECT nickname FROM tb_customer WHERE nickname = ?";
		
		return this.jdbcTemplate.query(validUniquesql, new Object[]{nickname}, new RowMapper<Customer>(){
			
			@Override
			public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
				Customer user = new Customer();
				user.setNickname(rs.getString("nickname"));
				
				return user;
			}		
		});
	}

	/**
	 * 添加新的customer
	 */
	@Override
	public void addCustomer(Customer customer) {
		logger.info("Execute addCustomer");
		
		String addCustomersql = "INSERT INTO tb_customer(nickname,password,salt) VALUES(?,?,?)";
		
		this.jdbcTemplate.update(addCustomersql,new Object[]{customer.getNickname(),
				customer.getPassword(),customer.getSalt()});
	}

	/**
	 * 根据nickname得到Customer
	 */
	@Override
	public Customer findCustomerByNickname(String nickname) {
		logger.info("Execute findCustomerByNickname");
		
		StringBuffer findCustomersql = new StringBuffer();
		findCustomersql.append(" SELECT user_id, nickname,password,realname,sex,");
		findCustomersql.append(" birth_date,home_adress,phone,email ");
		findCustomersql.append(" FROM tb_customer WHERE nickname=? ");
		
		List<Customer> customers =  this.jdbcTemplate.query(findCustomersql.toString(), 
				new Object[]{nickname}, new RowMapper<Customer>(){

			@Override
			public Customer mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				Customer customer = new Customer();
				customer.setUser_id(rs.getInt("user_id"));
				customer.setNickname(rs.getString("nickname"));
				customer.setPassword(rs.getString("password"));
				customer.setRealname(rs.getString("realname"));
				customer.setSex(rs.getString("sex"));
				customer.setBirth_date(rs.getString("birth_date"));
				customer.setHome_adress(rs.getString("home_adress"));
				customer.setPhone(rs.getString("phone"));
				customer.setEmail(rs.getString("email"));
				
				return customer;
			}
			
		});
		
		if(customers!=null&&customers.size()!=0){
			return customers.get(0);
		}
		return new Customer();
	}

	/**
	 * 保存用户修改信息
	 */
	@Override
	public void saveCustomer(Customer customer) {
		logger.info("Execute saveCustomer");
		
		StringBuffer saveCustomersql = new StringBuffer();
		saveCustomersql.append(" UPDATE tb_customer SET realname=?,sex=?,birth_date=?,");
		saveCustomersql.append(" home_adress=?,phone=?,email=? WHERE nickname=? ");
		this.jdbcTemplate.update(saveCustomersql.toString(), new Object[]{
			customer.getRealname(),customer.getSex(),customer.getBirth_date(),
			customer.getHome_adress(),customer.getPhone(),customer.getEmail(),
			customer.getNickname()
		});
	}

}
