package cn.bobo.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bobo.book.service.BookService;
import cn.bobo.domain.Book;
import cn.bobo.utils.BaseServlet;

public class BookServlet extends BaseServlet {
/**
 * 转发到books.jsp
 * 查询某些图书 
 */
	private BookService service = new BookService();
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		String typeid = req.getParameter("typeid");
		
		//查询
		List<Book> list = service.query(typeid);
		//封装到request
		req.setAttribute("list", list);
		return "books";
	}
	/**
	 * 查询一本书的明细
	 */
	public String detail(HttpServletRequest req,HttpServletResponse resp)throws Exception{
			//接收这本书的id
		String bookid = req.getParameter("bookid");
		//查寻这个id所对应的书
		Book book = service.detail(bookid);
		//封装到requ
		req.setAttribute("book", book);
		return "book";
	}
}
