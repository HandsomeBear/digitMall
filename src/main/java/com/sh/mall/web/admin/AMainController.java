package com.sh.mall.web.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AMainController {
	private static final Logger logger = LoggerFactory.getLogger(AMainController.class);
	
	/**
	 * 转到主页面
	 * @return 转到主页面
	 */
	@RequestMapping(value="/admin/index", method=RequestMethod.GET)
	public String toIndex() {
		logger.info("Execute toIndex!");
		
		return "mall/admin/index";
	}
	
}
