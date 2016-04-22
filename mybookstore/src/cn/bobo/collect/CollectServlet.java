package cn.bobo.collect;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bobo.book.dao.BookDao;
import cn.bobo.domain.Book;
import cn.bobo.domain.Collect;
import cn.bobo.domain.User;
import cn.bobo.utils.BaseServlet;
import cn.bobo.utils.BookStoreUtils;

public class CollectServlet extends BaseServlet {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		return null;
	}
	public String save(HttpServletRequest req, HttpServletResponse resp){
		String bookid = req.getParameter("bookid");
		CollectDao collectDao = new CollectDao();
		User user = (User) req.getSession().getAttribute("user");
		String collectid = BookStoreUtils.uuid();
		Collect collect = new Collect();
		collect.setCollectid(collectid);
		collect.setBookid(bookid);
		collect.setUserid(user.getId());
		collectDao.sava(collect);
		return "302:listAll";
	}
	
	public String list(HttpServletRequest req, HttpServletResponse resp){
		CollectDao collectDao = new CollectDao();
		User user = (User) req.getSession().getAttribute("user");
		BookDao bookDao = new BookDao();
		List<Collect> collectList = collectDao.list(user.getId());
		List<Book> bookList = bookDao.query(null);
		
		req.setAttribute("collectList", collectList);
		req.setAttribute("bookList", bookList);
		
		return "listCollect";
	}
	
	public String delete(HttpServletRequest req, HttpServletResponse resp){
		String collectid = req.getParameter("collectid");
		CollectDao collectDao = new CollectDao();
		collectDao.delete(collectid);
		return "collectList";
	}

}
