package cn.bobo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter{

	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}


	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//转换成http
		HttpServletRequest req = (HttpServletRequest) request;
		if(req.getSession().getAttribute("user")==null){
			if(req.getRequestURI().contains("BuyServlet")){
			
				String bookid = req.getParameter("bookid");
				req.getSession().setAttribute("bookid", bookid);
			}			
			req.getSession().setAttribute("msg", "你还没有登录，请先登录");
			//重定向
			HttpServletResponse resp = (HttpServletResponse) response;
			resp.sendRedirect(req.getContextPath()+"/jsps/user/login.jsp");
		}else{
			chain.doFilter(req, response);
		}
	}
	@Override
	public void destroy() {
		
	}


}
