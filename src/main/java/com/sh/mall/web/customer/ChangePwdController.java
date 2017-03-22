package com.sh.mall.web.customer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.mall.domain.PwdSalt;
import com.sh.mall.service.customer.IChangePwdService;
import com.sh.mall.util.LoginUserInfoUtil;

@Controller
public class ChangePwdController {
	private static final Logger logger = LoggerFactory.getLogger(ChangePwdController.class);
	
	private static final String SUCCESS = "SUCCESS";
	private static final String FAILURE = "FAILURE";
	private static final String EXCEPTION = "EXCEPTION";
	
	@Autowired
	private IChangePwdService changePwdService;
	
	/**
	 * 转到修改密码页面
	 * @return
	 */
	@RequestMapping(value="/person/tochangePwd",method=RequestMethod.GET)
	public String tochangePwd(){
		logger.info("Execute tochangePwd");
		
		return "mall/customer/changePwd";
	}
	
	/**
	 * check输入的原始密码是否正确
	 * @return
	 */
	@RequestMapping(value="/person/checkPwd",method=RequestMethod.POST)
	public @ResponseBody String checkPwd(@RequestParam String pwd){
		logger.info("Execute checkPwd");
		
		String nickname = LoginUserInfoUtil.getLoginUsername();
		try{
			PwdSalt pwdSalt = this.changePwdService.getPassword(nickname);
			if(this.changePwdService.comparePwds(pwd, pwdSalt)){
				return SUCCESS;
			}
			return FAILURE;
		}catch(Exception e){
			logger.warn("Check Pwd Exception!");
			return EXCEPTION;
		}
	}
	
	/**
	 * 保存修改的密码
	 * @param newPwd
	 * @return
	 */
	@RequestMapping(value="/person/savePwd",method=RequestMethod.POST)
	public @ResponseBody String savePassword(@RequestParam String newPwd){
		logger.info("Execute savePassword");
		
		String nickname = LoginUserInfoUtil.getLoginUsername();
		try{
			PwdSalt pwdSalt = this.changePwdService.getPassword(nickname);
			this.changePwdService.savePassword(newPwd, pwdSalt, nickname);
			return SUCCESS;
		}catch(Exception e){
			logger.warn("Save Pwd Exception!",e);
			return EXCEPTION;
		}
		
	}
}
