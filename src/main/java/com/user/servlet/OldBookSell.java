package com.user.servlet;

import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.datao.BookDataImpl;
import com.db.Dbconnect;
import com.entity.Bookdetails;
@WebServlet("/addoldbook")
@MultipartConfig
public class OldBookSell extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String bookname=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String bookcatagory="Old";
			String status="Active";
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			String useremail=req.getParameter("user");

			Bookdetails b=new Bookdetails(bookname,author,price,bookcatagory,status,fileName,useremail);
			BookDataImpl dataimpl=new BookDataImpl(Dbconnect.getConn());
			
			
		
		
			
			boolean f=dataimpl.addBooks(b);
			HttpSession session=req.getSession();

			if (f) {
				
				String path = getServletContext().getRealPath("")+ "book";
				File file=new File(path);
				System.out.println("File Path: "+ file+File.separator +fileName);
				part.write(path+File.separator+fileName);
				
				session.setAttribute("Successmsg", "Book Added Sussessfully");
				res.sendRedirect("SellBook.jsp");
			}else{
				session.setAttribute("Failedmsg", "Something went wrong");
				res.sendRedirect("SellBook.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
