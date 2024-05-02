package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datao.BookDataImpl;
import com.db.Dbconnect;
import com.entity.Bookdetails;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	 try {
		 	int id=Integer.parseInt(req.getParameter("idname"));
		 	String bookname=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String status=req.getParameter("status");
			
			Bookdetails b=new Bookdetails();
			b.setBookid(id);
			b.setBookname(bookname);
			b.setAuthor(author);
			b.setPrice(price);
			b.setstatus(status);
			
			BookDataImpl data=new BookDataImpl(Dbconnect.getConn());
			boolean f=data.UpdateEditBooks(b);
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("Successmsg", "Book Added Sussessfully");
				res.sendRedirect("admin/allbooks.jsp");
			}else {
				session.setAttribute("Failedmsg", "Something went wrong");
				res.sendRedirect("admin/allbooks.jsp");
			}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
          
	}


}
