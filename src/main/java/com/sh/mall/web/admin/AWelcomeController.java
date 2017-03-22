package com.sh.mall.web.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AWelcomeController {	
	private static final Logger logger = LoggerFactory.getLogger(AWelcomeController.class);

	/**
	 * 转到admin-login页面
	 * @return admin-login页面
	 */
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String welcome() {
		logger.info("Execute welcome!");
		
		return "redirect:/admin/login";
	}
	
}
