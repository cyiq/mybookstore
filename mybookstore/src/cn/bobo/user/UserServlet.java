package cn.bobo.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import cn.bobo.domain.User;
import cn.bobo.user.service.UserService;
import cn.bobo.utils.BaseServlet;

public class UserServlet extends BaseServlet {
	//声明userService
	private UserService service = new UserService();
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		//声明user类
		User user = new User();
		//封装数据
		 BeanUtils.populate(user, req.getParameterMap());
		 //调用service保存
		 service.save(user); 
		 //显示登录页面
		 req.getSession().setAttribute("msg", "你已经注册成功，请直接登录");
		 return "302:login";
	}
	/**
	 * 提供用户登录
	 */
	public String login(HttpServletRequest req,HttpServletResponse resp)throws Exception{
			User user = new User();
			BeanUtils.populate(user, req.getParameterMap());
			//调用service
			User user2 = service.login(user);
			if(user2==null){
				//登录不成功,再去显示登录页面
				req.setAttribute("name",user);
				req.getSession().setAttribute("msg", "你的用户名或密码错误");
				return "login";
			}else{
				//将用户放到session中
				req.getSession().setAttribute("user", user2);
				return "302:succ";
			}
	}

}
