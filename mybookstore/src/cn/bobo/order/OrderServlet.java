package cn.bobo.order;

import java.math.BigDecimal;	
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bobo.book.service.BookService;
import cn.bobo.domain.Book;
import cn.bobo.domain.Order;
import cn.bobo.domain.OrderLine;
import cn.bobo.domain.User;
import cn.bobo.order.service.IOrderService;
import cn.bobo.order.service.OrderService;
import cn.bobo.utils.BaseServlet;
import cn.bobo.utils.BookStoreUtils;
import cn.bobo.utils.TxProxy;

public class OrderServlet extends BaseServlet {
	private IOrderService service = (IOrderService)TxProxy.factory(new OrderService()); 
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		User user = (User) req.getSession().getAttribute("user");
		//放到req
		return "order";
	}
	/**
	 * 接收
	 * 送货地址
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public String create(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		User user = (User) req.getSession().getAttribute("user");
		//声明order
		Order order = new Order();
		order.setCtime(BookStoreUtils.date());
		order.setStat("0");
		order.setId(BookStoreUtils.order(order));
		order.setUid(user.getId());
		//声明总金额
		BigDecimal amount = new BigDecimal(0);
		//遍历所有的购物车中的书
		Map<String,Book> car = (Map<String, Book>) req.getSession().getAttribute("car");
		for(Book b:car.values()){
			//一行就是一个明细
			OrderLine ol = new OrderLine();
			ol.setId(BookStoreUtils.uuid());
			ol.setBookid(b.getId());
			ol.setCont(b.getSum());
			BigDecimal a = new BigDecimal(b.getPrice());
			a = a.multiply(new BigDecimal(b.getRebate()));			
			a = a.divide(new BigDecimal(1),BigDecimal.ROUND_HALF_UP);
			
			ol.setPrice(a.doubleValue());
			
			a = a.multiply(new BigDecimal(b.getSum()));
			amount=amount.add(a);
			//明细加到order
			order.getLines().add(ol);
		}
		order.setMoney(amount.doubleValue());
		service.create(order);
		req.getSession().removeAttribute("car");
		 
		return "302:listAll";
	}
	
	public String list(HttpServletRequest req, HttpServletResponse resp){
		User user = (User) req.getSession().getAttribute("user");
		BookService bookService = new BookService();
		List<Order> orderList = service.listOrder(user.getId());
		List<OrderLine> orderLineList = new ArrayList<OrderLine>();
		for(Order order : orderList){
			for(OrderLine ol : service.listOrderLine(order.getId())){
				orderLineList.add(ol);
			}
		}
		List<Book> bookList = bookService.query(null);
		req.setAttribute("orderList", orderList);
		req.setAttribute("orderLineList", orderLineList);
		req.setAttribute("bookList",bookList);
		return "orderList";
	}
}
