package com.sh.mall.repository.admin;

import java.util.List;
import java.util.Map;

import com.sh.mall.domain.DigitAdmin;
import com.sh.mall.domain.DigitDetail;
import com.sh.mall.util.PageUtil;

public interface IDigitDAO {
	
	/**
	 * get data amount
	 * @param con
	 * @return
	 * @throws Exception
	 */
	public String getDataAmount(Map<String,String> con) throws Exception;
	
	/**
	 * show digit list
	 * @param pageUtil
	 * @param con
	 * @return
	 * @throws Exception
	 */
	public List<DigitDetail> showDigitList(PageUtil pageUtil,Map<String,String> con) throws Exception;
	
	/**
	 * show info
	 * @param digital_id
	 * @return
	 * @throws Exception
	 */
	public List<DigitAdmin> showMoreInfo(String digital_id) throws Exception;
	
	/**
	 * update digit
	 * @param detail
	 * @throws Exception
	 */
	public void updateDigit(DigitDetail detail) throws Exception;
	
	/**
	 * update digitext
	 * @param digitAdmin
	 * @throws Exception
	 */
	public void updateDigitExt(DigitAdmin digitAdmin) throws Exception;
	
	/**
	 * delete one from ext
	 * @param digitAdmin
	 * @throws Exception
	 */
	public void deleteOne(DigitAdmin digitAdmin) throws Exception;
	
	/**
	 * insert a new digit
	 * @param digitAdmin
	 * @return
	 * @throws Exception
	 */
	public String addDigit(DigitAdmin digitAdmin) throws Exception;
	
	/**
	 * insert a new ext
	 * @param digitAdmin
	 * @throws Exception
	 */
	public void addExt(DigitAdmin digitAdmin) throws Exception;
	
	/**
	 * delete from tb_digital_ext and tb_digital
	 * @param digital_id
	 * @throws Exception
	 */
	public void down(String digital_id) throws Exception;
}
