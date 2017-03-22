package com.sh.mall.web.customer;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.mall.domain.Cart;
import com.sh.mall.domain.Order;
import com.sh.mall.domain.ReceiptAddress;
import com.sh.mall.service.customer.IAddressService;
import com.sh.mall.service.customer.IOrderService;
import com.sh.mall.util.GeneOrderNo;
import com.sh.mall.util.LoginUserInfoUtil;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	private static final String SUCCESS = "SUCCESS";
	private static final String FAIL = "FAIL";
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IAddressService addressService;
	
	@Autowired
	private GeneOrderNo geneOrderNo;
	
	@RequestMapping(value="/queryaddress",method=RequestMethod.POST)
	public @ResponseBody List<ReceiptAddress> queryAddress(){
		logger.info("Execute queryAddress");
		
		String nickname = LoginUserInfoUtil.getLoginUsername();
		
		return this.addressService.showReceiptAddress(nickname);
	}
	
	@RequestMapping(value="/toorder",method=RequestMethod.POST)
	public @ResponseBody String toOrder(@RequestBody List<OrderRequest> orders){
		logger.info("Execute toOrder");
		
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.getSession().setAttribute("orderItems", orders);
		
		return SUCCESS;
	}
	
	@RequestMapping(value="/geneorderpage",method=RequestMethod.GET)
	public String orderPage(){
		logger.info("Execute orderPage");
		
		return "mall/customer/order";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/geneorder",method=RequestMethod.POST)
	public @ResponseBody String geneOrder(@RequestBody List<OrderInfoOutput> orderRequests,
			HttpServletRequest request){
		logger.info("Execute geneOrder");
		
		Subject currentUser = SecurityUtils.getSubject();
		//生成订单后，删除cart中的这条记录
		List<Cart> carts = (List<Cart>)currentUser.getSession().getAttribute("carts");
		
		String nickname = LoginUserInfoUtil.getLoginUsername();
		String ip = request.getRemoteAddr();
		
		List<Order> orders = new ArrayList<Order>();
		for(OrderInfoOutput orderRequest:orderRequests){
			Order order = new Order();
			String order_no = geneOrderNo.getUniqueOrderNo();
			order.setOrder_no(order_no);
			order.setShoppingDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			order.setAmount(orderRequest.getSum());
			order.setQuantity(orderRequest.getQuantity());
			//订单信息N:未付款--P:已付款，未发货--A:已发货，未接收--S:已接收--R:申请退款--D:处理退款请求
			order.setStatus("N");
			order.setAddress(orderRequest.getAddress());
			order.setNickname(nickname);
			order.setDigital_id(Long.valueOf(orderRequest.getDigital_id()));
			order.setColor(orderRequest.getColor());
			order.setVersion(orderRequest.getVersion());
			order.setUpd_user(nickname);
			order.setUpd_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			order.setUpd_ip(ip);
			
			orders.add(order);
			
			orderRequest.setOrder_no(order_no);
			
			if(carts!=null){
			Iterator<Cart> iterator = carts.iterator();
				while(iterator.hasNext()){
					Cart cart = iterator.next();
					if(orderRequest.getDigital_id().equals(cart.getDigital_id())&&
							orderRequest.getColor().equals(cart.getColor())&&
							orderRequest.getVersion().equals(cart.getVersion())){
						iterator.remove();
					}
				}
			}
		}
		try{
			orderService.geneOrder(orders);
			currentUser.getSession().setAttribute("carts", carts);
			currentUser.getSession().setAttribute("payOrders", orderRequests);
		}catch(Exception e){
			logger.warn("Gene Order Fail!",e);
			
			return FAIL;
		}
		return SUCCESS;
	}
	
	@RequestMapping(value="/paypage",method=RequestMethod.GET)
	public String payPage(){
		logger.info("Execute payPage");
		
		return "mall/customer/prepay";
	}
	
	@RequestMapping(value="/pay",method=RequestMethod.POST)
	public @ResponseBody String pay(@RequestBody OrderInfoOutput orderRequest){
		logger.info("Execute pay");
		
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.getSession().setAttribute("payInfo", orderRequest);
		
		return SUCCESS;
	}
	
	@RequestMapping(value="/topay",method=RequestMethod.GET)
	public String topay(){
		logger.info("Execute topay");
		
		return "mall/customer/pay";
	}
	
	@RequestMapping(value="/executepay",method=RequestMethod.POST)
	public @ResponseBody String executepay(@RequestBody OrderInfoOutput order){
		logger.info("Execute executepay");
		
		Subject currentUser = SecurityUtils.getSubject();
		
		try{
			orderService.executePay(order);
			currentUser.getSession().removeAttribute("payInfo");
		}catch(Exception e){
			logger.warn("Execute Pay Fail!",e);
			
			return FAIL;
		}
		return SUCCESS;
	}
	
	@RequestMapping(value="/paysuccess",method=RequestMethod.GET)
	public String paySuccess(){
		logger.info("Execute paySuccess");
		
		return "mall/customer/paysuccess";
	}
}
