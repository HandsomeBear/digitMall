package com.sh.mall.service.impl.customer;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.mall.domain.Comment;
import com.sh.mall.domain.Order;
import com.sh.mall.domain.OrderExt;
import com.sh.mall.repository.customer.IOrderDAO;
import com.sh.mall.service.customer.IOrderService;
import com.sh.mall.util.PageUtil;
import com.sh.mall.web.customer.OrderInfoOutput;

@Service
public class OrderServiceImpl implements IOrderService{
	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Autowired
	private IOrderDAO orderDAO;

	@Override
	public void geneOrder(List<Order> orders) throws Exception {
		logger.info("Execute geneOrder");
		
		orderDAO.geneOrder(orders);
	}

	@Override
	public List<OrderExt> queryOrderByCon(String flag,PageUtil pageUtil,String nickname) {
		logger.info("Execute queryOrderByCon");
		
		return orderDAO.queryOrderByCon(flag,pageUtil,nickname);
	}

	@Override
	public OrderExt queryOrderByOrderNo(String orderno,String nickname) {
		logger.info("Execute queryOrderByOrderNo");
		
		return orderDAO.queryOrderByOrderNo(orderno,nickname);
	}

	@Override
	@Transactional
	public void executePay(OrderInfoOutput order) throws Exception {
		logger.info("Execute executePay");
		
		orderDAO.updateOrder(order.getOrder_no(), "P");
		orderDAO.updateDigital(order.getDigital_id(), order.getColor(),
				order.getVersion(), order.getQuantity());
	}

	@Override
	public String getDataAmount(String flag) throws Exception {
		logger.info("Execute getDataAmount");
		
		return orderDAO.getDataAmount(flag);
	}

	@Override
	@Transactional
	public void receive(String orderno,String digital_id) throws Exception {
		logger.info("Execute receive");
		
		orderDAO.receive(orderno,digital_id);
	}

	@Override
	@Transactional
	public void judge(Comment comment, String orderno) throws Exception {
		logger.info("Execute judge");
		
		String user_id = orderDAO.getIdByNickname(comment.getNickname());
		comment.setUser_id(user_id);
		orderDAO.judge(comment, orderno);
	}

	@Override
	public void refund(String orderno) throws Exception {
		logger.info("Execute refund");
		
		orderDAO.refund(orderno);
	}

}
