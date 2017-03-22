package com.sh.mall.util;

import com.sh.mall.util.LoginUserInfoUtil;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginUserInfoUtil {
	private static final Logger logger = LoggerFactory.getLogger(LoginUserInfoUtil.class);
	
	public static String getLoginUsername() {
		logger.debug("Execute getLoginUsername!");
		
		try {
			Object object = SecurityUtils.getSubject().getPrincipal();
			if(object != null){
				return object.toString();			
			}else{
				return "";
			}
		} catch (UnavailableSecurityManagerException e) {
			return "";
		}
	}
}
