package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datao.BookDataImpl;
import com.db.Dbconnect;

@WebServlet("/deleteoldbook")
public class DeleteOldBookServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			String em=req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			BookDataImpl data=new BookDataImpl(Dbconnect.getConn());
			boolean f=data.OldBookDelete(em,"Old",id);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("SuccessMsg", "Old Book Removed ");
				res.sendRedirect("OldBook.jsp");
			}else {
				session.setAttribute("FailedMsg", "Something Error on server");
				res.sendRedirect("OldBook.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
