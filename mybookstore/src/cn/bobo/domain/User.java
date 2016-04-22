package cn.bobo.domain;

public class User {
	private String id;
	private String name;
	private String pwd;
	private String mail;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public User(String id, String name, String pwd, String mail) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.mail = mail;
	}
	public User() {
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", pwd=" + pwd + ", mail="
				+ mail + "]";
	}
}
