package cn.bobo.book.dao;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import static cn.bobo.utils.DataSourceUtils.*;
import cn.bobo.domain.Book;
import cn.bobo.pubs.QueryRunner;
public class BookDao {
	/**
	 * 查询所有的商品
		参数为类型id
	 */
	public List<Book> query(String typeid){
		String sql = "select * from books";
		if(typeid!=null){
			sql = "select b.* from books b inner join booktype bt on b.id=bt.bookid"
					+ " where bt.typeid=+'"+typeid+"'";
		}
		QueryRunner run = new QueryRunner(getDataSource());
		List<Book> list = run.query(sql, new BeanListHandler<Book>(Book.class));
		return list;
	}
/**
 * 查询一个商品的信息
 * @param bookid
 * @return
 */
	public Book detail(String bookid) {
		String sql = "select * from books where id=?";
		QueryRunner run = new QueryRunner(getDataSource());
	Book book = run.query(sql, new BeanHandler<Book>(Book.class),bookid);
		return book;
	}
	/**
	 * 增加商品
	 * @param book
	 */
	public void save(Book book,String tid) {
//		INSERT INTO books (id,NAME) VALUES('bbb','555');
//		INSERT INTO booktype VALUES('bbb','T001');
		String sql = "INSERT INTO books (id,name,price,img,rebate,stock,brief,content,onlinetime) VALUES(?,?,?,?,?,?,?,?,?)";
		QueryRunner run = new QueryRunner(getDataSource());
		Object[] params = {book.getId(),book.getName(),book.getPrice(),book.getImg(),book.getRebate(),
							book.getStock(),book.getBrief(),book.getContent(),book.getOnlinetime()
							};
		run.update(sql, params);
		sql = "INSERT INTO booktype VALUES(?,?)";
		Object[] params2 = {book.getId(),tid};
		run.update(sql,params2);
	}
}
