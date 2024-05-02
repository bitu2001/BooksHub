package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datao.BookDataImpl;
import com.datao.CartData;
import com.datao.CartDataImpl;
import com.db.Dbconnect;
import com.entity.Bookdetails;
import com.entity.Cart;

/**
 * Servlet implementation class CartServlet
 */

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BookDataImpl data=new BookDataImpl(Dbconnect.getConn());
			Bookdetails b=data.getBookById(bid);
			
			Cart c=new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookname(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotal_price(Double.parseDouble(b.getPrice()));
			
			CartDataImpl data2=new CartDataImpl(Dbconnect.getConn());
			boolean f=data2.addCart(c);
			
			HttpSession session =req.getSession();
			
			if(f) {
				
				session.setAttribute("Addcart","Added To Cart Successfully");
				res.sendRedirect("AllNewBook.jsp");
			}else {
				session.setAttribute("NotAddcart","Not Added To Cart");
				res.sendRedirect("AllNewBook.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
