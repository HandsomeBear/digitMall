package com.sh.mall.repository.impl.customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.sh.mall.domain.Comment;
import com.sh.mall.domain.Order;
import com.sh.mall.domain.OrderExt;
import com.sh.mall.repository.customer.IOrderDAO;
import com.sh.mall.util.PageUtil;

@Repository
public class OrderDAOImpl implements IOrderDAO{
	private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void geneOrder(final List<Order> orders) {
		logger.info("Execute geneOrder");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO tb_order (order_no,shopping_date,amount,quantity,status,address,nickname, ");
		sql.append(" digital_id,color,version,upd_user,upd_date,upd_ip) ");
		sql.append(" VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
		this.jdbcTemplate.batchUpdate(sql.toString(), new BatchPreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setString(1, orders.get(i).getOrder_no());
				ps.setString(2, orders.get(i).getShoppingDate());
				ps.setString(3, orders.get(i).getAmount());
				ps.setString(4, orders.get(i).getQuantity());
				ps.setString(5, orders.get(i).getStatus());
				ps.setString(6, orders.get(i).getAddress());
				ps.setString(7, orders.get(i).getNickname());
				ps.setLong(8, orders.get(i).getDigital_id());
				ps.setString(9, orders.get(i).getColor());
				ps.setString(10, orders.get(i).getVersion());
				ps.setString(11, orders.get(i).getUpd_user());
				ps.setString(12, orders.get(i).getUpd_date());
				ps.setString(13, orders.get(i).getUpd_ip());
			}
			
			@Override
			public int getBatchSize() {
				return orders.size();
			}
		});
	}

	@Override
	public List<OrderExt> queryOrderByCon(String flag,PageUtil pageUtil,String nickname) {
		logger.info("Execute queryOrderByCon");
		
		int begin = (pageUtil.getCurrentPage()-1) * pageUtil.getPagesize();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT order_id,order_no,shopping_date,send_date,amount,o.quantity,status,");
		sql.append(" address,nickname,o.digital_id,color,version,comment_flag,description,image_small ");
		sql.append(" FROM tb_order o,tb_digital d WHERE o.digital_id = d.digital_id AND nickname = ? ");
		if(!"L".equals(flag)&&!"S".equals(flag)){
			sql.append(" AND status = ? ");
		}else if("S".equals(flag)){
			sql.append(" AND status = ? AND comment_flag = 'F' ");
		}else{
			sql.append(" ORDER BY shopping_date DESC LIMIT ?,?");
			return jdbcTemplate.query(sql.toString(),new Object[]{nickname,begin,pageUtil.getPagesize()},
					new RowMapper<OrderExt>(){

				@Override
				public OrderExt mapRow(ResultSet rs, int rowNum) throws SQLException {
					OrderExt order = new OrderExt();
					order.setOrder_id(rs.getLong("order_id"));
					order.setOrder_no(rs.getString("order_no"));
					order.setShoppingDate(rs.getString("shopping_date"));
					order.setSendDate(rs.getString("send_date"));
					order.setAmount(rs.getString("amount"));
					order.setQuantity(rs.getString("quantity"));
					order.setStatus(rs.getString("status"));
					order.setAddress(rs.getString("address"));
					order.setNickname(rs.getString("nickname"));
					order.setDigital_id(rs.getLong("digital_id"));
					order.setColor(rs.getString("color"));
					order.setVersion(rs.getString("version"));
					order.setComment_flag(rs.getString("comment_flag"));
					order.setDescription(rs.getString("description"));
					order.setImage_small(rs.getString("image_small"));
					
					return order;
				}
				
			});
		}
		sql.append(" ORDER BY shopping_date DESC LIMIT ?,?");
		
		return jdbcTemplate.query(sql.toString(),new Object[]{nickname,flag,begin,pageUtil.getPagesize()},
				new RowMapper<OrderExt>(){

			@Override
			public OrderExt mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderExt order = new OrderExt();
				order.setOrder_id(rs.getLong("order_id"));
				order.setOrder_no(rs.getString("order_no"));
				order.setShoppingDate(rs.getString("shopping_date"));
				order.setSendDate(rs.getString("send_date"));
				order.setAmount(rs.getString("amount"));
				order.setQuantity(rs.getString("quantity"));
				order.setStatus(rs.getString("status"));
				order.setAddress(rs.getString("address"));
				order.setNickname(rs.getString("nickname"));
				order.setDigital_id(rs.getLong("digital_id"));
				order.setColor(rs.getString("color"));
				order.setVersion(rs.getString("version"));
				order.setComment_flag(rs.getString("comment_flag"));
				order.setDescription(rs.getString("description"));
				order.setImage_small(rs.getString("image_small"));
				
				return order;
			}
			
		});
	}

	@Override
	public OrderExt queryOrderByOrderNo(String orderno,String nickname) {
		logger.info("Execute queryOrderByOrderNo");
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT order_id,order_no,shopping_date,send_date,amount,o.quantity,status,");
		sql.append(" address,nickname,o.digital_id,color,version,comment_flag,description,image_small ");
		sql.append(" FROM tb_order o,tb_digital d WHERE o.digital_id = d.digital_id AND order_no = ?");
		sql.append(" AND nickname = ? ");
		
		List<OrderExt> lists = jdbcTemplate.query(sql.toString(),new Object[]{orderno,nickname},
				new RowMapper<OrderExt>(){

			@Override
			public OrderExt mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderExt order = new OrderExt();
				order.setOrder_id(rs.getLong("order_id"));
				order.setOrder_no(rs.getString("order_no"));
				order.setShoppingDate(rs.getString("shopping_date"));
				order.setSendDate(rs.getString("send_date"));
				order.setAmount(rs.getString("amount"));
				order.setQuantity(rs.getString("quantity"));
				order.setStatus(rs.getString("status"));
				order.setAddress(rs.getString("address"));
				order.setNickname(rs.getString("nickname"));
				order.setDigital_id(rs.getLong("digital_id"));
				order.setColor(rs.getString("color"));
				order.setVersion(rs.getString("version"));
				order.setComment_flag(rs.getString("comment_flag"));
				order.setDescription(rs.getString("description"));
				order.setImage_small(rs.getString("image_small"));
				
				return order;
			}
			
		});
		if(lists!=null&&lists.size()!=0){
			return lists.get(0);
		}
		return null;
	}

	@Override
	public void updateOrder(String order_no, String status) throws Exception {
		logger.info("Execute updateOrder");
		
		String sql = "UPDATE tb_order SET status = ? WHERE order_no = ?";
		
		jdbcTemplate.update(sql,new Object[]{status,order_no});
	}

	@Override
	public void updateDigital(String digital_id, String color, String version, String quantity) throws Exception {
		logger.info("Execute updateDigital");
		
		String sql = "UPDATE tb_digital_ext SET quantity = quantity-? WHERE digital_id=? AND color=?"
				+ " AND version=?";
		jdbcTemplate.update(sql, new Object[]{quantity,digital_id,color,version});
		
		String sql1 = "UPDATE tb_digital SET quantity = quantity-? WHERE digital_id=?";
		jdbcTemplate.update(sql1, new Object[]{quantity,digital_id});
	}

	@Override
	public String getDataAmount(String flag) throws Exception {
		logger.info("Execute getDataAmount");
		
		List<String> lists = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT count(order_no) FROM tb_order ");
		if(!"L".equals(flag)){
			sql.append(" WHERE status = ? ");
			lists = jdbcTemplate.queryForList(sql.toString(), new Object[]{flag},String.class);
		}else{
			lists = jdbcTemplate.queryForList(sql.toString(), String.class);
		}
		
		if(lists!=null&&lists.size()!=0){
			return lists.get(0);
		}
		return "0";
	}

	@Override
	public void receive(String orderno,String digital_id) throws Exception {
		logger.info("Execute receive");
		
		String sql = "UPDATE tb_order SET status = 'S' WHERE order_no = ?";
		jdbcTemplate.update(sql, new Object[]{orderno});
		
		String sql1 = "UPDATE tb_digital SET sellamount=sellamount+1 WHERE digital_id = ?";
		jdbcTemplate.update(sql1, new Object[]{digital_id});
	}

	@Override
	public void judge(Comment comment,String orderno) throws Exception {
		logger.info("Execute judge");
		
		String sql = "UPDATE tb_order SET comment_flag = 'T' WHERE order_no = ?";
		jdbcTemplate.update(sql, new Object[]{orderno});
		
		StringBuffer sql1 = new StringBuffer();
		sql1.append(" INSERT INTO tb_comments (user_id,nickname,digital_id,color,version,comments, ");
		sql1.append(" comment_date,rank) VALUES (?,?,?,?,?,?,?,?) ");
		jdbcTemplate.update(sql1.toString(), new Object[]{comment.getUser_id(),
				comment.getNickname(),comment.getDigital_id(),comment.getColor(),
				comment.getVersion(),comment.getComments(),
				comment.getComment_date(),comment.getRank()});
		
		String sql2 = "UPDATE tb_digital SET commentamount=commentamount+1 WHERE digital_id = ?";
		jdbcTemplate.update(sql2, new Object[]{comment.getDigital_id()});
	}

	@Override
	public String getIdByNickname(String nickname) throws Exception {
		logger.info("Execute getIdByNickname");
		
		String sql = "SELECT user_id FROM tb_customer WHERE nickname = ?";
		List<String> lists = jdbcTemplate.queryForList(sql, new Object[]{nickname}, String.class);
		if(lists!=null&&lists.size()!=0){
			return lists.get(0);
		}
		return null;
	}

	@Override
	public void refund(String orderno) throws Exception {
		logger.info("Execute refund");
		
		String sql = "UPDATE tb_order SET status = 'R' WHERE order_no = ?";
		jdbcTemplate.update(sql, new Object[]{orderno});
		
	}
}
