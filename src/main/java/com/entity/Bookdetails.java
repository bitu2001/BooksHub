package com.entity;

public class Bookdetails {
private int bookid;
private String bookname;
@Override
public String toString() {
	return "Bookdetails [bookid=" + bookid + ", bookname=" + bookname + ", author=" + author + ", price=" + price
			+ ", bookcatagory=" + bookcatagory + ", status=" + status + ", photoName=" + photoName + ", user_email="
			+ user_email + "]";
}
public int getBookid() {
	return bookid;
}
public void setBookid(int bookid) {
	this.bookid = bookid;
}
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
public String getBookcatagory() {
	return bookcatagory;
}
public void setBookcatagory(String bookcatagory) {
	this.bookcatagory = bookcatagory;
}
public String getstatus() {
	return status;
}
public void setstatus(String status) {
	this.status = status;
}
public String getPhotoName() {
	return photoName;
}
public void setPhotoName(String photoName) {
	this.photoName = photoName;
}
public String getUser_email() {
	return user_email;
}
public void setUser_email(String user_email) {
	this.user_email = user_email;
}
public Bookdetails(String bookname, String author, String price, String bookcatagory, String status,
		String photoName, String user_email) {
	super();
	this.bookid = bookid;
	this.bookname = bookname;
	this.author = author;
	this.price = price;
	this.bookcatagory = bookcatagory;
	this.status = status;
	this.photoName = photoName;
	this.user_email = user_email;
}
public Bookdetails() {
	super();
	// TODO Auto-generated constructor stub
}
private String author;
private String price;
private String bookcatagory;
private String status;
private String photoName;
private String user_email;


}
