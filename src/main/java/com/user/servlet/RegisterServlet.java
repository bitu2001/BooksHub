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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
       

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");

			// System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
			

			userdataimpl data=new userdataimpl(Dbconnect.getConn());
			boolean f2=data.checkUser(email);
			
			if (f2) {
				boolean f=data.userRegister(us);
			if(f){
//				System.out.println("User registration successful");
				
				session.setAttribute("Success", "User registration successful");
				res.sendRedirect("login.jsp");
			}else{
//				System.out.println("Something went wrong");
				session.setAttribute("Failed", "Something went wrong");
				res.sendRedirect("register.jsp");
			}
			}else{
				session.setAttribute("Failed", "Email Already Present Use Another Email");
				res.sendRedirect("register.jsp");
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
