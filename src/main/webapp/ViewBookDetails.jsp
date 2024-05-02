<%@page import="com.entity.Bookdetails"%>
<%@page import="com.db.Dbconnect"%>
<%@page import="com.datao.BookDataImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<%@include file="allcomponents/allcss.jsp" %>
</head>
<body style="background-color: antiquewhite;">
<%@include file="allcomponents/Navbar.jsp" %>

<%
int bid=Integer.parseInt(request.getParameter("bid"));
BookDataImpl data=new BookDataImpl(Dbconnect.getConn());
Bookdetails b=data.getBookById(bid);
%>


<div class="container p-3">
    <div class="row ">
        <div class="col-md-6 text-center p-5 border bg-white">
            <img src="book/<%=b.getPhotoName() %>" alt="" style="height: 100px; width: 100px;"><br>
            <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookname() %></span></h4>
            <h4>Author: <span class="text-success"><%=b.getAuthor() %></span></h4>
            <h4>Catagory:<span class="text-success"><%=b.getBookcatagory() %></span></h4>
        </div>
        <div class="col-md-6 text-center p-5 border bg-white">
            <h2><%=b.getBookname() %></h2>
            
            <%
            if("Old".equals(b.getBookcatagory()))
            {%>
            <h5 class="text-primary">Contact to Seller</h5>
            <h5 class="text-primary"><i class="fa-solid fa-envelope"></i>
            Email:<%=b.getUser_email() %></h5>	
           <%}
            %>
            
            <div class="row mt-2">
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-solid fa-money-bill fa-3x"></i>
                    <p>Cash On Delivery</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-solid fa-rotate-left fa-3x"></i>
                    <p>Return Available</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-solid fa-truck-moving fa-3x"></i>
                    <p>Free Delivery</p>
                </div>
            </div>
            
            <%
            if("Old".equals(b.getBookcatagory()))
            {%>
            	
            	 <div class="text-center">
                <a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-shopping"></i>
                    Continue Shooping</a>
                <a href="" class="btn btn-danger ml-2"><i class="fa-solid fa-indian-rupee-sign"></i>
                    <%=b.getPrice() %></a>
            </div>
            	
            <%}else{%>
            	<div class="text-center">
                <a href="" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i>
                    Add To Cart</a>
                <a href="" class="btn btn-danger ml-2"><i class="fa-solid fa-indian-rupee-sign"></i>
                    <%=b.getPrice() %></a>
            </div>
            <%}

            %>
            
            
            
            

        </div>

    </div>
</div>

<%@include file="allcomponents/Footer.jsp" %>
</body>
</html>