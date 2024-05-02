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
<title>All Old Books</title>
<style type="text/css">
.crd-hv:hover{
background-color: #7d7b7a;
	color:white
	}
</style>
</head>
<body style="background-color: #4f4f4f">
    <%@include file="allcomponents/Navbar.jsp" %>
    
    <div class="container">
        <h3 class="text-center text-white">Old Books</h3>
        <div class="row">
     <%
        BookDataImpl data=new BookDataImpl(Dbconnect.getConn());
        List <Bookdetails> list=data.getAllOldBooks();
        for(Bookdetails b:list)
        {%>
        	 <div class="col-md-4 mt-4">
        <div class="card crd-hv">
        <div class="card-body text-center">
        <img alt="" src="book/<%=b.getPhotoName() %>" style="width:150px; height:200px;" class="img-thumblin">
        <p><%=b.getBookname() %></p>
        <p>Author:<%=b.getAuthor() %></p>
       <p>Catagory:<%=b.getBookcatagory() %></p>
       <div class="row text-center">
       <a href="ViewBookDetails.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm ml-5"><i class="fa-solid fa-circle-info"></i>View Details</a>
       <a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-indian-rupee-sign"></i>  <%=b.getPrice() %></a>
       
        </div>
        </div>
        </div>
        </div>
        <%}
        	%>
        
        </div>
        </div>
    
 <%@include file="allcomponents/Footer.jsp" %>
</body>
</html>