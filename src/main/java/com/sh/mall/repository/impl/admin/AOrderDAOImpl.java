package com.sh.mall.repository.impl.admin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.sh.mall.domain.Order;
import com.sh.mall.domain.OrderAdmin;
import com.sh.mall.repository.admin.IAOrderDAO;
import com.sh.mall.util.PageUtil;

@Repository
public class AOrderDAOImpl implements IAOrderDAO{
	private static final Logger logger = LoggerFactory.getLogger(AOrderDAOImpl.class);
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public String getOrderSize(String flag,Map<String,String> con) throws Exception {
		logger.info("Execute getOrderSize");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT count(order_no) FROM tb_order ");
		sql.append(" WHERE status = ?");
		if(con.get("orderno")!=null&&!"".equals(con.get("orderno"))){
			sql.append(" AND order_no = ").append("'").append(con.get("orderno")).append("'");
		}
		List<String> lists = jdbcTemplate.queryForList(sql.toString(), 
				new Object[]{flag}, String.class);
		if(lists!=null&&lists.size()!=0){
			return lists.get(0);
		}
		return "0";
	}

	@Override
	public List<OrderAdmin> getToSendOrder(PageUtil pageUtil,Map<String,String> con) throws Exception {
		logger.info("Execute getToSendOrder");
		
		int begin = (pageUtil.getCurrentPage()-1)*pageUtil.getPagesize();
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT order_no,shopping_date,address,color,version,o.quantity,title FROM tb_order o,tb_digital d ");
		sql.append(" WHERE status = 'P' ");
		if(con.get("orderno")!=null&&!"".equals(con.get("orderno"))){
			sql.append(" AND order_no = ").append("'").append(con.get("orderno")).append("'");
		}
		sql.append(" AND o.digital_id = d.digital_id ORDER BY shopping_date DESC LIMIT ?,? ");
		return jdbcTemplate.query(sql.toString(), new Object[]{begin,pageUtil.getPagesize()},
				new RowMapper<OrderAdmin>(){

					@Override
					public OrderAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
						OrderAdmin order = new OrderAdmin();
						order.setOrder_no(rs.getString("order_no"));
						order.setShoppingDate(rs.getString("shopping_date").substring(0, 19));
						order.setAddress(rs.getString("address"));
						order.setColor(rs.getString("color"));
						order.setVersion(rs.getString("version"));
						order.setQuantity(rs.getString("quantity"));
						order.setTitle(rs.getString("title"));
						return order;
					}
			
		});
	}

	@Override
	public List<OrderAdmin> getToRefundOrder(PageUtil pageUtil,Map<String,String> con) throws Exception {
		logger.info("Execute getToRefundOrder");
		
		int begin = (pageUtil.getCurrentPage()-1)*pageUtil.getPagesize();
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT order_no,shopping_date,address,color,version,o.quantity,title FROM tb_order o,tb_digital d ");
		sql.append(" WHERE status = 'R' ");
		if(con.get("orderno")!=null&&!"".equals(con.get("orderno"))){
			sql.append(" AND order_no = ").append("'").append(con.get("orderno")).append("'");
		}
		sql.append(" AND o.digital_id = d.digital_id ORDER BY shopping_date DESC LIMIT ?,? ");
		return jdbcTemplate.query(sql.toString(), new Object[]{begin,pageUtil.getPagesize()},
				new RowMapper<OrderAdmin>(){

					@Override
					public OrderAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
						OrderAdmin order = new OrderAdmin();
						order.setOrder_no(rs.getString("order_no"));
						order.setShoppingDate(rs.getString("shopping_date").substring(0, 19));
						order.setAddress(rs.getString("address"));
						order.setColor(rs.getString("color"));
						order.setVersion(rs.getString("version"));
						order.setQuantity(rs.getString("quantity"));
						order.setTitle(rs.getString("title"));
						return order;
					}
			
		});
	}

	@Override
	public void send(Order order) throws Exception {
		logger.info("Execute send");
		
		String sql = "UPDATE tb_order SET status = 'A',send_date=?,upd_user=?,upd_date=?,"
				+ "upd_ip=? WHERE order_no = ?";
		jdbcTemplate.update(sql,new Object[]{order.getSendDate(),order.getUpd_user(),
				order.getUpd_date(),order.getUpd_ip(),order.getOrder_no()});
	}

	@Override
	public void refund(Order order) throws Exception {
		logger.info("Execute refund");
		
		String sql = "UPDATE tb_order SET status = 'U',send_date=?,upd_user=?,upd_date=?,"
				+ "upd_ip=? WHERE order_no = ?";
		jdbcTemplate.update(sql,new Object[]{order.getSendDate(),order.getUpd_user(),
				order.getUpd_date(),order.getUpd_ip(),order.getOrder_no()});
	}
}
