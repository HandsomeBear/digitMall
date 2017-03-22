package com.sh.mall.web.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.mall.domain.Admin;
import com.sh.mall.service.admin.IAdminService;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private IAdminService adminService;
	
	/**
	 * 显示个人信息
	 * @return
	 */
	@RequestMapping(value="/admin/showself",method=RequestMethod.GET)
	public String showself(HttpServletRequest request,Model model){
		logger.info("Execute showself");
		
		String loginName = (String)request.getSession().getAttribute("LoginAdminName");
		Admin admin = this.adminService.showself(loginName);
		model.addAttribute("admin",admin);
		
		return "mall/admin/administrator/showself";
	}
	
	/**
	 * 显示所有管理员--超级管理员
	 * @return
	 */
	@RequestMapping(value="/admin/showAll",method=RequestMethod.GET)
	public String showAll(Model model){
		logger.info("Execute showAll");
		
		List<Admin> admins = this.adminService.showAll();
		model.addAttribute("admins", admins);
		
		return "mall/admin/administrator/showall";
	}
	
	/**
	 * 转到修改密码页面
	 * @return
	 */
	@RequestMapping(value="/admin/toChangePwd",method=RequestMethod.GET)
	public String toChangePwd(){
		logger.info("Execute toChangePwd");
		
		return "mall/admin/administrator/changepwd";
	}
	
	@RequestMapping(value="/admin/validateEquals",method=RequestMethod.POST)
	public @ResponseBody String validateEquals(@RequestBody String cPwd,HttpServletRequest request){
		logger.info("Execute validateEquals");
		
		String name = (String)request.getSession().getAttribute("LoginAdminName");
		if(!this.adminService.identityVerify(cPwd, name)){
			return "FAILURE";
		}
		
		return "SUCCESS";
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	@RequestMapping(value="/admin/changePwd",method=RequestMethod.POST)
	public @ResponseBody String changePwd(@RequestBody String rPwd,HttpServletRequest request){
		logger.info("Execute changePwd");
		
		String name = (String)request.getSession().getAttribute("LoginAdminName");
		String ip = request.getRemoteAddr();
		
		Admin admin = new Admin();
		admin.setName(name);
		admin.setPassword(rPwd);
		admin.setUpd_user(name);
		admin.setUpd_date(new Date());
		admin.setUpd_ip(ip);
		
		this.adminService.updateAdmin(admin);
		
		return "SUCCESS";
	}
	
	/**
	 * 验证是否重复
	 * @return
	 */
	@RequestMapping(value="/admin/validateUnique",method=RequestMethod.POST)
	public @ResponseBody String validateUnique(@RequestBody String name){
		logger.info("Execute validateUnique");
		
		if(!this.adminService.validateUnique(name)){
			return "FAILURE";
		}
		return "SUCCESS";
	}
	
	/**
	 * 新增管理员--超级管理员
	 * 若为普通管理员则无此功能
	 * @return
	 */
	@RequestMapping(value="/admin/add",method=RequestMethod.POST)
	public @ResponseBody String addOne(@RequestBody AdminFormBean bean,
			HttpServletRequest request){
		logger.info("Execute addOne");
		
		String upd_user = (String)request.getSession().getAttribute("LoginAdminName");
		String ip = request.getRemoteAddr();
		
		Admin admin = new Admin();
		admin.setName(bean.getName());
		admin.setPassword(bean.getPassword());
		admin.setPermiss_id("1,2,3");
		admin.setSuper_admin(bean.getSuper_admin());
		admin.setUpd_user(upd_user);
		admin.setUpd_date(new Date());
		admin.setUpd_ip(ip);
		this.adminService.addAdmin(admin);
		
		return "SUCCESS";
	}
	
	/**
	 * 批量删除--超级管理员
	 * 若为普通管理员则无此功能
	 * @return
	 */
	@RequestMapping(value="/admin/delete",method=RequestMethod.POST)
	public @ResponseBody String delete(@RequestParam String admin_ids){
		logger.info("Execute delete");
		
		String[] ids = admin_ids.split(",");
		List<Integer> adminids = new ArrayList<Integer>();
		for(int i = 0;i < ids.length;i++){
			adminids.add(Integer.valueOf(ids[i]));
		}
		this.adminService.deleteAdmins(adminids);
		
		return "SUCCESS";
	}
	
	/**
	 * 转到修改页面
	 * @return
	 */
	@RequestMapping(value="/admin/toUpdate",method=RequestMethod.POST)
	public String toUpdate(){
		logger.info("Execute toUpdate");
		
		return null;
	}
}
