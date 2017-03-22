package com.sh.mall.web.customer;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogoutController {
	private static final Logger logger = LoggerFactory.getLogger(LogoutController.class);
	
	/**
	 * 退出系统，转到登录页面
	 * @return 登录页面
	 */
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout() {
		logger.info("Execute logout!");
		
		SecurityUtils.getSubject().logout();
		
		return "redirect:/login";
	}

}
