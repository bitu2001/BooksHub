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
@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			HttpSession session=req.getSession();
			
			userdataimpl data=new userdataimpl(Dbconnect.getConn());
			boolean f =data.checkPassword(id, password);
			
			if(f) {
				
				boolean f2=data.updateProfile(us);
				if(f2) {
					session.setAttribute("Success", "Profile Updated successful");
					res.sendRedirect("EditProfile.jsp");
				}else {
					session.setAttribute("Success", "Something Wrong on Server");
					res.sendRedirect("EditProfile.jsp");
				}
				
			}else {
				session.setAttribute("Failed", "Password is incorrect");
				res.sendRedirect("EditProfile.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
