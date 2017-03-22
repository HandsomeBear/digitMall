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

import com.sh.mall.domain.PwdSalt;
import com.sh.mall.repository.customer.IChangePwdDAO;

@Repository
public class ChangePwdDAOImpl implements IChangePwdDAO{
	private static final Logger logger = LoggerFactory.getLogger(ChangePwdDAOImpl.class);
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	/**
	 * 取得密码
	 */
	@Override
	public PwdSalt getPassword(String nickname) {
		logger.info("Execute getPassword");
		
		String getPasswordsql = "SELECT password,salt FROM tb_customer WHERE nickname=?";
		List<PwdSalt> pwdSalts = this.jdbcTemplate.query(getPasswordsql, new Object[]{nickname},
				new RowMapper<PwdSalt>(){

					@Override
					public PwdSalt mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						PwdSalt pwdSalt = new PwdSalt();
						pwdSalt.setPassword(rs.getString("password"));
						pwdSalt.setSalt(rs.getString("salt"));
						
						return pwdSalt;
					}
		});
		if(pwdSalts!=null&&pwdSalts.size()!=0){
			return pwdSalts.get(0);
		}
		return new PwdSalt();
	}
	
	/**
	 * 保存修改的密码
	 * @param nickname
	 */
	@Override
	public void savePassword(String newPwd,String nickname) {
		logger.info("Execute savePassword");
		
		String savePasswordsql = "UPDATE tb_customer SET password=? WHERE nickname=?";
		this.jdbcTemplate.update(savePasswordsql,new Object[]{newPwd,nickname});
	}
}
