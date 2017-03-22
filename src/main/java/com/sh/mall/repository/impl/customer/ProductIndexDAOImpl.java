package com.sh.mall.repository.impl.customer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.sh.mall.domain.ProductIndex;
import com.sh.mall.repository.customer.IProductIndexDAO;

@Repository
public class ProductIndexDAOImpl implements IProductIndexDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductIndexDAOImpl.class);
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	/**
	 * index页面产品显示
	 */
	@Override
	public List<ProductIndex> list(String flag) {
		logger.info("Execute list productIndex");
		
		String listSql = "";
		
		if(flag.equals("discount")){
			listSql = "SELECT digital_id,title,price,image_address FROM " +
					"tb_digital WHERE discount_flag = 'T' LIMIT 4";
		}
		if(flag.equals("category_1")){
			listSql = "SELECT digital_id,title,price,image_address FROM " +
					"tb_digital WHERE category_code = '1' LIMIT 4";
		}
		if(flag.equals("category_2")){
			listSql = "SELECT digital_id,title,price,image_address FROM " +
					"tb_digital WHERE category_code = '2' LIMIT 3";
		}
		if(flag.equals("category_3")){
			listSql = "SELECT digital_id,title,price,image_address FROM " +
					"tb_digital WHERE category_code = '3' LIMIT 3";
		}
		
		return this.jdbcTemplate.query(listSql,new RowMapper<ProductIndex>(){

			@Override
			public ProductIndex mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				ProductIndex productIndex = new ProductIndex();
				
				productIndex.setDigital_id(rs.getInt("digital_id"));
				productIndex.setTitle(rs.getString("title"));
				productIndex.setPrice(rs.getBigDecimal("price"));
				productIndex.setImage_address(rs.getString("image_address"));
				
				return productIndex;
			}
			
		});
	}

}
