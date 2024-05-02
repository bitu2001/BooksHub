package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datao.BookOrderDataImpl;
import com.datao.CartDataImpl;
import com.db.Dbconnect;
import com.entity.BookOrder;
import com.entity.Bookdetails;
import com.entity.Cart;

@WebServlet("/Order")
public class OrderServlet extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name=req.getParameter("username");
			String email=req.getParameter("userEmail");
			String phno=req.getParameter("userphno");
			String address=req.getParameter("useradd");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymenttype=req.getParameter("paymenttype");

			String fulladd=address+","+landmark+","+city+","+state+","+pincode;
			
			
			
			CartDataImpl data=new CartDataImpl(Dbconnect.getConn());
			BookOrderDataImpl data2=new BookOrderDataImpl(Dbconnect.getConn());

			BookOrder o=null;
			
			
			ArrayList<BookOrder> orderlist=new ArrayList<BookOrder>();
			
			Random r=new Random();
			List<Cart> blist=data.getBookByUser(id);
			if(blist.isEmpty()) {
				res.sendRedirect("Cart.jsp");
				session.setAttribute("FailedMsg", "Cart Is Empty");
			}else {
				for(Cart c:blist) {
					o=new BookOrder();
					o.setOrderid("BOOK-ORD-00"+r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fulladd);
					o.setBookname(c.getBookname());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymenttype(paymenttype);
					orderlist.add(o);
				}
				
				
				if("noselect".equals(paymenttype)) {
					session.setAttribute("FailedMsg", "Choose payment method");
					res.sendRedirect("Cart.jsp");
				}else {
					boolean f=data2.SaveOrder(orderlist);
					if(f) {
						res.sendRedirect("OrderSuccess.jsp");
					}else{
						session.setAttribute("FailedMsg", "Order Failed");
						res.sendRedirect("Cart.jsp");				}
					
				}

			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
