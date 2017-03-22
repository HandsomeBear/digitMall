package com.sh.mall.service.impl.customer;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.mall.domain.Comment;
import com.sh.mall.domain.DigitDetail;
import com.sh.mall.domain.DigitDetailExt;
import com.sh.mall.domain.DigitList;
import com.sh.mall.repository.customer.IDigitDetailDAO;
import com.sh.mall.service.customer.IDigitDetailService;
import com.sh.mall.util.PageUtil;
import com.sh.mall.web.customer.DigitalQuantityQueryFormBean;

@Service
public class DigitDetailServiceImpl implements IDigitDetailService {
	private static final Logger logger = LoggerFactory.getLogger(DigitDetailServiceImpl.class);
	
	@Autowired
	private IDigitDetailDAO digitDetailDAO;
	
	/**
	 * 产品详细信息
	 */
	@Override
	public DigitDetail queryDigitDetailById(String digit_id) {
		logger.info("Execute queryDigitDetailById");
		
		DigitDetail digitDetail = this.digitDetailDAO.queryDigitDetailById(digit_id);
		
		return digitDetail;
	}
	
	@Override
	public String getDataAmountByType(String flag,Map<String,String> searchCon) throws Exception {
		logger.info("Execute getDataAmountByType");
		
		return digitDetailDAO.getDataAmountByType(flag,searchCon);
	}
	
	/**
	 * show digit which belong to flag显示产品信息
	 */
	@Override
	public List<DigitList> list(String flag,PageUtil pageUtil,Map<String,String> searchCon) {
		logger.info("Execute list ProductIndex");
		
		return this.digitDetailDAO.list(flag,pageUtil,searchCon);
	}

	@Override
	public String queryQuantityByCon(DigitalQuantityQueryFormBean condition) {
		logger.info("Execute queryQuantityByCon");
		
		return this.digitDetailDAO.queryQuantityByCon(condition);
	}

	@Override
	public DigitDetailExt queryPriceByCon(DigitalQuantityQueryFormBean condition) {
		logger.info("Execute queryPriceByCon");
		
		String price = digitDetailDAO.queryPriceByCon(condition);
		DigitDetailExt ext = digitDetailDAO.queryDigitDetailExt(condition);
		if(ext!=null){
			if("T".equals(ext.getDiscount_flag())){
				double num = Double.valueOf(ext.getDiscount_num());
				String pricefinal = String.valueOf(Double.valueOf(price)*(num/10));
				ext.setPrice(pricefinal);
			}else{
				ext.setPrice(price);
			}
		}else{
			ext = new DigitDetailExt();
			ext.setPrice(price);
			ext.setDiscount_flag("F");
		}
		
		return ext;
	}
	
	@Override
	public List<String> getVersion(String title) {
		logger.info("Execute getVersion");
		
		return digitDetailDAO.getVersion(title);
	}

	@Override
	public List<String> getColor(String title) {
		logger.info("Execute getColor");
		
		return digitDetailDAO.getColor(title);
	}

	@Override
	public String getCommentsAmount(String digital_id) {
		logger.info("Execute getCommentsAmount");
		
		return digitDetailDAO.getCommentsAmount(digital_id);
	}

	@Override
	public List<Comment> getCommentInfo(String digital_id,PageUtil pageUtil) {
		logger.info("Execute getCommentInfo");
		
		return digitDetailDAO.getCommentInfo(digital_id,pageUtil);
	}

}
