package com.sh.mall.web.customer;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
//	@Autowired
//	private IProductIndexService productIndexService;
	/**
	 * 转到主页面
	 * @return 主页面
	 */
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String toIndex(HttpServletRequest request) {
		logger.info("Execute toIndex!");
		
//		List<ProductIndex> discounts = productIndexService.list("discount");
//		List<ProductIndex> cate_1 = productIndexService.list("category_1");
//		List<ProductIndex> cate_2 = productIndexService.list("category_2");
//		List<ProductIndex> cate_3 = productIndexService.list("category_3");
//
//		request.getSession().setAttribute("discounts", discounts);
//		request.getSession().setAttribute("cate_1", cate_1);
//		request.getSession().setAttribute("cate_2", cate_2);
//		request.getSession().setAttribute("cate_3", cate_3);
		
		return "mall/index";
	}
	
}
