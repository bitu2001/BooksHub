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

@WebServlet("/deletebook")
public class BooksDeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			BookDataImpl data=new BookDataImpl(Dbconnect.getConn());
			boolean f=data.deletebooks(id);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("valid", "Book Deleted");
				res.sendRedirect("admin/allbooks.jsp");
			}else {
				session.setAttribute("invalid", "Book Not Deleted");
				res.sendRedirect("admin/allbooks.jsp");
			}
		} catch (Exception e) {
e.printStackTrace();		}
	}

}
