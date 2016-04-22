package cn.bobo.buy;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bobo.book.service.BookService;
import cn.bobo.domain.Book;
import cn.bobo.utils.BaseServlet;

public class BuyServlet extends BaseServlet {
	private BookService bookService = new BookService();
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		//接收书的id
		String bookid = req.getParameter("bookid");
		System.out.println("bookid is:"+bookid);	
		//TODO;购物车
		//list,从session中获取
		/*List<Book> list = (List<Book>) req.getSession().getAttribute("car");
		if(list==null){
			list = new ArrayList<Book>();
			//放到session
			req.getSession().setAttribute("car", list);
		}
		//将书放到list
				list.add(book);
		//	去一个页面显示
*/			//根据map，在map中判断是否已经买过这本书。
		Map<String,Book> car = (Map<String, Book>) req.getSession().getAttribute("car");
		if(car==null){
			car = new HashMap<String,Book>();
			req.getSession().setAttribute("car", car);
		}
		if(car.get(bookid)==null){
			//根据这个id查询这本书的实例，放到购物车去
			Book book = bookService.detail(bookid);
			//System.err.println("book is"+book);
			book.setSum(1);
			//放到car中去
			car.put(book.getId(), book);
		}else{
			Book bk = car.get(bookid);
				bk.setSum(bk.getSum()+1);
		}
		return "302:car";
	}
}
