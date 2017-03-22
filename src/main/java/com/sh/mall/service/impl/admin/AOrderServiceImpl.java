package com.sh.mall.service.impl.admin;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.mall.domain.Order;
import com.sh.mall.domain.OrderAdmin;
import com.sh.mall.repository.admin.IAOrderDAO;
import com.sh.mall.service.admin.IAOrderService;
import com.sh.mall.util.PageUtil;

@Service
public class AOrderServiceImpl implements IAOrderService{
	private static final Logger logger = LoggerFactory.getLogger(AOrderServiceImpl.class);
	
	@Autowired
	private IAOrderDAO aorderDAO;

	@Override
	public String getOrderSize(String flag,Map<String,String> con) throws Exception {
		logger.info("Execute getOrderSize");
		
		return aorderDAO.getOrderSize(flag,con);
	}

	@Override
	public List<OrderAdmin> getToSendOrder(PageUtil pageUtil,Map<String,String> con) throws Exception {
		logger.info("Execute getToSendOrder");
		
		return aorderDAO.getToSendOrder(pageUtil,con);
	}

	@Override
	public List<OrderAdmin> getToRefundOrder(PageUtil pageUtil,Map<String,String> con) throws Exception {
		logger.info("Execute getToRefundOrder");
		
		return aorderDAO.getToRefundOrder(pageUtil,con);
	}

	@Override
	public void send(Order order) throws Exception {
		logger.info("Execute send");
		
		aorderDAO.send(order);
	}

	@Override
	public void refund(Order order) throws Exception {
		logger.info("Execute refund");
		
		aorderDAO.refund(order);
	}
	
}
