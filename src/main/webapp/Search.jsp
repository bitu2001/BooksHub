<%@page import="com.entity.User"%>
<%@page import="com.db.Dbconnect"%>
<%@page import="com.datao.BookDataImpl"%>
<%@page import="com.entity.Bookdetails"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="allcomponents/allcss.jsp" %>
<title>Search Books</title>
<style type="text/css">
.crd-hv:hover{
	background-color: #7d7b7a;
	color:white;
	}
</style>
</head>
<body style="background-color: #4f4f4f">
<%User u=(User)session.getAttribute("userobj"); %>

    <%@include file="allcomponents/Navbar.jsp" %>
        <div class="container-fluid ">
           <div class="container">
        <h3 class="text-center text-white">Recent Books</h3>
        <div class="row text-center">
          <%
          String ch=request.getParameter("ch");
        BookDataImpl data=new BookDataImpl(Dbconnect.getConn());
        List <Bookdetails> list=data.getBookBySearch(ch);
        for(Bookdetails b:list)
        {%>
        	 <div class="col-md-4">
        <div class="card crd-hv">
        <div class="card-body text-center">
        <img alt="" src="book/<%=b.getPhotoName() %>" style="width:150px; height:200px;" class="img-thumblin">
        <p><%=b.getBookname() %></p>
        <p>Author:<%=b.getAuthor() %></p>
        <%
        if(b.getBookcatagory().equals("Old"))
        {%>
                <p>Category:<%=b.getBookcatagory() %></p>
        	<div class="row">
       <a href="ViewBookDetails.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm ml-5"><i class="fa-solid fa-circle-info"></i>View Details</a>
       <a href="" class="btn btn-danger btn-sm ml-3"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
       
        </div>
        <%}else{%>
        	
         <p>Category:<%=b.getBookcatagory() %></p>
        <div class="row">
				<% if(u==null){%>
        	       <a href="login.jsp" class="btn btn-primary  btn-sm ml-3"><i class="fa-solid fa-cart-shopping"></i>Add to cart</a>
        	
        <%}else{%>
               <a href="cartServlet?bid=<%=b.getBookid() %>&&uid=<%=u.getId()%>" class="btn btn-primary  btn-sm ml-3"><i class="fa-solid fa-cart-shopping"></i>Add to cart</a>
        <%}
        
        %>
       <a href="login.jsp" class="btn btn-success btn-sm ml-1"><i class="fa-solid fa-circle-info"></i>View Details</a>
       <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
       
        </div>	
        <%}
        %>
        
       
        </div>
        </div>
        </div>
        <%}
        	%>
       
        </div>
        </div>
        </div>     
    <%@include file="allcomponents/Footer.jsp" %>
</body>
</html>