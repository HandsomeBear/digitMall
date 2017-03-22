package com.sh.mall.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class GeneOrderNo {
	private static final Logger logger = LoggerFactory.getLogger(GeneOrderNo.class);
	
	static Integer runningNumber = 0;
	static Integer number = 0;
	
	public String getUniqueOrderNo(){
		logger.info("Execute getUniqueOrderNo");
		
		String [] ss = {"00000","0000","000","00","0",""};
		String head = "KSK";
		String now_date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		synchronized (this) {
			if(runningNumber<=999999){
				String num = String.valueOf(runningNumber);
				runningNumber++;
				return head+now_date+ss[num.length()-1]+num;
			}
			runningNumber = 0;
			String num = String.valueOf(runningNumber);
			runningNumber++;
			return head+now_date+ss[num.length()-1]+num;
		}
	}
	
	public String getUniqueSerialNo(){
		logger.info("Execute getUniqueSerialNo");
		
		String [] ss = {"0",""};
		String now_date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		synchronized (this) {
			if(number<=99){
				String num = String.valueOf(number);
				number++;
				return now_date+ss[num.length()-1]+num;
			}
			number = 0;
			String num = String.valueOf(number);
			number++;
			return now_date+ss[num.length()-1]+num;
		}
	}
}
