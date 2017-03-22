package com.sh.mall.repository.admin;

import java.util.List;
import java.util.Map;

import com.sh.mall.domain.Order;
import com.sh.mall.domain.OrderAdmin;
import com.sh.mall.util.PageUtil;

public interface IAOrderDAO {

	/**
	 * get order size by flag(P,R)
	 * @param flag
	 * @return
	 * @throws Exception
	 */
	public String getOrderSize(String flag,Map<String,String> con) throws Exception;
	
	/**
	 * get orders which are not sended
	 * @param pageUtil
	 * @return
	 * @throws Exception
	 */
	public List<OrderAdmin> getToSendOrder(PageUtil pageUtil,Map<String,String> con) throws Exception;
	
	/**
	 * get orders which are not refunded
	 * @param pageUtil
	 * @return
	 * @throws Exception
	 */
	public List<OrderAdmin>getToRefundOrder(PageUtil pageUtil,Map<String,String> con) throws Exception;
	
	/**
	 * send
	 * @param orderno
	 * @throws Exception
	 */
	public void send(Order order) throws Exception;
	
	/**
	 * refund
	 * @param order
	 * @throws Exception
	 */
	public void refund(Order order) throws Exception;
}
