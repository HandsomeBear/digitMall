package com.sh.mall.web.customer;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sh.mall.domain.Customer;
import com.sh.mall.service.customer.ICustomerService;
import com.sh.mall.util.LoginUserInfoUtil;

@Controller
public class CustomerController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	private static final String SUCCESS = "SUCCESS";
	private static final String FAILURE = "FAILURE";
	private static final String EXCEPTION = "EXCEPTION";
	
	@Autowired
	private ICustomerService customerService;
	
//	@Autowired
//	private Environment env;
	
	/**
	 * 转到注册页面
	 * @return 注册页面
	 */
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String toRegister() {
		logger.info("Execute toRegister!");
		
		return "mall/customer/register";
	}
	
	/**
	 * 验证username 唯一
	 * @param username
	 * @return
	 */
	@RequestMapping(value="/validUnique",method=RequestMethod.POST)
	public @ResponseBody String validUnique(@RequestBody String username){
		logger.info("Execute validUnique");
		
		try{
			boolean unique = this.customerService.validUnique(username);
			if(unique){
				return SUCCESS;
			}
			return FAILURE;
		}catch(Exception e){
			logger.warn("Validate Unique Exception!",e);
			return EXCEPTION;
		}
	}
	
	/**
	 * 注册事件
	 * @param custForm
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public @ResponseBody String register(@RequestBody CustomerRegisterFormBean custForm,
			BindingResult result,HttpServletRequest request){
		logger.info("Execute register");
		
		if(result.hasErrors()){
			logger.info("Invalid Input");
			request.getSession().setAttribute("registerMessage", "请重新输入");
			return FAILURE;
		}
		
		if(!custForm.getPassword().trim().equals(custForm.getRpassword().trim())){
			logger.info("password isn't same");
			request.getSession().setAttribute("registerMessage", "密码不一致");
			return FAILURE;
		}
		
		String captcha = (String) request.getSession().getAttribute("captcha");
		if(!captcha.equals(custForm.getCaptcha().trim())){
			logger.info("captcha wrong");
			request.getSession().setAttribute("registerMessage", "验证码不正确");
			return FAILURE;
		}
		
		Customer customer = new Customer();
		customer.setNickname(custForm.getUsername());
		customer.setPassword(custForm.getPassword());
		
		try{
			this.customerService.addCustomer(customer);
			return SUCCESS;
		}catch(Exception e){
			logger.warn("Register Exception",e);
			return EXCEPTION;
		}
	}
	
	/**
	 * to个人信息界面
	 * @return
	 */
	@RequestMapping(value="/person/toShowPersonInfo",method=RequestMethod.GET)
	public String showPersonInfo(HttpServletRequest request){
		logger.info("Execute toShowPersonInfo");
		
		return "mall/customer/showInfo";
	}
	
	/**
	 * 完善个人信息页面
	 * @return
	 */
	@RequestMapping(value="/person/completeInfo",method=RequestMethod.GET)
	public String completeInfo(@RequestParam String username,Model model){
		logger.info("Execute tocompleteInfo");
		
		try{
			Customer customer = this.customerService.findCustomerByNickname(username);		
			model.addAttribute("customer", customer);
		}catch(Exception e){
			logger.warn("To Complete Info Exception",e);
		}
		
		return "mall/customer/completeInfo";
	}
	
	/**
	 * 保存修改，完善后的用户信息
	 * @param custForm
	 * @param result
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/person/saveedit",method=RequestMethod.POST)
	public @ResponseBody String saveedit(@Valid @RequestBody CustomerSaveFormBean custForm,
			BindingResult result,HttpServletRequest request){
		logger.info("Execute saveedit");
		
		if(result.hasErrors()){
			logger.info("phone or email wrong");
			return FAILURE;
		}
		
		Customer customer = new Customer();
		customer.setNickname(custForm.getUsername());
		customer.setRealname(custForm.getRealname());
		customer.setSex(custForm.getSex());
		customer.setPhone(custForm.getPhone());
		customer.setEmail(custForm.getEmail());
		customer.setBirth_date(custForm.getBirth_date());
		customer.setHome_adress(custForm.getHome_adress());
		
		try{
			this.customerService.saveCustomer(customer);
			
			request.getSession().setAttribute("successMessage", "成功修改用户信息");
			return SUCCESS;
		}catch(Exception e){
			logger.warn("Personal Info Save Exception",e);
			return EXCEPTION;
		}
	}
	
	/**
	 * 上传图像页面
	 * @return
	 */
	@RequestMapping(value="/person/touploadImage",method=RequestMethod.GET)
	public String toUploadImage(){
		logger.info("Execute toUploadImage");
		
		return "mall/customer/uploadImage";
	}
	
	/**
	 * 上传图片
	 * @return
	 */
	@RequestMapping(value="/person/uploadImage",method=RequestMethod.POST)
	public String uploadImage(@RequestParam MultipartFile personImage, 
			HttpServletRequest request){
		logger.info("Execute upload");
		
		if(personImage == null){
			logger.warn("上传失败，文件不存在！");
			
			return "mall/customer/uploadImage";
		}
		//获取后缀名
		String type = personImage.getOriginalFilename().substring(
				personImage.getOriginalFilename().indexOf("."));
		//设置文件名
		String loginUserName = LoginUserInfoUtil.getLoginUsername();
		String fileName = "personImage" + "-" + loginUserName + type;
		//获取保存路径(配置文件---问题是不能及时刷新---保存到服务器上)
		//和下面被注释的FileUtils是一整体用法
//		String path = this.env.getProperty("filePath") + fileName;
//		File destFile = new File(path);
		String path = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/uploadImages");
		File destFile = new File(path,fileName);
		logger.info("path:"+path);
		logger.info("fileName:"+fileName);
		if(!destFile.exists()){
			destFile.mkdirs();
		}
		try{
//			FileUtils.copyInputStreamToFile(personImage.getInputStream(),
//					destFile);
			personImage.transferTo(destFile);
		}catch(IOException e){
			logger.warn("上传文件出错！",e);
			return "mall/customer/uploadImage";
		}
		return "mall/customer/showInfo";
	}
	
}
