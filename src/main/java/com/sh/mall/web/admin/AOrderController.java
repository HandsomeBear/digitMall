package com.sh.mall.web.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.sh.mall.domain.Order;
import com.sh.mall.domain.OrderAdmin;
import com.sh.mall.service.admin.IAOrderService;
import com.sh.mall.util.PageUtil;

@Controller
public class AOrderController {
	private static final Logger logger = LoggerFactory.getLogger(AOrderController.class);
	
	@Autowired
	private IAOrderService aorderService;
	
	@RequestMapping(value="/admin/tosend",method=RequestMethod.GET)
	public String toSend(@RequestParam String currentPage,HttpServletRequest request){
		logger.info("Execute toSend");
		
		Map<String,String> con = getSearchCon(request);
		
		try{
			PageUtil pageUtil = new PageUtil();
			pageUtil.setCurrentPage(1);
			pageUtil.setPagesize(8);
			if (currentPage != null) {
				Integer currentPages = Integer.valueOf(currentPage);
				pageUtil.setCurrentPage(currentPages);
			}
			pageUtil.setTotalPage(pageUtil.getTotalData());
			pageUtil.setTotalData(Integer.valueOf(this.aorderService.getOrderSize("P",con)));
			logger.info("totalData:"+pageUtil.getTotalData());
			int totalPage = 0;
			if(pageUtil.getTotalData()%pageUtil.getPagesize()==0){
				totalPage=pageUtil.getTotalData()/pageUtil.getPagesize();
			}else{
				totalPage=(pageUtil.getTotalData()/pageUtil.getPagesize())+1;
			}
			logger.info("totalPage:"+totalPage);
			pageUtil.setTotalPage(totalPage);
			
			List<OrderAdmin> orders = aorderService.getToSendOrder(pageUtil,con);
			
			request.setAttribute("orders", orders);
			request.setAttribute("pageUtil", pageUtil);
		}catch(Exception e){
			logger.warn("Show Send Order List Fail",e);
			
			return "mall/admin/index";
		}
		return "mall/admin/order/send";
	}
	
	@RequestMapping(value="/admin/torefund",method=RequestMethod.GET)
	public String toRefund(@RequestParam String currentPage,HttpServletRequest request){
		logger.info("Execute toRefund");
		
		Map<String,String> con = getSearchCon(request);
		
		try{
			PageUtil pageUtil = new PageUtil();
			pageUtil.setCurrentPage(1);
			pageUtil.setPagesize(8);
			if (currentPage != null) {
				Integer currentPages = Integer.valueOf(currentPage);
				pageUtil.setCurrentPage(currentPages);
			}
			pageUtil.setTotalPage(pageUtil.getTotalData());
			pageUtil.setTotalData(Integer.valueOf(this.aorderService.getOrderSize("R",con)));
			logger.info("totalData:"+pageUtil.getTotalData());
			int totalPage = 0;
			if(pageUtil.getTotalData()%pageUtil.getPagesize()==0){
				totalPage=pageUtil.getTotalData()/pageUtil.getPagesize();
			}else{
				totalPage=(pageUtil.getTotalData()/pageUtil.getPagesize())+1;
			}
			logger.info("totalPage:"+totalPage);
			pageUtil.setTotalPage(totalPage);
			
			List<OrderAdmin> orders = aorderService.getToRefundOrder(pageUtil, con);
			
			request.setAttribute("orders", orders);
			request.setAttribute("pageUtil", pageUtil);
		}catch(Exception e){
			logger.warn("Show Send Order List Fail",e);
			
			return "mall/admin/index";
		}
		
		return "mall/admin/order/refund";
	}
	
	@RequestMapping(value="/admin/buildsearchcon",method=RequestMethod.POST)
	public @ResponseBody String buildSearchCondition(@RequestBody AOrderSearchInput con,
			HttpServletRequest request){
		logger.info("Execute buildSearchCondition");
		
		if(con.getOrderno()!=null&&!"".equals(con.getOrderno())){
			request.getSession().setAttribute("orderno", con.getOrderno());
		}else{
			request.getSession().removeAttribute("orderno");
		}
		return "SUCCESS";
	}
	
	public Map<String,String> getSearchCon(HttpServletRequest request){
		logger.info("Execute getSearchCon");
		
		Map<String,String> con = new HashMap<String,String>();
		if(request.getSession().getAttribute("orderno")!=null
				&&!"".equals(request.getSession().getAttribute("orderno"))){
			con.put("orderno", (String)request.getSession().getAttribute("orderno"));
		}
		
		return con;
	}
	
	@RequestMapping(value="/admin/send",method=RequestMethod.POST)
	public @ResponseBody String send(@RequestBody AOrderSearchInput input,
			HttpServletRequest request){
		logger.info("Execute send");
		
		Order order = new Order();
		order.setOrder_no(input.getOrderno());
		order.setSendDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		order.setUpd_user((String)request.getSession().getAttribute("LoginAdminName"));
		order.setUpd_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		order.setUpd_ip(request.getRemoteAddr());
		try{
			aorderService.send(order);
		}catch(Exception e){	
			logger.warn("Send Fail!",e);
			
			return "FAILURE";
		}
		return "SUCCESS";
	}
	
	@RequestMapping(value="/admin/refund",method=RequestMethod.POST)
	public @ResponseBody String refund(@RequestBody AOrderSearchInput input,
			HttpServletRequest request){
		logger.info("Execute refund");
		
		Order order = new Order();
		order.setOrder_no(input.getOrderno());
		order.setSendDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		order.setUpd_user((String)request.getSession().getAttribute("LoginAdminName"));
		order.setUpd_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		order.setUpd_ip(request.getRemoteAddr());
		try{
			aorderService.refund(order);
		}catch(Exception e){			
			logger.warn("Refund Fail!",e);
			
			return "FAILURE";
		}
		return "SUCCESS";
	}
}
