package com.sh.mall.web.customer;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.mall.domain.Cart;
import com.sh.mall.domain.Comment;
import com.sh.mall.domain.DigitDetail;
import com.sh.mall.domain.DigitDetailExt;
import com.sh.mall.service.customer.IDigitDetailService;
import com.sh.mall.util.PageUtil;

@Controller
public class DigitDetailsController {
	private static final Logger logger = LoggerFactory.getLogger(DigitDetailsController.class);
	
	private static final String SUCCESS = "SUCCESS";
	private static final String FAIL = "FAIL";
	
	@Autowired
	private IDigitDetailService digitDetailService;
	
	@RequestMapping(value="/digitdetails/{digit_id}",method=RequestMethod.GET)
	public String toDigitDetails(@PathVariable String digit_id,Model model){
		logger.info("Execute toDigitDetails");
		
		try{
			DigitDetail digital = this.digitDetailService.queryDigitDetailById(digit_id);
			List<String> versions = this.digitDetailService.getVersion(digit_id);
			List<String> colors = this.digitDetailService.getColor(digit_id);
			String commentamount = this.digitDetailService.getCommentsAmount(digit_id);
			
			model.addAttribute("digital", digital);
			model.addAttribute("versions", versions);
			model.addAttribute("colors", colors);
			model.addAttribute("commentamount", commentamount);
		}catch(Exception e){
			logger.warn("toDigitDetail Exception",e);
		}
		
		return "mall/customer/digitDetail";
	}
	
	@RequestMapping(value="/queryQuantityByCon",method=RequestMethod.POST)
	public @ResponseBody String queryQuantityByCon(@RequestBody DigitalQuantityQueryFormBean condition){
		logger.info("Execute queryQuantityByCon");
		
		try{
			return digitDetailService.queryQuantityByCon(condition);
		}catch(Exception e){
			logger.warn("Query QuantityByCon Exception",e);
			return null;
		}
	}
	
	@RequestMapping(value="/queryPriceByCon",method=RequestMethod.POST)
	public @ResponseBody DigitDetailExt queryPriceByCon(@RequestBody DigitalQuantityQueryFormBean condition){
		logger.info("Execute queryPriceByCon");
		
		try{
			return digitDetailService.queryPriceByCon(condition);
		}catch(Exception e){
			logger.warn("Query Price By Con Exception",e);
			return null;
		}
	}
	
	@RequestMapping(value="/querycomment",method=RequestMethod.POST)
	public @ResponseBody List<Comment> querycomment(//@PathVariable String digital_id,
			//@RequestParam(value = "currentPage", required = false) Integer currentPage,
			@RequestBody QueryCommentInput input,
			Model model){
		logger.info("Execute querycomment");
		logger.info(String.valueOf(input.getCurrentPage()+":"+input.getDigital_id()));
		String digital_id = input.getDigital_id();
		String currentPage = input.getCurrentPage();
		try{
			PageUtil pageUtil = new PageUtil();
			pageUtil.setCurrentPage(1);
			pageUtil.setPagesize(10);
			if (currentPage != null) {
				Integer currentPages = Integer.valueOf(currentPage);
				pageUtil.setCurrentPage(currentPages);
			}
			pageUtil.setTotalPage(pageUtil.getTotalData());
			pageUtil.setTotalData(Integer.valueOf(this.digitDetailService.getCommentsAmount(digital_id)));
			int totalPage = 0;
			if(pageUtil.getTotalData()%pageUtil.getPagesize()==0){
				totalPage=pageUtil.getTotalData()/pageUtil.getPagesize();
			}else{
				totalPage=(pageUtil.getTotalData()/pageUtil.getPagesize())+1;
			}
			logger.info("totalPage:"+totalPage);
			pageUtil.setTotalPage(totalPage);
			
			List<Comment> comments = digitDetailService.getCommentInfo(digital_id,pageUtil);
			if(comments!=null&&comments.size()!=0){
				logger.info("comments size:"+String.valueOf(comments.size()));
				comments.get(0).setPageUtil(pageUtil);
			}
			return comments;
		}catch(Exception e){
			logger.info("Query Comment Exception",e);
			return null;
		}
	}
	
	@RequestMapping(value="/checkislogin",method=RequestMethod.POST)
	public @ResponseBody String checkIsLogin(){
		logger.info("Execute checkIsLogin");
		
		Subject currentUser = SecurityUtils.getSubject();
		if(currentUser.getSession().getAttribute("loginUserName")==null){
			return FAIL;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/joincart",method=RequestMethod.POST)
	public @ResponseBody String joincart(@RequestBody Cart cart){
		logger.info("Execute joincart");
		
		Subject currentUser = SecurityUtils.getSubject();
		List<Cart> carts = (List<Cart>)currentUser.getSession().getAttribute("carts");
		if(carts==null){
			carts = new ArrayList<Cart>();
		}
		carts.add(cart);
		currentUser.getSession().setAttribute("carts", carts);
		
		return SUCCESS;
	}
	
	@RequestMapping(value="/businesslogin",method=RequestMethod.POST)
	public @ResponseBody String businessLogin(@Valid @RequestBody LoginUserFormBean loginUser,
			BindingResult result){
		logger.info("Execute businessLogin");
		
		if(result.hasErrors()){
			logger.info("Valid result has errors!");
			
			return FAIL;
		}
		String username = loginUser.getUsername();
		String password = loginUser.getPassword();
		
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		Subject currentUser = SecurityUtils.getSubject();
		try{
			currentUser.login(token);
			SecurityUtils.getSubject().getSession().setAttribute("loginUserName", username);
			logger.info("Auth success!");
	    }catch(Exception e){
	    	logger.warn("Business Login Exception!",e);
	    	
	    	return FAIL;
	    }
		
		return SUCCESS;
	}
	
	@RequestMapping(value="tocart",method=RequestMethod.GET)
	public String toCart(){
		logger.info("Execute toCart");
		
		return "mall/customer/cart";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/querycart",method=RequestMethod.POST)
	public @ResponseBody List<Cart> queryCart(){
		logger.info("Execute queryCart");
		
		Subject currentUser = SecurityUtils.getSubject();
		List<Cart> carts = null;
		if(currentUser.getSession()!=null){
			carts = (List<Cart>) currentUser.getSession().getAttribute("carts");
			
			return carts;
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/removecartbyone",method=RequestMethod.POST)
	public @ResponseBody String remove(@RequestBody Cart cart){
		logger.info("Execute remove");
		
		Subject currentUser = SecurityUtils.getSubject();
		List<Cart> carts = (List<Cart>)currentUser.getSession().getAttribute("carts");
		if(carts!=null){
			Iterator<Cart> iterator = carts.iterator();
			while(iterator.hasNext()){
				Cart cache = iterator.next();
				if(cache.getDigital_id().equals(cart.getDigital_id())
						&&cache.getColor().equals(cart.getColor())
						&&cache.getVersion().equals(cart.getVersion())){
					iterator.remove();
				}
			}
		}
		return SUCCESS;
	}
}
