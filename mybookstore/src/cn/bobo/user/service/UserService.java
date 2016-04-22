package cn.bobo.user.service;

import cn.bobo.domain.User;
import cn.bobo.user.dao.UserDao;
import cn.bobo.utils.BookStoreUtils;
import cn.bobo.utils.PasswordUtils;

public class UserService {
	//声明dao
	UserDao dao = new UserDao();
	public void save(User user) {
		//给user设置id
		user.setId(BookStoreUtils.uuid());
		user.setPwd(PasswordUtils.encodePassword(user.getName(), user.getPwd()));
		//调用
		dao.save(user);
		//显示登录页面
	}
	/**
	 * 在对密码进行计算
	 * @param user
	 * @return
	 */
	public User login(User user) {
		//只要用户名密码是之前的，那么加密就一样
		user.setPwd(PasswordUtils.encodePassword(user.getName(), user.getPwd()));
		return dao.login(user);
	}

}
