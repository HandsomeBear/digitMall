package com.sh.mall.web.customer;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
//	@Autowired
//	private Environment environment;
	
	@ModelAttribute("loginUser")
	public LoginUserFormBean createFormBean() {
		return new LoginUserFormBean();
	}
	
	/**
	 * captcha验证码
	 * @return
	 */
	@RequestMapping(value="/captcha")
	public String captcha(){
		logger.info("Execute captcha");
		
		return "mall/customer/captcha";
	}
	
	/**
	 * 转到登录页面
	 * @return 登录页面
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String toLogin(HttpServletRequest request) {
		logger.info("Execute toLogin!");
		
		return "mall/customer/login";
	}
	
	/**
	 * 用户登录
	 * @param loginUser
	 * @param result
	 * @param request
	 * @return String
	 */
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@Valid LoginUserFormBean loginUser, 
			BindingResult result, HttpServletRequest request, Model model) {
		logger.info("Execute login!");
		
		String loginMessage = null;
		
		if(result.hasErrors()){
			logger.info("Valid result has errors!");
			loginMessage = "用户名或密码非空!";
			model.addAttribute("loginMessage", loginMessage);
			return "mall/customer/login";
		}
		
		String username = loginUser.getUsername();
		String password = loginUser.getPassword();
		
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		Subject currentUser = SecurityUtils.getSubject();
		try{
			currentUser.login(token);
			SecurityUtils.getSubject().getSession().setAttribute("loginUserName", username);
			logger.info("Auth success!");
	    }catch(UnknownAccountException e){
	    	logger.info("Auth message: " + e.getMessage());
	    	loginMessage = "用户名或密码错误!";
	    	model.addAttribute("loginMessage", loginMessage);
	        return "mall/customer/login";
	    }catch(IncorrectCredentialsException e){
	    	logger.info("Auth message: " + e.getMessage());
	    	loginMessage = "用户名或密码错误!";
	    	model.addAttribute("loginMessage", loginMessage);
	        return "mall/customer/login";
	    }catch(AuthenticationException e){
	    	logger.info("Auth message: " + e.getMessage());
	    	loginMessage = "验证异常！";
	    	model.addAttribute("loginMessage", loginMessage);
	        return "mall/customer/login";
	    }
		
		return "redirect:/index";
	}
	
}
