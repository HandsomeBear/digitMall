package com.sh.mall.repository.customer;

import java.util.List;
import java.util.Map;

import com.sh.mall.domain.Comment;
import com.sh.mall.domain.DigitDetail;
import com.sh.mall.domain.DigitDetailExt;
import com.sh.mall.domain.DigitList;
import com.sh.mall.util.PageUtil;
import com.sh.mall.web.customer.DigitalQuantityQueryFormBean;

public interface IDigitDetailDAO {
	
	/**
	 * return digitDetail queried by digit_id
	 * @param digit_id
	 * @return
	 */
	public DigitDetail queryDigitDetailById(String digit_id);
	
	/**
	 * return quantity queried by condition
	 * @param condition
	 * @return
	 */
	public String queryQuantityByCon(DigitalQuantityQueryFormBean condition);
	
	/**
	 * different version cause different price
	 * @param condition
	 * @return
	 */
	public String queryPriceByCon(DigitalQuantityQueryFormBean condition);
	
	/**
	 * query discount information
	 * @param condition
	 * @return
	 */
	public DigitDetailExt queryDigitDetailExt(DigitalQuantityQueryFormBean condition);
	
	/**
	 * get data amount by type for page
	 * @param flag
	 * @return
	 */
	public String getDataAmountByType(String flag,Map<String,String> searchCon) throws Exception;
	
	/**
	 * return digits which are belongs to
	 * 1--手机
	 * 2--电脑
	 * 3--相机
	 * 4--VR
	 * @return
	 */
	public List<DigitList> list(String flag,PageUtil pageUtil,Map<String,String> searchCon);
	
	/**
	 * get version information
	 * @param digital_id
	 * @return
	 */
	public List<String> getVersion(String digital_id);
	
	/**
	 * get color information
	 * @param digital_id
	 * @return
	 */
	public List<String> getColor(String digital_id);
	
	/**
	 * get commentsAmount of this digit
	 * @param digital_id
	 * @return
	 */
	public String getCommentsAmount(String digital_id);
	
	/**
	 * get comment information
	 * @param digital_id
	 * @return
	 */
	public List<Comment> getCommentInfo(String digital_id,PageUtil pageUtil);
}
