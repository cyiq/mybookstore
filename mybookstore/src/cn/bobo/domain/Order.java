package cn.bobo.domain;

import java.util.ArrayList;
import java.util.List;

public class Order {
	private String id;
	private double money;
	private String stat;
	private String ctime;
	private String uid;
	private List<OrderLine> lines = new ArrayList<OrderLine>();//订单明细

	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public List<OrderLine> getLines() {
		return lines;
	}
	public void setLines(List<OrderLine> lines) {
		this.lines = lines;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", money=" + money
				+ ", stat=" + stat + ", ctime=" + ctime + "]";
	}
	
	
}
