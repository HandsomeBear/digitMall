package com.sh.mall.service.impl.customer;

import org.apache.shiro.crypto.hash.Sha512Hash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.sh.mall.domain.PwdSalt;
import com.sh.mall.repository.customer.IChangePwdDAO;
import com.sh.mall.service.customer.IChangePwdService;

@Service
public class ChangePwdServiceImpl implements IChangePwdService{
	private static final Logger logger = LoggerFactory.getLogger(ChangePwdServiceImpl.class);
	
	@Autowired
	private IChangePwdDAO changePwdDAO;
	
	@Autowired
	private Environment environment;
	
	/**
	 * 得到password,salt
	 */
	@Override
	public PwdSalt getPassword(String nickname) {
		logger.info("Execute getPasswordSalt");
		
		return this.changePwdDAO.getPassword(nickname);
	}

	/**
	 * 比较输入的密码是否一致
	 */
	@Override
	public boolean comparePwds(String pwd, PwdSalt pwdSalt) {
		logger.info("Execute comparePwds");
		
		String salt = pwdSalt.getSalt();
		String enPwd = this.getEncodePassword(pwd, salt);
		if(enPwd.equals(pwdSalt.getPassword())){
			return true;
		}
		return false;
	}

	/**
	 * 保存修改的密码
	 */
	@Override
	public void savePassword(String newPwd, PwdSalt pwdSalt,String nickname) {
		logger.info("Execute savePassword");
		
		String salt = pwdSalt.getSalt();
		String enNewPwd = this.getEncodePassword(newPwd, salt);
		this.changePwdDAO.savePassword(enNewPwd, nickname);
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
