package cn.bobo.utils;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;

/**
 * 
 *事务的代理类，可以代理任意的service
 */
public class TxProxy implements InvocationHandler {
	private Object src;	//声明被代理的对象
	private TxProxy(Object src){//	在私有的构造中为成员设定值
		this.src = src;
	}
	/**
	 * 提供一个静态的方法返回代理对象
	 * 
	 */
	public static Object factory(Object src){
		System.err.println("0  返回代理类");
		Object proxyedObj = //生成被代理类的接口的子类
				Proxy.newProxyInstance(
						TxProxy.class.getClassLoader(),
						src.getClass().getInterfaces(),
						new TxProxy(src));
		return proxyedObj;
	}
	/**
	 * 以下是执行句柄，当调用代理类的任意方法是时都会调用
	 	在这是管理事务的关键
	 */
	
	@Override
	public Object invoke(Object proxy, Method method, Object[] args)
			throws Throwable {
		//判断是否有事务的注解
		if(!method.isAnnotationPresent(Tx.class)){
			return method.invoke(src, args);
		}
			
		//第一步：声明连接
		Connection con = null;
		Object returnValue = null;
		try{
			//第二步：获取连接
			con=DataSourceUtils.getConn();
			//设置事务的开始
			con.setAutoCommit(false);
			//调用目标类（被代理类）的方法
			returnValue = method.invoke(src, args);
			//调用成功提交事务	
			con.commit();
		}catch(Exception e){
			con.rollback();
			throw e;
		}finally{
			con.close();
			DataSourceUtils.remove();
		}
		
		return returnValue;
	}
}
