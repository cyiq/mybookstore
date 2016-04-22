package cn.bobo.domain;

public class OrderLine {
	private String id;
	private String bookid;
	private Integer cont;
	private double price;
	private String orderid;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public Integer getCont() {
		return cont;
	}
	public void setCont(Integer cont) {
		this.cont = cont;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	@Override
	public String toString() {
		return "OrderLine [id=" + id + ", bookid=" + bookid + ", cont=" + cont
				+ ", price=" + price + "]";
	}
	
}
