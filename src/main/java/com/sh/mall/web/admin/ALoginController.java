package com.sh.mall.web.admin;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sh.mall.service.admin.IAdminService;
import com.sh.mall.web.customer.LoginUserFormBean;

@Controller
public class ALoginController {
	private static final Logger logger = LoggerFactory.getLogger(ALoginController.class);
	
	@Autowired
	private IAdminService adminService;
	
	/**
	 * 转到登录页面
	 * @return 登录页面
	 */
	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public String toLogin(HttpServletRequest request) {
		logger.info("Execute toLogin!");
		
		return "mall/admin/login";
	}
	
	/**
	 * 用户登录
	 * @param loginUser
	 * @param result
	 * @param request
	 * @return String
	 */
	@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	public String login(@Valid LoginUserFormBean loginUser, 
			BindingResult result, HttpServletRequest request, Model model) {
		logger.info("Execute login!");
		
		String loginMessage = null;
		
		if(result.hasErrors()){
			logger.info("Valid result has errors!");
			loginMessage = "用户名或密码非空!";
			model.addAttribute("loginMessage", loginMessage);
			return "mall/admin/login";
		}
		
		String name = loginUser.getUsername();
		String pwd = loginUser.getPassword();
		
		if(!this.adminService.identityVerify(pwd, name)){
			logger.info("Verify error!");
			loginMessage = "用户名或密码错误!";
			model.addAttribute("loginMessage", loginMessage);
	        return "mall/admin/login";
		}
		
		logger.info("Auth success!");
		request.getSession().setAttribute("LoginAdminName", name);
		
		return "redirect:/admin/index";				
	}
}
