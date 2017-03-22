package com.sh.mall.repository.customer;

import com.sh.mall.domain.PwdSalt;

public interface IChangePwdDAO {
	/**
	 * get password
	 * @param nickname
	 * @return
	 */
	public PwdSalt getPassword(String nickname);
	
	/**
	 * save changed password
	 * @param nickname
	 */
	public void savePassword(String newPwd,String nickname);
}
