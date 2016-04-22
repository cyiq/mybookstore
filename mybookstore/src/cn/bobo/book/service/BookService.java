package cn.bobo.book.service;

import java.util.List;

import cn.bobo.book.dao.BookDao;
import cn.bobo.domain.Book;

public class BookService {
	private BookDao dao = new BookDao();
	public List<Book> query(String typeid){
		return dao.query(typeid);
	}
	public Book detail(String bookid) {
		return dao.detail(bookid);
	}
	public void save(Book book,String typeId){
		dao.save(book,typeId);
	}
}
