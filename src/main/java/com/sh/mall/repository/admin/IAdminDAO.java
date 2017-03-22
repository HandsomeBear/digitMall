package com.sh.mall.repository.admin;

import java.util.List;

import com.sh.mall.domain.Admin;

public interface IAdminDAO {

	/**
	 * get pwd by name
	 * @param name
	 * @return
	 */
	public String getPwdByName(String name);
	
	/**
	 * show self information
	 * @param name
	 */
	public Admin showself(String name);
	
	/**
	 * show all information
	 */
	public List<Admin> showAll();
	
	/**
	 * validate name unique
	 * @param name
	 */
	public boolean validateUnique(String name);
	
	/**
	 * add a new admin
	 */
	public void addAdmin(Admin admin);
	
	/**
	 * delete admins
	 */
	public void deleteAdmins(List<Integer> admin_ids);
	
	/**
	 * save updated admin
	 */
	public void updateAdmin(Admin admin);
}
