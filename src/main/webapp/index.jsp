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
<title>BOOKSHUB</title>
<%@include file="allcomponents/allcss.jsp" %>
<style type="text/css">
.back-img {
    background: url("img/book1.jpg");
    height: 50vh;
    width: 100%;
    background-repeat: no-repeat;
    background-size: cover;
    margin-top: 10px;
}
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
        <h2 class="text-center text-white ">My BOOKSHUB</h2>
    </div>
    <div class="container-fluid back-img">
    </div>

    <!--Recent book-->
        <div class="container">
        <h3 class="text-center text-white">Recent Books</h3>
        <div class="row">
          <%
        BookDataImpl data2=new BookDataImpl(Dbconnect.getConn());
        List <Bookdetails> list2=data2.getRecentbook();
        for(Bookdetails b:list2)
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
        	       <a href="login.jsp" class="btn btn-primary btn-sm ml-3"><i class="fa-solid fa-cart-shopping"></i>Add to cart</a>
        	
        			<%}else{%>
               		<a href="cartServlet?bid=<%=b.getBookid() %>&&uid=<%=u.getId()%>" class="btn btn-primary  btn-sm ml-3"><i class="fa-solid fa-cart-shopping"></i>Add to cart</a>
        			<%}
        	       %>     
          <a href="ViewBookDetails.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm ml-1"><i class="fa-solid fa-circle-info"></i>View Details</a>
       <a  class="btn btn-danger btn-sm ml-1 text-white"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
       
        </div>	
        <%}
        %>
        
       
        </div>
        </div>
        </div>
        <%}
        	%>
       
        </div>
        <div class="text-center mt-1">
        <a href="./AllRecentBooks.jsp" class="btn btn-danger btn-sm text-white">View All</a>
        </div>
        </div>
            <!-- End Recent book-->
            <hr>
            
            
        <!--New book-->
        <div class="container">
        <h3 class="text-center text-white">New Books</h3>
        <div class="row">
        
        <%
        BookDataImpl data=new BookDataImpl(Dbconnect.getConn());
        List <Bookdetails> list=data.getNewBook();
        for(Bookdetails b:list){
        	%>
        	        <div class="col-md-4">
        	<div class="card crd-hv">
        <div class="card-body text-center">
        <img alt="" src="book/<%=b.getPhotoName() %>" style="width:150px; height:200px;" class="img-thumblin">
        <p><%=b.getBookname() %></p>
        <p>Author:<%=b.getAuthor() %></p>
        <p>Category:<%=b.getBookcatagory() %></p>
        <div class="row text-center">
        
        <% if(u==null){%>
        	       <a href="login.jsp" class="btn btn-primary  btn-sm ml-3"><i class="fa-solid fa-cart-shopping"></i>Add to cart</a>
        	
        <%}else{%>
               <a href="cartServlet?bid=<%=b.getBookid() %>&&uid=<%=u.getId()%>" class="btn btn-primary  btn-sm ml-3"><i class="fa-solid fa-cart-shopping"></i>Add to cart</a>
        <%}
        
        %>
       <a href="ViewBookDetails.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm ml-2"><i class="fa-solid fa-circle-info"></i>View Details</a>
       <a class="btn btn-danger btn-sm ml-2 text-white"><i class="fa-solid fa-indian-rupee-sign"></i>  <%=b.getPrice() %></a>
       
        </div>
        </div>
        </div>
        </div>
        	<%
        	
        }
        %> 
        </div>
        <div class="text-center mt-1">
        <a href="./AllNewBook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
        </div>
        </div>
            <!-- End New book-->
            
            <hr>
            <!--Old book-->
        <div class="container">
        <h3 class="text-center text-white">Old Books</h3>
        <div class="row">
     <%
        BookDataImpl data3=new BookDataImpl(Dbconnect.getConn());
        List <Bookdetails> list3=data3.getOldbooks();
        for(Bookdetails b:list3)
        {%>
        	 <div class="col-md-4">
        <div class="card crd-hv">
        <div class="card-body text-center">
        <img alt="" src="book/<%=b.getPhotoName() %>" style="width:150px; height:200px;" class="img-thumblin">
        <p><%=b.getBookname() %></p>
        <p>Author:<%=b.getAuthor() %></p>
       <p>Catagory:<%=b.getBookcatagory() %></p>
       <div class="row text-center">
       <a href="ViewBookDetails.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm ml-5"><i class="fa-solid fa-circle-info"></i>View Details</a>
       <a class="btn btn-danger btn-sm ml-2 text-white"><i class="fa-solid fa-indian-rupee-sign"></i>  <%=b.getPrice() %></a>
       
        </div>
        </div>
        </div>
        </div>
        <%}
        	%>
        
        </div>
        <div class="text-center mt-1">
        <a href="./AllOldBooks.jsp" class="btn btn-danger btn-sm text-white">View All</a>
        </div>
        </div>
            <!-- Old  book-->
<%@include file="allcomponents/Footer.jsp" %>
</body>
</html>
