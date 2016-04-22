package cn.bobo.order.service;

import java.util.List;

import cn.bobo.domain.Order;
import cn.bobo.domain.OrderLine;
import cn.bobo.order.dao.OrderDao;

public class OrderService implements IOrderService {
	private OrderDao dao = new OrderDao();
	public Order create(Order order){
		return dao.create(order);
	}
	public List<OrderLine> listOrderLine(String orderId){
		return dao.listOrderLine(orderId);
	}
	public List<Order> listOrder(String uid){
		return dao.listOrder(uid);
	}
}
