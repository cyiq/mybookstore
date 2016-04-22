package cn.bobo.listener;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import cn.bobo.utils.PageUtils;

/**
 * 读取用户配置的信息 configLocation
 * 
 * @author Administrator
 * 
 */
public class MyContextListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}
	/**
	 * 只会执行一次
	 */
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext ctx = sce.getServletContext();
		String configFile = ctx.getInitParameter("configLocation");
		if (configFile == null) {
			configFile = "view.properties";
		}
		InputStream in=null;
		if(configFile.startsWith("/")){
		String path = ctx.getRealPath(configFile);
			try {
				in = new FileInputStream(path);
			} catch (Exception e1) {
				throw new RuntimeException(e1);
			}
		}else{
			in = MyContextListener.class.getClassLoader()
				.getResourceAsStream(configFile);
		}
		PageUtils.setIn(in);
	}

}
