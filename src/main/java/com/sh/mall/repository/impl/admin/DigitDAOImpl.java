package com.sh.mall.repository.impl.admin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.sh.mall.domain.DigitAdmin;
import com.sh.mall.domain.DigitDetail;
import com.sh.mall.repository.admin.IDigitDAO;
import com.sh.mall.util.PageUtil;

@Repository
public class DigitDAOImpl implements IDigitDAO {
	private static final Logger logger = LoggerFactory.getLogger(DigitDAOImpl.class);
	
	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcInsert insertJdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.insertJdbcTemplate = new SimpleJdbcInsert(dataSource).withTableName("tb_digital")
				.usingGeneratedKeyColumns("digital_id").usingColumns("title","description","factory",
						"release_date","quantity","price","serial_no","weight","produce_from",
						"func","image_small","image_address","image_address_big","category_code",
						"upd_user","upd_date","upd_ip");
	}

	@Override
	public String getDataAmount(Map<String, String> con) throws Exception {
		logger.info("Execute getDataAmount");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT count(digital_id) FROM tb_digital ");
		if(con.get("desc")!=null&&!"".equals(con.get("desc"))){
			String desc = "'%"+con.get("desc")+"%'";
			sql.append(" WHERE description LIKE ").append(desc);
		}
		List<String> lists = jdbcTemplate.queryForList(sql.toString(),String.class);
		if(lists!=null&&lists.size()!=0){
			return lists.get(0);
		}
		return "0";
	}

	@Override
	public List<DigitDetail> showDigitList(PageUtil pageUtil, Map<String, String> con) throws Exception {
		logger.info("Execute showDigitList");
		
		int begin = (pageUtil.getCurrentPage()-1)*pageUtil.getPagesize();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT digital_id,title,factory,release_date,sellamount,commentamount ");
		sql.append(" FROM tb_digital ");
		if(con.get("desc")!=null&&!"".equals(con.get("desc"))){
			String desc = "'%"+con.get("desc")+"%'";
			sql.append(" WHERE description LIKE ").append(desc);
		}
		sql.append(" LIMIT ?,? ");
		
		return jdbcTemplate.query(sql.toString(), new Object[]{begin,pageUtil.getPagesize()}, 
				new RowMapper<DigitDetail>(){

					@Override
					public DigitDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
						DigitDetail digit = new DigitDetail();
						digit.setDigital_id(rs.getInt("digital_id"));
						digit.setTitle(rs.getString("title"));
						digit.setFactory(rs.getString("factory"));
						digit.setRelease_date(rs.getString("release_date"));
						digit.setSellamount(rs.getInt("sellamount"));
						digit.setCommentamount(rs.getInt("commentamount"));
						return digit;
					}
			
		});
	}

	@Override
	public List<DigitAdmin> showMoreInfo(String digital_id) throws Exception {
		logger.info("Execute showMoreInfo");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT d.digital_id,d.title,d.description,d.factory,d.release_date,d.quantity, ");
		sql.append(" d.weight,d.produce_from,d.func,e.id,e.color,e.version,e.digital_id, ");
		sql.append(" e.quantity AS amount,e.price AS money,e.discount_flag,e.discount_num ");
		sql.append(" FROM tb_digital d,tb_digital_ext e WHERE e.digital_id = d.digital_id ");
		sql.append(" AND d.digital_id = ? ");
		
		return jdbcTemplate.query(sql.toString(), new Object[]{digital_id}, 
				new RowMapper<DigitAdmin>(){

					@Override
					public DigitAdmin mapRow(ResultSet rs, int rowNum) throws SQLException {
						DigitAdmin digit = new DigitAdmin();
						digit.setDigital_id(rs.getInt("digital_id"));
						digit.setTitle(rs.getString("title"));
						digit.setDescription(rs.getString("description"));
						digit.setFactory(rs.getString("factory"));
						digit.setRelease_date(rs.getString("release_date").substring(0, 19));
						digit.setQuantity(rs.getString("quantity"));
						digit.setWeight(rs.getString("weight"));
						digit.setProduce_from(rs.getString("produce_from"));
						digit.setFunc(rs.getString("func"));
						digit.setId(rs.getInt("id"));
						digit.setColor(rs.getString("color"));
						digit.setVersion(rs.getString("version"));
						digit.setAmount(rs.getString("amount"));
						digit.setMoney(rs.getString("money"));
						digit.setDiscount_flag(rs.getString("discount_flag"));
						digit.setDiscount_num(rs.getString("discount_num"));
						return digit;
					}
			
		});
	}

	@Override
	public void updateDigit(DigitDetail detail) throws Exception {
		logger.info("Execute updateDigit");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE tb_digital SET title=?,description=?,weight=?,produce_from=?, ");
		sql.append(" func=?,upd_user=?,upd_date=?,upd_ip=? WHERE digital_id = ? ");
		jdbcTemplate.update(sql.toString(),new Object[]{detail.getTitle(),
				detail.getDescription(),detail.getWeight(),detail.getProduce_from(),
				detail.getFunc(),detail.getUpd_user(),
				detail.getUpd_date(),detail.getUpd_ip(),detail.getDigital_id()});
	}

	@Override
	public void updateDigitExt(DigitAdmin digitAdmin) throws Exception {
		logger.info("Execute updateDigitExt");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE tb_digital_ext SET quantity=?,price=?,discount_flag=?,discount_num=?, ");
		sql.append(" upd_user=?,upd_date=?,upd_ip=? WHERE id = ? ");
		jdbcTemplate.update(sql.toString(), new Object[]{digitAdmin.getAmount(),digitAdmin.getMoney(),
				digitAdmin.getDiscount_flag(),digitAdmin.getDiscount_num(),digitAdmin.getUpd_user(),
				digitAdmin.getUpd_date(),digitAdmin.getUpd_ip(),digitAdmin.getId()});
		
		StringBuffer sql1 = new StringBuffer();
		sql1.append(" UPDATE tb_digital SET quantity = (SELECT sum(quantity) FROM tb_digital_ext ");
		sql1.append(" WHERE digital_id = ?),price = (SELECT min(price) FROM tb_digital_ext ");
		sql1.append(" WHERE digital_id = ?),upd_user=?,upd_date=?,upd_ip=? WHERE digital_id = ? ");
		jdbcTemplate.update(sql1.toString(), new Object[]{digitAdmin.getDigital_id(),
				digitAdmin.getDigital_id(),digitAdmin.getUpd_user(),digitAdmin.getUpd_date(),
				digitAdmin.getUpd_ip(),digitAdmin.getDigital_id()});
	}

	@Override
	public void deleteOne(DigitAdmin digitAdmin) throws Exception {
		logger.info("Execute deleteOne");
		
		String sql = "DELETE FROM tb_digital_ext WHERE id=?";
		jdbcTemplate.update(sql, new Object[]{digitAdmin.getId()});
		
		StringBuffer sql1 = new StringBuffer();
		sql1.append(" UPDATE tb_digital SET quantity = (SELECT sum(quantity) FROM tb_digital_ext ");
		sql1.append(" WHERE digital_id = ?),price = (SELECT min(price) FROM tb_digital_ext ");
		sql1.append(" WHERE digital_id = ?) WHERE digital_id = ? ");
		jdbcTemplate.update(sql1.toString(), new Object[]{digitAdmin.getDigital_id(),
				digitAdmin.getDigital_id(),digitAdmin.getDigital_id()});
	}

	@Override
	public String addDigit(DigitAdmin digitAdmin) throws Exception {
		logger.info("Execute addDigit");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("title", digitAdmin.getTitle());
		map.put("description", digitAdmin.getDescription());
		map.put("factory", digitAdmin.getFactory());
		map.put("release_date", digitAdmin.getRelease_date());
		map.put("quantity", digitAdmin.getQuantity());
		map.put("price", digitAdmin.getPrice().toString());
		map.put("serial_no", digitAdmin.getSerial_no());
		map.put("category_code", digitAdmin.getCategory_code());
		map.put("weight", digitAdmin.getWeight());
		map.put("produce_from", digitAdmin.getProduce_from());
		map.put("func", digitAdmin.getFunc());
		map.put("image_address", digitAdmin.getImage_address());
		map.put("image_address_big", digitAdmin.getImage_address_big());
		map.put("image_small", digitAdmin.getImage_small());
		map.put("upd_user", digitAdmin.getUpd_user());
		map.put("upd_date", digitAdmin.getUpd_date());
		map.put("upd_ip", digitAdmin.getUpd_ip());
		
		Number digital_id = insertJdbcTemplate.executeAndReturnKey(map);
		
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO tb_digital_ext(color,version,digital_id,quantity,price, ");
		sql.append(" upd_user,upd_date,upd_ip) VALUES (?,?,?,?,?,?,?,?) ");
		jdbcTemplate.update(sql.toString(), new Object[]{digitAdmin.getColor(),digitAdmin.getVersion(),
				String.valueOf(digital_id),digitAdmin.getQuantity(),digitAdmin.getPrice(),
				digitAdmin.getUpd_user(),digitAdmin.getUpd_date(),digitAdmin.getUpd_ip()});
		
		return String.valueOf(digital_id);
	}

	@Override
	public void addExt(DigitAdmin digitAdmin) throws Exception {
		logger.info("Execute addExt");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO tb_digital_ext (color,version,digital_id,quantity,price, ");
		sql.append(" upd_user,upd_date,upd_ip) ");
		sql.append(" VALUES (?,?,?,?,?,?,?,?) ");
		
		jdbcTemplate.update(sql.toString(), new Object[]{digitAdmin.getColor(),digitAdmin.getVersion(),
				digitAdmin.getDigital_id(),digitAdmin.getAmount(),digitAdmin.getMoney(),
				digitAdmin.getUpd_user(),digitAdmin.getUpd_date(),digitAdmin.getUpd_ip()});
		
		StringBuffer sql1 = new StringBuffer();
		sql1.append(" UPDATE tb_digital SET quantity = (SELECT sum(quantity) FROM tb_digital_ext ");
		sql1.append(" WHERE digital_id = ?),price = (SELECT min(price) FROM tb_digital_ext ");
		sql1.append(" WHERE digital_id = ?) WHERE digital_id = ? ");
		jdbcTemplate.update(sql1.toString(), new Object[]{digitAdmin.getDigital_id(),
				digitAdmin.getDigital_id(),digitAdmin.getDigital_id()});
	}

	@Override
	public void down(String digital_id) throws Exception {
		logger.info("Execute down");
		
		String sql = "DELETE FROM tb_digital_ext WHERE digital_id = ?";
		jdbcTemplate.update(sql, new Object[]{digital_id});
		
		String sql2 = "DELETE FROM tb_digital WHERE digital_id = ?";
		jdbcTemplate.update(sql2, new Object[]{digital_id});
	}
	

}
