package com.sh.mall.service.customer;

import com.sh.mall.domain.PwdSalt;

public interface IChangePwdService {
	/**
	 * get password,salt
	 * @param nickname
	 * @return
	 */
	public PwdSalt getPassword(String nickname);
	
	/**
	 * compare input equals(old)?
	 * @param newPwd
	 * @param nickname
	 * @return
	 */
	public boolean comparePwds(String pwd,PwdSalt pwdSalt);
	
	/**
	 * save changed password
	 * @param newPwd
	 * @param pwdSalt
	 */
	public void savePassword(String newPwd,PwdSalt pwdSalt,String nickname);
}
