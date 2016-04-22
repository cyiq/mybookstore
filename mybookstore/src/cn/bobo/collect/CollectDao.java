package cn.bobo.collect;

import static cn.bobo.utils.DataSourceUtils.getDataSource;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.bobo.domain.Collect;
import cn.bobo.pubs.QueryRunner;

public class CollectDao {
	public void sava(Collect collect){
		String sql = "INSERT INTO collect (collectid,bookid,userid) VALUES(?,?,?)";
		QueryRunner run = new QueryRunner(getDataSource());
		Object[] params = {collect.getCollectid(),collect.getBookid(),collect.getUserid()};
		run.update(sql, params);
	}
	public List<Collect> list(String uid){
		String sql = "select * from collect where userid=?";
		QueryRunner run = new QueryRunner(getDataSource());
		Object[] params = {uid};
		return run.query(sql, params,new BeanListHandler<Collect>(Collect.class));
	}
	public void delete(String collectid) {
		String sql = "delete from collect where collectid=?";
		QueryRunner run = new QueryRunner(getDataSource());
		Object[] params = {collectid};
		run.update(sql, params);
	}
}
