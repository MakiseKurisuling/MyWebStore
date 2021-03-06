package com.webstore.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.webstore.bean.Category;
import com.webstore.utils.DataSourceUtils;

public class CategoryDao {

	public List<Category> findAllCategory() throws SQLException {
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from category;";
		List<Category> list = runner.query(sql, new BeanListHandler<Category>(Category.class));
		return list;
	}

}
