package com.sh.mall.repository.impl.admin;

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

import com.sh.mall.domain.Admin;
import com.sh.mall.repository.admin.IAdminDAO;

@Repository
public class AdminDAOImpl implements IAdminDAO {
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	/**
	 * 根据姓名得到密码
	 */
	@Override
	public String getPwdByName(String name) {
		logger.info("Execute getPwdByName");
		
		String sql = "SELECT password FROM tb_admin WHERE name=?";
		
		List<String> lists = this.jdbcTemplate.queryForList(sql, 
				new Object[]{name},String.class);
		if(lists!=null&&lists.size()!=0){
			return lists.get(0);
		}
		return null;
	}

	/**
	 * 显示自身信息
	 */
	@Override
	public Admin showself(String name) {
		logger.info("Execute showself");
		
		StringBuffer showSelfsql = new StringBuffer();
		showSelfsql.append(" SELECT admin_id,name,password,permiss_id,");
		showSelfsql.append(" super_admin,upd_user,upd_date,upd_ip ");
		showSelfsql.append(" FROM tb_admin WHERE name = ? ");
		List<Admin> admins = this.jdbcTemplate.query(showSelfsql.toString(), new Object[]{name},
				new RowMapper<Admin>(){

					@Override
					public Admin mapRow(ResultSet rs, int num)
							throws SQLException {
						Admin admin = new Admin();
						admin.setAdmin_id(rs.getInt("admin_id"));
						admin.setName(rs.getString("name"));
						admin.setPassword(rs.getString("password"));
						admin.setPermiss_id(rs.getString("permiss_id"));
						admin.setSuper_admin(rs.getString("super_admin"));
						admin.setUpd_user(rs.getString("upd_user"));
						admin.setUpd_date(rs.getTimestamp("upd_date"));
						admin.setUpd_ip(rs.getString("upd_ip"));
						
						return admin;
					}
		});
		if(admins!=null&&admins.size()!=0){
			return admins.get(0);
		}
		return new Admin();
	}

	/**
	 * 显示所有--超级管理员
	 */
	@Override
	public List<Admin> showAll() {
		logger.info("Execute showAll");
		
		StringBuffer showAllsql = new StringBuffer();
		showAllsql.append(" SELECT admin_id,name,password,permiss_id,");
		showAllsql.append(" super_admin,upd_user,upd_date,upd_ip ");
		showAllsql.append(" FROM tb_admin");
		return this.jdbcTemplate.query(showAllsql.toString(),new RowMapper<Admin>(){

			@Override
			public Admin mapRow(ResultSet rs, int rowNum)
				throws SQLException {
				Admin admin = new Admin();
				admin.setAdmin_id(rs.getInt("admin_id"));
				admin.setName(rs.getString("name"));
				admin.setPassword(rs.getString("password"));
				admin.setPermiss_id(rs.getString("permiss_id"));
				admin.setSuper_admin(rs.getString("super_admin"));
				admin.setUpd_user(rs.getString("upd_user"));
				admin.setUpd_date(rs.getTimestamp("upd_date"));
				admin.setUpd_ip(rs.getString("upd_ip"));
						
				return admin;
			}
		});
	}
	
	/**
	 * 检测用户名是否唯一
	 */
	@Override
	public boolean validateUnique(String name) {
		logger.info("Execute validateUnique");
		
		String validatesql = "SELECT name FROM tb_admin WHERE name = ?";
		List<String> names = this.jdbcTemplate.queryForList(validatesql,
				new Object[]{name}, String.class);
		if(names!=null&&names.size()!=0){
			return false;
		}
		return true;
	}

	/**
	 * 新增管理员
	 */
	@Override
	public void addAdmin(Admin admin) {
		logger.info("Execute addAdmin");
		
		StringBuffer addsql = new StringBuffer();
		addsql.append(" INSERT INTO tb_admin(name,password,permiss_id,");
		addsql.append(" super_admin,upd_user,upd_date,upd_ip)");
		addsql.append(" VALUES(?,?,?,?,?,?,?)");
		
		this.jdbcTemplate.update(addsql.toString(),new Object[]{admin.getName(),
			admin.getPassword(),admin.getPermiss_id(),admin.getSuper_admin(),
			admin.getUpd_user(),admin.getUpd_date(),admin.getUpd_ip()});
	}

	/**
	 * 删除管理员
	 */
	@Override
	public void deleteAdmins(final List<Integer> admin_ids) {
		logger.info("Execute deleteAdmins");
		
		String sql = "DELETE FROM tb_admin WHERE admin_id = ?";
		this.jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps, int i) 
					throws SQLException {
				ps.setInt(1, admin_ids.get(i));
			}
			
			@Override
			public int getBatchSize() {
				return admin_ids.size();
			}
		});
	}

	/**
	 * 更新信息
	 */
	@Override
	public void updateAdmin(Admin admin) {
		logger.info("Execute updateAdmin");
		
		StringBuffer updatesql = new StringBuffer();
		updatesql.append("UPDATE tb_admin SET password=?,upd_user=?,");
		updatesql.append(" upd_date=?,upd_ip=? WHERE name = ?");
		this.jdbcTemplate.update(updatesql.toString(),new Object[]{admin.getPassword(),
			admin.getUpd_user(),admin.getUpd_date(),admin.getUpd_ip(),admin.getName()});
	}

}
