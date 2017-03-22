package com.sh.mall.repository.customer;

import java.util.List;

import com.sh.mall.domain.Comment;
import com.sh.mall.domain.Order;
import com.sh.mall.domain.OrderExt;
import com.sh.mall.util.PageUtil;

public interface IOrderDAO {

	/**
	 * the first time to generate order 
	 * @param orderRequest
	 */
	public void geneOrder(final List<Order> orders);
	
	/**
	 * L--all
	 * N--waiting for pay
	 * P--waiting to send
	 * A--waiting to receive
	 * @param flag
	 * @return
	 */
	public List<OrderExt> queryOrderByCon(String flag,PageUtil pageUtil,String nickname);
	
	/**
	 * query order information by order_no
	 * @param orderno
	 * @return
	 */
	public OrderExt queryOrderByOrderNo(String orderno,String nickname);
	
	/**
	 * change the status of order by order_no
	 * @param order_no
	 * @param status
	 * @throws Exception
	 */
	public void updateOrder(String order_no,String status) throws Exception;
	
	/**
	 * update digital when pay success
	 * @param digital_id
	 * @param color
	 * @param version
	 * @param quantity
	 * @throws Exception
	 */
	public void updateDigital(String digital_id,String color,String version,
			String quantity) throws Exception;
	
	/**
	 * get data by flag
	 * @param flag
	 * @return
	 * @throws Exception
	 */
	public String getDataAmount(String flag) throws Exception;
	
	/**
	 * receive digit
	 * @param orderno
	 * @throws Exception
	 */
	public void receive(String orderno,String digital_id) throws Exception;
	
	/**
	 * get user_id by nickname
	 * @return
	 * @throws Exception
	 */
	public String getIdByNickname(String nickname) throws Exception;
	
	/**
	 * judge digit set comment_flag
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
