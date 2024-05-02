package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datao.CartDataImpl;
import com.db.Dbconnect;
@WebServlet("/removeCartItem")
public class RemoveCartItemServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		CartDataImpl data=new CartDataImpl(Dbconnect.getConn());
		boolean f=data.deleteBook(bid,uid,cid);
		
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("SuccessMsg", "Book Removed From Cart");
			res.sendRedirect("Cart.jsp");
		}else {
			session.setAttribute("FailedMsg", "Something Error on server");
			res.sendRedirect("Cart.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
