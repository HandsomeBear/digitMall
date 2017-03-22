package com.sh.mall.service.customer;

import java.util.List;

import com.sh.mall.domain.Comment;
import com.sh.mall.domain.Order;
import com.sh.mall.domain.OrderExt;
import com.sh.mall.util.PageUtil;
import com.sh.mall.web.customer.OrderInfoOutput;

public interface IOrderService {

	/**
	 * the first time to gene order
	 * @param orders
	 * @throws Exception
	 */
	public void geneOrder(List<Order> orders) throws Exception;
	
	/**
	 * get order by condition
	 */
	public List<OrderExt> queryOrderByCon(String flag,PageUtil pageUtil,String nickname);
	
	/**
	 * query order by order_no
	 * @param orderNo
	 * @return
	 */
	public OrderExt queryOrderByOrderNo(String orderNo,String nickname);
	
	/**
	 * change status and update quantity
	 * @param order
	 * @throws Exception
	 */
	public void executePay(OrderInfoOutput order) throws Exception;
	
	/**
	 * get data amount
	 * @param flag
	 * @return
	 * @throws Exception
	 */
	public String getDataAmount(String flag) throws Exception;
	
	/**
	 * receive
	 * @param orderno
	 * @throws Exception
	 */
	public void receive(String orderno,String digital_id) throws Exception;
	
	/**
	 * judge
	 * @param comment
	 * @param orderno
	 * @throws Exception
	 */
	public void judge(Comment comment,String orderno) throws Exception;
	
	/**
	 * refund
	 * @param orderno
	 * @throws Exception
	 */
	public void refund(String orderno) throws Exception;
}
