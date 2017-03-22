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

import com.sh.mall.domain.ReceiptAddress;
import com.sh.mall.repository.customer.IAddressDAO;

@Repository
public class AddressDAOImpl implements IAddressDAO {
	private static final Logger logger = LoggerFactory.getLogger(AddressDAOImpl.class);
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	/**
	 * 列表收货地址
	 */
	@Override
	public List<ReceiptAddress> showReceiptAddress(String nickname) {
		logger.info("Execute showReceiptAddress");
		
		StringBuffer showAddresssql = new StringBuffer();
		showAddresssql.append(" SELECT address_id,belong_to,detailed,zip_code,");
		showAddresssql.append(" receiver,phone,default_address FROM tb_address ");
		showAddresssql.append(" WHERE nickname = ? ");
		
		return this.jdbcTemplate.query(showAddresssql.toString(), new Object[]{nickname},
				new RowMapper<ReceiptAddress>(){

					@Override
					public ReceiptAddress mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						ReceiptAddress receiptAddress = new ReceiptAddress();
						receiptAddress.setAddress_id(rs.getInt("address_id"));
						receiptAddress.setBelong_to(rs.getString("belong_to"));
						receiptAddress.setDetailed(rs.getString("detailed"));
						receiptAddress.setZip_code(rs.getString("zip_code"));
						receiptAddress.setReceiver(rs.getString("receiver"));
						receiptAddress.setPhone(rs.getString("phone"));
						receiptAddress.setDefault_address(rs.getString("default_address"));
						
						return receiptAddress;
					}
			
		});
	}

	/**
	 * 保存新增的收货地址
	 */
	@Override
	public void saveReceiptAddress(ReceiptAddress address) {
		logger.info("Execute saveReceiptAddress");
		
		StringBuffer saveAddresssql = new StringBuffer();
		saveAddresssql.append(" INSERT INTO tb_address(nickname,belong_to,detailed,");
		saveAddresssql.append(" zip_code,receiver,phone) VALUES(?,?,?,?,?,?) ");
		
		this.jdbcTemplate.update(saveAddresssql.toString(),new Object[]{address.getNickname(),
			address.getBelong_to(),address.getDetailed(),address.getZip_code(),
			address.getReceiver(),address.getPhone()});
	}

	/**
	 * 删除地址
	 */
	@Override
	public void deleteReceiptAddress(final List<Integer> address_ids) {
		logger.info("Execute deleteReceiptAddress");
		
		String deletesql = "DELETE FROM tb_address WHERE address_id = ?";
		this.jdbcTemplate.batchUpdate(deletesql,new BatchPreparedStatementSetter(){

			@Override
			public void setValues(PreparedStatement ps, int i)
					throws SQLException {
				ps.setInt(1, address_ids.get(i));
			}

			@Override
			public int getBatchSize() {
				return address_ids.size();
			}
		});
	}

}
