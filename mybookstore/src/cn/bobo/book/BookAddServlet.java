package cn.bobo.book;

import java.io.File;	
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.bobo.book.service.BookService;
import cn.bobo.domain.Book;
import cn.bobo.domain.Types;
import cn.bobo.type.service.TypeService;
import cn.bobo.utils.BaseServlet;
import cn.bobo.utils.BookStoreUtils;

public class BookAddServlet extends BaseServlet {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		BookService bookService = new BookService();
		Book book = new Book();
		String id = BookStoreUtils.uuid();
		book.setId(id);
		
		String path = getServletContext().getRealPath("/images");
		DiskFileItemFactory disk = 
				new DiskFileItemFactory();
		disk.setRepository(new File("d:/a"));
		String typeId = "";
		try{
			ServletFileUpload up = 
					new ServletFileUpload(disk);
			List<FileItem> list = up.parseRequest(req);
			for(FileItem file:list){
				//第一步：判断是否是普通的表单项
				if(file.isFormField()){
					String fieldName = file.getFieldName();//<input type="text" name="desc">=desc
					String fieldValue = file.getString("UTF-8");//默认以ISO方式读取数据
					if(fieldName.equals("name")){
						book.setName(fieldValue);
					}
					if(fieldName.equals("price")){
						book.setPrice(Double.parseDouble(fieldValue));
					}
					if(fieldName.equals("rebate")){
						book.setRebate(Double.parseDouble(fieldValue));
					}
					if(fieldName.equals("stock")){
						book.setStock(Integer.parseInt(fieldValue));
					}
					if(fieldName.equals("brief")){
						book.setBrief(fieldValue);
					}
					if(fieldName.equals("content")){
						book.setContent(fieldValue);
					}
					if(fieldName.equals("type")){
						typeId = fieldValue;
					}
					
				}else{//说明是一个文件
					String fileName = file.getName();
					fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
					file.write(new File(path+"/"+book.getId()+fileName));
					System.err.println("文件名是:"+book.getId()+fileName);
					System.err.println("文件大小是："+file.getSize());
					book.setImg(book.getId()+fileName);
					file.delete();
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		String onlinetime = BookStoreUtils.date();
		book.setOnlinetime(onlinetime);
		
		System.out.println(book);
		
		bookService.save(book, typeId);
		return "listAll";
	}
	
	public String add(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		TypeService typeService = new TypeService();
		List<Types> types = typeService.queryAll();
		req.setAttribute("types", types);
		return "add";
	}


}
