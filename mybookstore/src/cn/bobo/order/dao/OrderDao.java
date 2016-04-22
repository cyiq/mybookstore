package cn.bobo.order.dao;

import static cn.bobo.utils.DataSourceUtils.getConn;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.bobo.domain.Order;
import cn.bobo.domain.OrderLine;
import cn.bobo.pubs.QueryRunner;

public class OrderDao {

	public Order create(Order order) {
		QueryRunner run = new QueryRunner();
		String sql = "insert into orders(id,money,stat,uid,ctime) values(?,?,?,?,?)";
		run.update(getConn(), sql, order.getId(),
				order.getMoney(), order.getStat(), order.getUid(),
				order.getCtime());
		sql = "insert into orderline(id,bookid,cont,price,orderid) values(?,?,?,?,?)";
		for (OrderLine ol : order.getLines()) {
			run.update(getConn(), sql, ol.getId(), ol.getBookid(),
					ol.getCont(), ol.getPrice(), order.getId());
		}
		return order;
	}
	
	public List<Order> listOrder(String uid){
		QueryRunner run = new QueryRunner();
		String sql = "select  id,money,stat,uid,ctime from orders where uid=?";
		Object[] params = {uid};
		List<Order> orderList = run.query(getConn(), sql, new BeanListHandler<Order>(Order.class),params);
		return orderList;
	}
	
	public List<OrderLine> listOrderLine(String orderId){
		QueryRunner run = new QueryRunner();
		String sql = "select  id,bookid,cont,price,orderid from orderline where orderid=?";
		Object[] params = {orderId};
		List<OrderLine> orderList = run.query(getConn(), sql, new BeanListHandler<OrderLine>(OrderLine.class),params);
		return orderList;
	}

}
