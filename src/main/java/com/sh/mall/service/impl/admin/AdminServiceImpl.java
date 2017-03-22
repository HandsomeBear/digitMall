package com.sh.mall.service.impl.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.mall.domain.Admin;
import com.sh.mall.repository.admin.IAdminDAO;
import com.sh.mall.service.admin.IAdminService;

@Service
public class AdminServiceImpl implements IAdminService {
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	private IAdminDAO adminDAO;
	
	/**
	 * 用户登录验证
	 */
	@Override
	public boolean identityVerify(String pwd,String name) {
		logger.info("Execute identityVerify");
		
		if(pwd.equals(this.adminDAO.getPwdByName(name))){
			return true;
		}
		return false;
	}

	/**
	 * 显示自身信息
	 */
	@Override
	public Admin showself(String name) {
		logger.info("Execute showself");
		
		return this.adminDAO.showself(name);
	}

	/**
	 * 显示所有信息--超级管理员
	 */
	@Override
	public List<Admin> showAll() {
		logger.info("Execute showAll");
		
		return this.adminDAO.showAll();
	}
	
	/**
	 * 检测用户名唯一
	 * false即不唯一
	 */
	@Override
	public boolean validateUnique(String name) {
		logger.info("Execute validateUnique");
		
		return this.adminDAO.validateUnique(name);
	}

	/**
	 * 添加管理员
	 */
	@Override
	public void addAdmin(Admin admin) {
		logger.info("Execute addAdmin");
		
		this.adminDAO.addAdmin(admin);
	}

	/**
	 * 删除管理员
	 */
	@Override
	public void deleteAdmins(List<Integer> admin_ids) {
		logger.info("Execute deleteAdmins");
		
		this.adminDAO.deleteAdmins(admin_ids);
	}

	/**
	 * 更新管理员信息
	 */
	@Override
	public void updateAdmin(Admin admin) {
		logger.info("Execute updateAdmin");
		
		this.adminDAO.updateAdmin(admin);
	}

}
