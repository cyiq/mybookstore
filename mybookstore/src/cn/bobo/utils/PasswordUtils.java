package cn.bobo.utils;

import java.security.MessageDigest;

import org.junit.Test;

public class PasswordUtils {
	
	public static String encodePassword(String userName,String password){
		//声明加密以后密码值
		String pwd = "";
		try {
			int nameHash = userName.hashCode();
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bs = md.digest(password.getBytes());
			for (byte b : bs) {
				int res = b+nameHash;
				int a = res&0xff;
				if(a<16){
					a+=16;
				}
				String hex = Integer.toHexString(a);
				pwd+=hex;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pwd;
	}
	
	
	
	
	
	
	/**
	 * 以下只是基本算法 对于相同的密码加密以后值也一样 32位 23b58def11b45727d3351712515f86af
	 * 
	 * @throws Exception
	 */
	/*@Test
	public void encode() throws Exception {
		String pwd = "  ";
		// 声明加密算法类
		MessageDigest md = MessageDigest.getInstance("MD5");
		// 返回加密以后字节类组
		byte[] bs = md.digest(pwd.getBytes());
		// 输出固定长度的哈希值
		// System.err.println(bs.length);
		String password = "";

		for (byte b : bs) {
			// System.err.println(b+",");//-127~128
			String hex = Integer.toHexString(b);
			int a = b & 0xff;
			if (a < 16) {
				a += 16;
			}
			String hex2 = Integer.toHexString(a);
			password += hex2;
			System.err.print(hex2 + " ");
		}
		System.err.println();
		System.err.println(password);
	}

	*//**
	 * 由于所有用户名都不相同 所以就用用户名的hash值，与密码的hash值进行加运算，对结果在进行取值
	 * 
	 * @throws Exception
	 *//*
	@Test
	public void encode2() throws Exception {
		String name="jack";
		 //根据name获取name的hash值
		int nameHash = name.hashCode();
		String pwd = "  ";
		// 声明加密算法类
		MessageDigest md = MessageDigest.getInstance("MD5");
		// 返回加密以后字节类组
		byte[] bs = md.digest(pwd.getBytes());
		// 输出固定长度的哈希值
		// System.err.println(bs.length);
		String password = "";

		for (byte b : bs) {
			int res = b+nameHash;
			int a = res&0xff;
			System.err.println(a);
			if(a<16){
				a+=16;
			}
			String hex = Integer.toHexString(a);
			password+=hex;
			System.err.println(hex);
		}
		System.err.println();
		System.err.println(password);
	}*/
}
