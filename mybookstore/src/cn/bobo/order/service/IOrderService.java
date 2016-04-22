package cn.bobo.order.service;

import java.util.List;

import cn.bobo.domain.Order;
import cn.bobo.domain.OrderLine;
import cn.bobo.utils.Tx;

public interface IOrderService {
	@Tx
	Order create(Order order);
	public List<OrderLine> listOrderLine(String orderId);
	public List<Order> listOrder(String uid);
}