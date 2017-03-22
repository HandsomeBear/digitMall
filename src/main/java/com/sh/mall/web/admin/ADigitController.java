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

import com.sh.mall.domain.DigitAdmin;
import com.sh.mall.domain.DigitDetail;
import com.sh.mall.service.admin.IDigitService;
import com.sh.mall.util.GeneOrderNo;
import com.sh.mall.util.PageUtil;

@Controller
public class ADigitController {
	private static final Logger logger = LoggerFactory.getLogger(ADigitController.class);
	
	@Autowired
	private IDigitService adigitService;
	
	@Autowired
	private GeneOrderNo geneOrderNo;
	
	@RequestMapping(value="/admin/showdigitlist",method=RequestMethod.GET)
	public String showDigitList(@RequestParam String currentPage,
			HttpServletRequest request){
		logger.info("Execute showDigitList");
		
		Map<String,String> con = getSearchCon(request);
		
		try{
			PageUtil pageUtil = new PageUtil();
			pageUtil.setCurrentPage(1);
			pageUtil.setPagesize(10);
			if (currentPage != null) {
				Integer currentPages = Integer.valueOf(currentPage);
				pageUtil.setCurrentPage(currentPages);
			}
			pageUtil.setTotalPage(pageUtil.getTotalData());
			pageUtil.setTotalData(Integer.valueOf(this.adigitService.getDataAmount(con)));
			logger.info("totalData:"+pageUtil.getTotalData());
			int totalPage = 0;
			if(pageUtil.getTotalData()%pageUtil.getPagesize()==0){
				totalPage=pageUtil.getTotalData()/pageUtil.getPagesize();
			}else{
				totalPage=(pageUtil.getTotalData()/pageUtil.getPagesize())+1;
			}
			logger.info("totalPage:"+totalPage);
			pageUtil.setTotalPage(totalPage);
			
			List<DigitDetail> adigits = adigitService.showDigitList(pageUtil, con);
			
			request.setAttribute("adigits", adigits);
			request.setAttribute("pageUtil", pageUtil);
		}catch(Exception e){
			logger.warn("Show Digit List Fail",e);
			
			return "mall/admin/index";
		}
		return "mall/admin/digit/showdigitlist";
	}
	
	@RequestMapping(value="/admin/buildshowcon",method=RequestMethod.POST)
	public @ResponseBody String buildShowCon(@RequestBody ADigitSearchInput con,
			HttpServletRequest request){
		logger.info("Execute buildShowCon");
		
		if(con.getDescription()!=null&&!"".equals(con.getDescription())){
			request.getSession().setAttribute("desc", con.getDescription());
		}else{
			request.getSession().removeAttribute("desc");
		}
		return "SUCCESS";
	}
	
	public Map<String,String> getSearchCon(HttpServletRequest request){
		logger.info("Execute getSearchCon");
		
		Map<String,String> con = new HashMap<String,String>();
		if(request.getSession().getAttribute("desc")!=null
				&&!"".equals(request.getSession().getAttribute("desc"))){
			con.put("desc", (String)request.getSession().getAttribute("desc"));
		}
		return con;
	}
	
	@RequestMapping(value="/admin/tomoreinfo",method=RequestMethod.POST)
	public @ResponseBody String toMoreInfo(@RequestBody ADigitMoreInfoInput input,
			HttpServletRequest request){
		logger.info("Execute tomoreInfo");
		
		List<DigitAdmin> digitAdmins = null;
		try {
			digitAdmins = adigitService.showMoreInfo(input.getDigital_id());
		} catch (Exception e) {
			logger.warn("Show More Info Fail!",e);
			
			return "FAILURE";
		}
		request.getSession().setAttribute("digitAdmins", digitAdmins);
		
		return "SUCCESS";
	}
	
	@RequestMapping(value="/admin/moreinfo",method=RequestMethod.GET)
	public String moreInfo(){
		logger.info("Execute moreInfo");
		
		return "mall/admin/digit/moreinfo";
	}
	
	@RequestMapping(value="/admin/updatedigit",method=RequestMethod.POST)
	public @ResponseBody String updateDigit(@RequestBody DigitDetail digit,
			HttpServletRequest request){
		logger.info("Execute updateDigit");
		
		digit.setUpd_user((String)request.getSession().getAttribute("LoginAdminName"));
		digit.setUpd_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		digit.setUpd_ip(request.getRemoteAddr());
		try{
			adigitService.updateDigit(digit);
		}catch(Exception e){
			logger.warn("Update Digit Fail!",e);
			
			return "FAILURE";
		}
		return "SUCCESS";
	}
	
	@RequestMapping(value="/admin/updatedigitext",method=RequestMethod.POST)
	public @ResponseBody String updateDigitExt(@RequestBody DigitAdmin digitAdmin,
			HttpServletRequest request){
		logger.info("Execute updateDigitExt");
		
		digitAdmin.setUpd_user((String)request.getSession().getAttribute("LoginAdminName"));
		digitAdmin.setUpd_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		digitAdmin.setUpd_ip(request.getRemoteAddr());
		System.out.println(digitAdmin.getUpd_ip());
		try{
			adigitService.updateDigitExt(digitAdmin);
		}catch(Exception e){
			logger.warn("Update Digit Ext Fail",e);
			
			return "FAILURE";
		}
		return "SUCCESS";
	}
	
	@RequestMapping(value="/admin/deleteone",method=RequestMethod.POST)
	public @ResponseBody String deleteOne(@RequestBody DigitAdmin digitAdmin){
		logger.info("Execute deleteOne");
		
		try{
			adigitService.deleteOne(digitAdmin);
		}catch(Exception e){
			logger.warn("Delete One",e);
			
			return "FAILURE";
		}
		return "SUCCESS";
	}
	
	@RequestMapping(value="/admin/toaddone",method=RequestMethod.GET)
	public String toAddOne(){
		logger.info("Execute toAddOne");
		
		return "mall/admin/digit/addone2";
	}
	
	@RequestMapping(value="/admin/addone",method=RequestMethod.POST)
	public @ResponseBody String addOne(@RequestBody DigitAdmin digitAdmin,
			HttpServletRequest request){
		logger.info("Execute addOne");
		//return digital_id redirect tomoreinfo
		
		String category = (String)request.getSession().getAttribute("category");
		
		String username = (String)request.getSession().getAttribute("LoginAdminName");
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String ip = request.getRemoteAddr();
		String serial_no = geneOrderNo.getUniqueSerialNo();
		digitAdmin.setUpd_user(username);
		digitAdmin.setUpd_date(date);
		digitAdmin.setUpd_ip(ip);
		digitAdmin.setSerial_no(serial_no);
		digitAdmin.setImage_address(category+"/small/"+digitAdmin.getImage_address());
		digitAdmin.setImage_address_big(category+"/big/"+digitAdmin.getImage_address_big());
		try{
			return adigitService.addDigit(digitAdmin);
		}catch(Exception e){
			logger.warn("Add a new Digit Fail",e);
			
			return "FAIL";
		}
	}
	
	@RequestMapping(value="/admin/addext",method=RequestMethod.POST)
	public @ResponseBody String addExt(@RequestBody DigitAdmin digitAdmin,
			HttpServletRequest request){
		logger.info("Execute addExt");
		
		String username = (String)request.getSession().getAttribute("LoginAdminName");
		digitAdmin.setUpd_user(username);
		digitAdmin.setUpd_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		digitAdmin.setUpd_ip(request.getRemoteAddr());
		
		try{
			adigitService.addExt(digitAdmin);
		}catch(Exception e){
			logger.warn("Add A Digit Ext Failed",e);
			
			return "FAIL";
		}
		return "SUCCESS";
	}
	
	@RequestMapping(value="/admin/down",method=RequestMethod.POST)
	public @ResponseBody String down(@RequestBody ADigitMoreInfoInput input){
		logger.info("Execute down");
		
		String digital_id = input.getDigital_id();
		try{
			adigitService.down(digital_id);
		}catch(Exception e){
			logger.warn("Delete From Ext And Digital",e);
			
			return "FAIL";
		}
		return "SUCCESS";
	}
}
