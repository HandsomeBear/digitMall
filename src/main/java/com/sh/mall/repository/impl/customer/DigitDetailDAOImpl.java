package com.sh.mall.repository.impl.customer;

import java.math.BigDecimal;
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

import com.sh.mall.domain.Comment;
import com.sh.mall.domain.DigitDetail;
import com.sh.mall.domain.DigitDetailExt;
import com.sh.mall.domain.DigitList;
import com.sh.mall.repository.customer.IDigitDetailDAO;
import com.sh.mall.util.PageUtil;
import com.sh.mall.web.customer.DigitalQuantityQueryFormBean;

@Repository
public class DigitDetailDAOImpl implements IDigitDetailDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(DigitDetailDAOImpl.class);
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public DigitDetail queryDigitDetailById(String digit_id) {
		logger.info("Execute queryDigitDetailById");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT digital_id,description,quantity,price,image_small,image_address_big,");
		sql.append(" factory,serial_no,weight,produce_from,func,category_code ");
		sql.append(" FROM tb_digital WHERE digital_id = ? ");
		List<DigitDetail> lists = jdbcTemplate.query(sql.toString(), new Object[]{digit_id},
				new RowMapper<DigitDetail>(){

					@Override
					public DigitDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
						DigitDetail digital = new DigitDetail();
						digital.setDigital_id(rs.getInt("digital_id"));
						digital.setDescription(rs.getString("description"));
						digital.setQuantity(rs.getString("quantity"));
						digital.setPrice(new BigDecimal(rs.getString("price")));
						digital.setImage_small(rs.getString("image_small"));
						digital.setImage_address_big(rs.getString("image_address_big"));
						digital.setFactory(rs.getString("factory"));
						digital.setSerial_no(rs.getString("serial_no"));
						digital.setWeight(rs.getString("weight"));
						digital.setProduce_from(rs.getString("produce_from"));
						digital.setFunc(rs.getString("func"));
						digital.setCategory_code(rs.getString("category_code"));
						return digital;
					}
			
		});
		if(lists!=null&&lists.size()!=0){
			return lists.get(0);
		}
		return null;
	}
	
	@Override
	public String queryQuantityByCon(DigitalQuantityQueryFormBean condition) {
		logger.info("Execute queryQuantityByCon");
		
		List<String> lists = null;
		StringBuffer querySql = new StringBuffer();
		querySql.append(" SELECT sum(quantity) FROM tb_digital_ext WHERE digital_id = ? ");
		if(condition.getColor()!=null&&condition.getVersion()!=null){
			querySql.append(" AND color = ? AND version = ? ");
			lists = jdbcTemplate.queryForList(querySql.toString(),
					new Object[]{condition.getDigital_id(),condition.getColor(),condition.getVersion()}, 
					String.class);
		}else if(condition.getVersion()!=null&&condition.getColor()==null){
			querySql.append(" AND version = ? ");
			lists = jdbcTemplate.queryForList(querySql.toString(),
					new Object[]{condition.getDigital_id(),condition.getVersion()}, String.class);
		}else if(condition.getVersion()==null&&condition.getColor()!=null){
			querySql.append(" AND color = ? ");
			lists = jdbcTemplate.queryForList(querySql.toString(),
					new Object[]{condition.getDigital_id(),condition.getColor()}, String.class);
		}
		if(lists!=null&&lists.size()!=0){
			return lists.get(0);
		}
		return "0";
	}
	
	@Override
	public String queryPriceByCon(DigitalQuantityQueryFormBean condition) {
		logger.info("Execute queryPriceByCon");
		
		List<String> lists = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT DISTINCT(price) FROM tb_digital_ext WHERE digital_id=? ");
		if(condition.getColor()!=null&&condition.getVersion()!=null){
			sql.append(" AND color = ? AND version = ? ");
			lists = jdbcTemplate.queryForList(sql.toString(),
					new Object[]{condition.getDigital_id(),condition.getColor(),condition.getVersion()}, 
					String.class);
		}else if(condition.getVersion()!=null&&condition.getColor()==null){
			sql.append(" AND version = ? ");
			lists = jdbcTemplate.queryForList(sql.toString(),
					new Object[]{condition.getDigital_id(),condition.getVersion()}, String.class);
		}else if(condition.getVersion()==null&&condition.getColor()!=null){
			sql.append(" AND color = ? ");
			lists = jdbcTemplate.queryForList(sql.toString(),
					new Object[]{condition.getDigital_id(),condition.getColor()}, String.class);
		}
		if(lists!=null&&lists.size()!=0){
			return lists.get(0);
		}
		return null;
	}
	
	@Override
	public String getDataAmountByType(String flag,Map<String,String> searchCon) throws Exception {
		logger.info("Execute getDataAmountByType");
		
		StringBuffer sql = new StringBuffer();
		
		if(!flag.matches("\\d+(.\\d+)?")){
			logger.info("Search");
			
			flag = "%"+flag+"%";
			sql.append(" SELECT count(id) FROM tb_digital_ext e,tb_digital d WHERE e.digital_id in ");
			sql.append(" (SELECT digital_id FROM tb_digital WHERE description LIKE ?)");
			sql.append(" AND e.digital_id = d.digital_id ");
		}else{	
			sql.append(" SELECT count(id) FROM tb_digital_ext e,tb_digital d WHERE e.digital_id in ");
			sql.append(" (SELECT digital_id FROM tb_digital WHERE category_code = ?) ");
			sql.append(" AND e.digital_id = d.digital_id ");
		}
		if(searchCon.get("pricefrom")!=null&&!"".equals(searchCon.get("pricefrom"))){
			sql.append(" AND e.price >= ").append(searchCon.get("pricefrom"));
		}
		if(searchCon.get("priceto")!=null&&!"".equals(searchCon.get("priceto"))){
			sql.append(" AND e.price <= ").append(searchCon.get("priceto"));
		}
		if(searchCon.get("brand")!=null&&!"".equals(searchCon.get("brand"))){
			sql.append(" AND d.factory = ").append("'").append(searchCon.get("brand")).append("'");
		}
		logger.info(sql.toString());
		List<String> lists = jdbcTemplate.queryForList(sql.toString(),new Object[]{flag},String.class);
		if(lists!=null&&lists.size()!=0){
			return lists.get(0);
		}
		return "0";
	}
	
	/**
	 * digitList页面产品显示
	 */
	@Override
	public List<DigitList> list(String flag,PageUtil pageUtil,Map<String,String> searchCon) {
		logger.info("Execute list digitList");
		
		int begin = (pageUtil.getCurrentPage()-1)*pageUtil.getPagesize();
		StringBuffer sql = new StringBuffer();
		if(!flag.matches("\\d+(.\\d+)?")){
			logger.info("Search");
			
			flag = "%"+flag+"%";
			sql.append(" SELECT e.digital_id,d.title,d.commentamount,d.sellamount,e.price,d.image_address FROM tb_digital d,tb_digital_ext e ");
			sql.append(" WHERE e.digital_id in (SELECT digital_id FROM tb_digital WHERE description LIKE ?) ");
			sql.append(" AND e.digital_id = d.digital_id ");
		}else{
			sql.append(" SELECT e.digital_id,d.title,d.commentamount,d.sellamount,e.price,d.image_address FROM tb_digital d,tb_digital_ext e ");
			sql.append(" WHERE e.digital_id in (SELECT digital_id FROM tb_digital WHERE category_code = ?) ");
			sql.append(" AND e.digital_id = d.digital_id ");
		}
		
		if(searchCon.get("pricefrom")!=null&&!"".equals(searchCon.get("pricefrom"))){
			sql.append(" AND e.price >= ").append(searchCon.get("pricefrom"));
		}
		if(searchCon.get("priceto")!=null&&!"".equals(searchCon.get("priceto"))){
			sql.append(" AND e.price <= ").append(searchCon.get("priceto"));
		}
		if(searchCon.get("brand")!=null&&!"".equals(searchCon.get("brand"))){
			sql.append(" AND d.factory = ").append("'").append(searchCon.get("brand")).append("'");
		}
		if("sellamount".equals(searchCon.get("orderby"))){
			sql.append(" ORDER BY sellamount DESC ");
		}else if("commentamount".equals(searchCon.get("orderby"))){
			sql.append(" ORDER BY commentamount DESC ");
		}else{
			sql.append(" ORDER BY e.price+0 ASC ");
		}
		sql.append(" LIMIT ?,? ");
		logger.info(sql.toString());
		return this.jdbcTemplate.query(sql.toString(),new Object[]{flag,begin,pageUtil.getPagesize()},
				new RowMapper<DigitList>(){

			@Override
			public DigitList mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				DigitList digit = new DigitList();
				
				digit.setDigital_id(rs.getInt("digital_id"));
				digit.setTitle(rs.getString("title"));
				digit.setCommentamount(rs.getString("commentamount"));
				digit.setSellamount(rs.getString("sellamount"));
				digit.setPrice(rs.getBigDecimal("price"));
				digit.setImage_address(rs.getString("image_address"));
				
				return digit;
			}
			
		});
	}

	@Override
	public List<String> getVersion(String digital_id) {
		logger.info("Execute getVersion");
		
		String sql = "SELECT DISTINCT(version) FROM tb_digital_ext WHERE digital_id=?";
		return jdbcTemplate.queryForList(sql, new Object[]{digital_id}, String.class);
	}

	@Override
	public List<String> getColor(String digital_id) {
		logger.info("Execute getColor");
		
		String sql = "SELECT DISTINCT(color) FROM tb_digital_ext WHERE digital_id=?";
		return jdbcTemplate.queryForList(sql, new Object[]{digital_id}, String.class);
	}

	@Override
	public String getCommentsAmount(String digital_id) {
		logger.info("Execute getCommentsAmount");
		
		String sql = "SELECT count(comment_id) FROM tb_comments WHERE digital_id = ?";
		List<String> lists = jdbcTemplate.queryForList(sql,new Object[]{digital_id},String.class);
		if(lists!=null&&lists.size()!=0){
			return lists.get(0);
		}
		return "0";
	}

	@Override
	public List<Comment> getCommentInfo(String digital_id,PageUtil pageUtil) {
		logger.info("Execute getCommentInfo");
		
		int begin = (pageUtil.getCurrentPage()-1) * pageUtil.getPagesize();
		String sql = "SELECT comment_id,user_id,nickname,digital_id,color,version,comments,comment_date,rank "
				+ "FROM tb_comments WHERE digital_id=? ORDER BY comment_date DESC LIMIT ?,?";
		return jdbcTemplate.query(sql, new Object[]{digital_id,begin,pageUtil.getPagesize()}, 
				new RowMapper<Comment>(){

					@Override
					public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
						Comment comment = new Comment();
						comment.setComment_id(rs.getString("comment_id"));
						comment.setUser_id(rs.getString("user_id"));
						comment.setNickname(rs.getString("nickname"));
						comment.setDigital_id(rs.getString("digital_id"));
						comment.setColor(rs.getString("color"));
						comment.setVersion(rs.getString("version"));
						comment.setComments(rs.getString("comments"));
						comment.setComment_date(rs.getTimestamp("comment_date").toString());
						comment.setRank(rs.getString("rank"));
						return comment;
					}
			
		});
	}

	@Override
	public DigitDetailExt queryDigitDetailExt(DigitalQuantityQueryFormBean condition) {
		logger.info("Execute queryDigitDetailExt");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT discount_flag,discount_num FROM tb_digital_ext ");
		sql.append(" WHERE digital_id=? ");
		if(condition.getVersion()!=null&&condition.getColor()!=null){
			sql.append(" AND version=? AND color=? ");
			List<DigitDetailExt> lists = jdbcTemplate.query(sql.toString(), new Object[]{condition.getDigital_id(),
					condition.getVersion(),condition.getColor()}, new RowMapper<DigitDetailExt>(){
				
				@Override
				public DigitDetailExt mapRow(ResultSet rs, int rowNum) throws SQLException {
					DigitDetailExt ext = new DigitDetailExt();
					ext.setDiscount_flag(rs.getString("discount_flag"));
					ext.setDiscount_num(rs.getString("discount_num"));
					return ext;
				}
				
			});
			if(lists!=null&&lists.size()!=0){
				return lists.get(0);
			}
		}
		return null;
	}

}
