package com.sh.mall.web.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.mall.domain.DigitList;
import com.sh.mall.service.customer.IDigitDetailService;
import com.sh.mall.util.PageUtil;

@Controller
public class DigitListController {
	private static final Logger logger = LoggerFactory.getLogger(DigitListController.class);
	
	@Autowired
	private IDigitDetailService digitDetailService;
	
	@RequestMapping(value="/showdigitlist",method=RequestMethod.GET)
	public String showDigitList(@RequestParam String flag,@RequestParam String currentPage,
			HttpServletRequest request){
		logger.info("Execute showDigitList");
		
		if(flag!=null&&flag!=""){
			request.getSession().setAttribute("flag", flag);
		}else{
			flag = (String)request.getSession().getAttribute("flag");
		}
		
		Map<String,String> searchCon = getSearchCon(request);
		logger.info(searchCon.get("brand"));
		try{
			PageUtil pageUtil = new PageUtil();
			pageUtil.setCurrentPage(1);
			pageUtil.setPagesize(9);
			if (currentPage != null) {
				Integer currentPages = Integer.valueOf(currentPage);
				pageUtil.setCurrentPage(currentPages);
			}
			pageUtil.setTotalPage(pageUtil.getTotalData());
			pageUtil.setTotalData(Integer.valueOf(this.digitDetailService.getDataAmountByType(flag,searchCon)));
			logger.info("totalData:"+pageUtil.getTotalData());
			int totalPage = 0;
			if(pageUtil.getTotalData()%pageUtil.getPagesize()==0){
				totalPage=pageUtil.getTotalData()/pageUtil.getPagesize();
			}else{
				totalPage=(pageUtil.getTotalData()/pageUtil.getPagesize())+1;
			}
			logger.info("totalPage:"+totalPage);
			pageUtil.setTotalPage(totalPage);
			
			List<DigitList> digits = digitDetailService.list(flag, pageUtil,searchCon);
			
//			request.getSession().setAttribute("digits", digits);
//			request.getSession().setAttribute("pageUtil", pageUtil);
			request.setAttribute("digits", digits);
			request.setAttribute("pageUtil", pageUtil);
		}catch(Exception e){
			logger.warn("Show Digit List Fail",e);
			
			return "mall/index";
		}
		if(!flag.matches("\\d+(.\\d+)?")){
			return "mall/customer/searchlist";
		}
		return "mall/customer/digitlist";
	}
	
	@RequestMapping(value="/buildsearchcondition",method=RequestMethod.POST)
	public @ResponseBody String buildSearchCondition(@RequestBody DigitListSearchFormBean searchForm,
			HttpServletRequest request){
		logger.info("Execute buildSearchCondition");
		logger.info("pricefrom:"+searchForm.getPriceFrom());
		logger.info("priceto:"+searchForm.getPriceTo());
		logger.info("orderby:"+searchForm.getOrderBy());
		logger.info("brand:"+searchForm.getBrand());
		
		if(searchForm.getPriceFrom()!=null&&!"".equals(searchForm.getPriceFrom())){
			if("del".equals(searchForm.getPriceFrom())){
				request.getSession().removeAttribute("pricefrom");
			}else{				
				request.getSession().setAttribute("pricefrom", searchForm.getPriceFrom());
			}
		}
		if(searchForm.getPriceTo()!=null&&!"".equals(searchForm.getPriceTo())){
			if("del".equals(searchForm.getPriceTo())){
				request.getSession().removeAttribute("priceto");
			}else{				
				request.getSession().setAttribute("priceto", searchForm.getPriceTo());
			}
		}
		if(searchForm.getOrderBy()!=null&&!"".equals(searchForm.getOrderBy())){
			if("del".equals(searchForm.getOrderBy())){				
				request.getSession().removeAttribute("orderby");
			}else{				
				request.getSession().setAttribute("orderby", searchForm.getOrderBy());
			}
		}
		if(searchForm.getBrand()!=null&&!"".equals(searchForm.getBrand())){
			if("del".equals(searchForm.getBrand())){				
				request.getSession().removeAttribute("brand");
			}else{
				request.getSession().setAttribute("brand", searchForm.getBrand());				
			}
		}
		
		return "SUCCESS";
	}
	
	public Map<String,String> getSearchCon(HttpServletRequest request){
		logger.info("Execute getSearchCon");
		
		Map<String,String> searchCon = new HashMap<String,String>();
		if(request.getSession().getAttribute("pricefrom")!=null
				&&!"".equals(request.getSession().getAttribute("pricefrom"))){
			searchCon.put("pricefrom", (String)request.getSession().getAttribute("pricefrom"));
		}
		if(request.getSession().getAttribute("priceto")!=null
				&&!"".equals(request.getSession().getAttribute("priceto"))){
			searchCon.put("priceto", (String)request.getSession().getAttribute("priceto"));
		}
		if(request.getSession().getAttribute("orderby")!=null
				&&!"".equals(request.getSession().getAttribute("orderby"))){
			searchCon.put("orderby", (String)request.getSession().getAttribute("orderby"));
		}
		if(request.getSession().getAttribute("brand")!=null
				&&!"".equals(request.getSession().getAttribute("brand"))){
			searchCon.put("brand", (String)request.getSession().getAttribute("brand"));
		}
		
		return searchCon;
	}
}
