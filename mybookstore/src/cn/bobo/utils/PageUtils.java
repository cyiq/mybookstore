package cn.bobo.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 专门用于获取资源文件
 * @author Administrator
 *
 */
public class PageUtils {
	private static Properties prop;
	public static void setIn(InputStream in){
		prop = new Properties();
		try {
			prop.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static String getPage(String key){
		String page = prop.getProperty(key);
		if(page==null){
			throw new RuntimeException("你没有配置这个key"+key);
		}
		return page;
	}
}
