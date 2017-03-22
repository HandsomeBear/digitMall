package com.sh.mall.web.customer;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.mall.domain.Comment;
import com.sh.mall.domain.OrderExt;
import com.sh.mall.service.customer.IOrderService;
import com.sh.mall.util.LoginUserInfoUtil;
import com.sh.mall.util.PageUtil;

@Controller
public class OrderQueryController {
	private static final Logger logger = LoggerFactory.getLogger(OrderQueryController.class);
	
	private static final String SUCCESS = "SUCCESS";
	private static final String FAIL = "FAIL";
	
	@Autowired
	private IOrderService orderService;
	
	@RequestMapping(value="/toorderquerypage",method=RequestMethod.GET)
	public String toOrderQueryPage(){
		logger.info("Execute toOrderQueryPage");
		
		return "mall/customer/orderquery";
	}
	
	@RequestMapping(value="/orderquery",method=RequestMethod.POST)
	public @ResponseBody List<OrderExt> queryOrder(@RequestBody OrderQueryInput input){
		logger.info("Execute queryOrder");
		
		logger.info(input.getFlag()+":"+input.getCurrentPage());
		String flag = input.getFlag();
		String currentPage = input.getCurrentPage();
		String nikcname = LoginUserInfoUtil.getLoginUsername();
		
		try{
			PageUtil pageUtil = new PageUtil();
			pageUtil.setCurrentPage(1);
			pageUtil.setPagesize(10);
			if (currentPage != null) {
				Integer currentPages = Integer.valueOf(currentPage);
				pageUtil.setCurrentPage(currentPages);
			}
			pageUtil.setTotalPage(pageUtil.getTotalData());
			pageUtil.setTotalData(Integer.valueOf(this.orderService.getDataAmount(flag)));
			int totalPage = 0;
			if(pageUtil.getTotalData()%pageUtil.getPagesize()==0){
				totalPage=pageUtil.getTotalData()/pageUtil.getPagesize();
			}else{
				totalPage=(pageUtil.getTotalData()/pageUtil.getPagesize())+1;
			}
			logger.info("totalPage:"+totalPage);
			pageUtil.setTotalPage(totalPage);
			
			List<OrderExt> orderExts = orderService.queryOrderByCon(flag, pageUtil,nikcname);
			if(orderExts!=null&&orderExts.size()!=0){
				logger.info("orderExts:"+orderExts.size());
				orderExts.get(0).setPageUtil(pageUtil);
			}
			return orderExts;
		}catch(Exception e){
			logger.warn("Query Order Fail!",e);
			return null;
		}
	}
	
	@RequestMapping(value="/judge",method=RequestMethod.POST)
	public @ResponseBody String judge(@RequestBody OrderInfoOutput input){
		logger.info("Execute judge");
		
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.getSession().setAttribute("judgeInfo", input);
		
		return SUCCESS;
	}
	//确认收货
	@RequestMapping(value="/tojudge",method=RequestMethod.GET)
	public String toJudge(){
		logger.info("Execute toJudge");
		
		return "mall/customer/judge";
	}
	//去评论
	@RequestMapping(value="/tojudgeforcomment",method=RequestMethod.GET)
	public String toJudgeforcomment(){
		logger.info("Execute tojudgeforcomment");
		
		return "mall/customer/judgeforcomment";
	}
	
	@RequestMapping(value="/querybyorderno",method=RequestMethod.POST)
	public @ResponseBody OrderExt queryByOrderNo(@RequestBody QueryByOrderNoInput input){
		logger.info("Execute queryByOrderNo");
		logger.info(input.getOrderno());
		String nickname = LoginUserInfoUtil.getLoginUsername();
		try{
			return this.orderService.queryOrderByOrderNo(input.getOrderno(), nickname);
		}catch(Exception e){
			logger.warn("Query By OrderNo Fail!",e);
			
			return null;
		}
	}
	
	@RequestMapping(value="/receive",method=RequestMethod.POST)
	public @ResponseBody String receive(@RequestBody QueryByOrderNoInput input){
		logger.info("Execute receive");
		logger.info(input.getOrderno());
		try{
			orderService.receive(input.getOrderno(),input.getDigital_id());
			return SUCCESS;
		}catch(Exception e){
			logger.warn("Receive Fail!",e);
			
			return FAIL;
		}
	}
	
	@RequestMapping(value="/executejudge",method=RequestMethod.POST)
	public @ResponseBody String executeJudge(@RequestBody CommentInput input){
		logger.info("Execute executeJudge");
		
		String nickname = LoginUserInfoUtil.getLoginUsername();
		Comment comment = new Comment();
		
		comment.setNickname(nickname);
		comment.setDigital_id(input.getDigital_id());
		comment.setComments(input.getComments());
		comment.setRank(input.getRank());
		comment.setComment_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		comment.setColor(input.getColor());
		comment.setVersion(input.getVersion());
		
		String orderno = input.getOrderno();
		try{
			orderService.judge(comment, orderno);
			return SUCCESS;
		}catch(Exception e){
			logger.warn("Execute Judge Fail!",e);
			
			return FAIL;
		}
	}
	
	@RequestMapping(value="/refund",method=RequestMethod.POST)
	public @ResponseBody String refund(@RequestBody QueryByOrderNoInput input){
		logger.info("Execute refund");
		
		try{
			orderService.refund(input.getOrderno());
			return SUCCESS;
		}catch(Exception e){
			logger.warn("Refund Fail!",e);
			
			return FAIL;
		}
	}
}
