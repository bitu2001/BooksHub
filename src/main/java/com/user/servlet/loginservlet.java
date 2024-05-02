package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datao.userdataimpl;
import com.db.Dbconnect;
import com.entity.User;
@WebServlet("/login")
public class loginservlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		userdataimpl data=new userdataimpl(Dbconnect.getConn());
		HttpSession session=req.getSession();
		try {
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			if("admin@gmail.com".equals(email) && "Admin@123".equals(password)){
				User us=new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				res.sendRedirect("admin/home.jsp");
			}else{
				User us=data.login(email, password);
				if (us!=null) {
					session.setAttribute("userobj", us);
					res.sendRedirect("index.jsp");
				}else{
					session.setAttribute("Failed", "Email and password invaild");
					res.sendRedirect("login.jsp");
				}

				res.sendRedirect("home.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
