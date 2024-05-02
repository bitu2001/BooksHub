package com.entity;

public class BookOrder {
private int id;
private String orderid;
private String username;
private String email;
private String phno;


public String getOrderid() {
	return orderid;
}
public void setOrderid(String orderid) {
	this.orderid = orderid;
}
private String fulladd;


private String bookname;
private String author;
private String price;
public String getBookname() {
	return bookname;
}
public void setBookname(String bookname) {
	this.bookname = bookname;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
private String paymenttype;
@Override
public String toString() {
	return "BookOrder [id=" + id + ", username=" + username + ", email=" + email + ", phno=" + phno + ", fulladd="
			+ fulladd + ", paymenttype=" + paymenttype + "]";
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhno() {
	return phno;
}
public void setPhno(String phno) {
	this.phno = phno;
}
public String getFulladd() {
	return fulladd;
}
public void setFulladd(String fulladd) {
	this.fulladd = fulladd;
}
public String getPaymenttype() {
	return paymenttype;
}
public void setPaymenttype(String paymenttype) {
	this.paymenttype = paymenttype;
}
public BookOrder() {
	super();
	// TODO Auto-generated constructor stub
}

}
