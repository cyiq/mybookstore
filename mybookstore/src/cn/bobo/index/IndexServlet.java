package cn.bobo.index;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bobo.domain.Types;
import cn.bobo.type.service.TypeService;
import cn.bobo.utils.BaseServlet;

public class IndexServlet extends BaseServlet {
	private TypeService service = new TypeService();
	/**
	 * 去显示主页
	 */
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		List<Types> types = service.queryAll();
		//封装到req
		req.setAttribute("types", types);
		return "index";
	}
	
	public String exit(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.getSession().removeAttribute("user");
		req.getSession().removeAttribute("car");
		List<Types> types = service.queryAll();
		//封装到req
		req.setAttribute("types", types);
		return "index";
	}
	
	

}
