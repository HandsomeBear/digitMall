package com.sh.mall.web.customer;

import java.util.ArrayList;
import java.util.List;

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

import com.sh.mall.domain.ReceiptAddress;
import com.sh.mall.service.customer.IAddressService;
import com.sh.mall.util.LoginUserInfoUtil;

@Controller
public class AddressController {
	private static final Logger logger = LoggerFactory.getLogger(AddressController.class);
	
	private static final String SUCCESS = "SUCCESS";
	private static final String FAILURE = "FAILURE";
	private static final String EXCEPTION = "EXCEPTION";
	
	@Autowired
	private IAddressService addressService;
	
	/**
	 * 显示收货地址列表
	 * @return
	 */
	@RequestMapping(value="/address/addressInfo",method=RequestMethod.GET)
	public String showReceiptAddress(@RequestParam String username,Model model){
		logger.info("Execute showReceiptAddress");
		
		try{
			List<ReceiptAddress> addresses = this.addressService.showReceiptAddress(username);
			model.addAttribute("addresses", addresses);
		}catch(Exception e){
			logger.warn("Show ReceipAddress Exception",e);
		}
		
		return "mall/customer/addressInfo";
	}
	
	/**
	 * 保存新增地址
	 * @param addressForm
	 * @param result
	 * @return
	 */
	@RequestMapping(value="/address/addAddress",method=RequestMethod.POST)
	public @ResponseBody String addAddress(@Valid @RequestBody AddressFormBean addressForm,
			BindingResult result){
		logger.info("Execute addAddress");
		
		if(result.hasErrors()){
			logger.info("InValid Input");
			
			return FAILURE;
		}
		
		String nickname = LoginUserInfoUtil.getLoginUsername();
		ReceiptAddress address = new ReceiptAddress();
		address.setNickname(nickname);
		address.setBelong_to(addressForm.getBelong_to());
		address.setDetailed(addressForm.getDetailed());
		address.setPhone(addressForm.getPhone());
		address.setZip_code(addressForm.getZip_code());
		address.setReceiver(addressForm.getReceiver());
		
		try{
			this.addressService.saveReceiptAddress(address);
		}catch(Exception e){
			logger.warn("Add Address Exception",e);
			return EXCEPTION;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 删除地址信息
	 * @param checkeds
	 * @return
	 */
	@RequestMapping(value="/address/deleteAddress",method=RequestMethod.POST)
	public @ResponseBody String deleteAddress(@RequestParam String strings){
		logger.info("Execute deleteAddress");
		
		String[] ids = strings.split(",");
		List<Integer> address_ids = new ArrayList<Integer>();
		for(int i = 0;i < ids.length;i++){
			address_ids.add(Integer.valueOf(ids[i]));
		}
		
		try{
			this.addressService.deleteReceiptAddress(address_ids);
		}catch(Exception e){
			logger.warn("Delete Address Exception",e);
			return EXCEPTION;
		}
		
		return SUCCESS;
	}
}
