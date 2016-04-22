package cn.bobo.utils;

import java.sql.Connection;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DataSourceUtils {
	
	public static void main(String[] args) {
		getConn();
	}
	
	// 声明线程局部的容器
	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();
	private static DataSource ds;
	static {
		ds = new ComboPooledDataSource();
	} 

	public static DataSource getDataSource() {
		return ds;
	}

	public static Connection getConn() {
		// 先从tl这个容器中获取一次数据，如果当前线程已经保存过connection就直接返回这个connection
		Connection con = tl.get();
		if (con == null) {
			try {
				con = ds.getConnection();// 每一次从ds中获取一个新的连接
				// 将这个con放到tl中
				tl.set(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return con;
	}
	public static Connection openConn(){
		Connection con = null;
		try{
			con = ds.getConnection();
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		return con;
	}
	public static void remove(){
		tl.remove();
	}
}
