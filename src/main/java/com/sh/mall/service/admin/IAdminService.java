package com.sh.mall.service.admin;

import java.util.List;

import com.sh.mall.domain.Admin;

public interface IAdminService {

	/**
	 * user login verify
	 * @param name
	 * @return
	 */
	public boolean identityVerify(String pwd,String name);
	
	/**
	 * show self infomation
	 * @param name
	 */
	public Admin showself(String name);
	
	/**
	 * show all infomation
	 */
	public List<Admin> showAll();
	
	/**
	 * validate name unique
	 * @param name
	 */
	public boolean validateUnique(String name);
	
	/**
	 * add new admin
	 */
	public void addAdmin(Admin admin);
	
	/**
	 * delete admins
	 */
	public void deleteAdmins(List<Integer> admin_ids);
	
	/**
	 * update admin
	 */
	public void updateAdmin(Admin admin);
}
