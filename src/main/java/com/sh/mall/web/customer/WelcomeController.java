package com.sh.mall.web.customer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {	
	private static final Logger logger = LoggerFactory.getLogger(WelcomeController.class);

	/**
	 * 转到index页面
	 * @return index页面
	 */
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String welcome() {
		logger.info("Execute welcome!");
		
		return "redirect:/index";
	}
	
}
