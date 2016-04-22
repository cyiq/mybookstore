package cn.bobo.type.dao;
import java.util.List;

import static cn.bobo.utils.DataSourceUtils.*;

import javax.sql.DataSource;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.bobo.domain.Types;
import cn.bobo.pubs.QueryRunner;
public class TypeDao {
/**
 * 查询所有图书分类
 */
	public List<Types> queryAll(){
		String sql = "select * from types";
		QueryRunner run = new QueryRunner(getDataSource());
		List<Types> types = 
				run.query(sql, new BeanListHandler<Types>(Types.class));
		return types;
	}
}
