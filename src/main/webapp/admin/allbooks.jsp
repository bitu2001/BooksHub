<%@page import="com.entity.Bookdetails"%>
<%@page import="com.db.Dbconnect"%>
<%@page import="com.datao.BookDataImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>

<%@include file="allcss.jsp" %>

</head>
<body>
    <!-- Navbar -->
<%@include file="Navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"></c:redirect>
    </c:if>
<!-- Navbar -->
 				<h3 class="text-center">Hello Admin</h3>
	<!-- jstl -->
                    <c:if test="${not empty Successmsg}">
                      <h4 class="text-success text-center">${Successmsg}</h4>
                      <c:remove var="Successmsg" scope="session"/>
                      </c:if>

                      <c:if test="${not empty Failedmsg}">
                      <h5 class="text-danger text-center">${Failedmsg}</h5>
                      <c:remove var="Failedmsg" scope="session"/>
                      </c:if>
                      <!-- jstl  -->

<table class="table" >
    <thead class="bg-primary text-white">
      <tr>
		<th scope="col">Id</th>
        <th scope="col">Image</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Catagories</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th>

      </tr>
    </thead>
    <tbody>
    
  <%
    BookDataImpl data = new BookDataImpl(Dbconnect.getConn());
    List<Bookdetails> list = data.getAllBookdetails();
    for(Bookdetails b : list) {
%>
    <tr>
        <td><%= b.getBookid() %></td>
        <td><img src="../book/<%= b.getPhotoName() %>" style="width: 50px; height: 50px; border-radius: 50px"></td>
        <td><%= b.getBookname() %></td>
        <td>@<%= b.getAuthor() %></td>
        <td><%= b.getPrice() %></td>
        <td><%=b.getBookcatagory() %></td>
        <td><%=b.getstatus() %></td>        
        <td>
            <a href="EditBooks.jsp?id=<%=b.getBookid()%>" class="btn btn-sm btn-primary">
            <i class="fa-regular fa-pen-to-square"></i>Edit</a>
            <a href="../deletebook?id=<%=b.getBookid()%>" class="btn btn-sm btn-danger">
            <i class="fa-solid fa-trash"></i>Delete</a>
        </td>
    </tr>
<%
    }
%>

     
    </tbody>
  </table>
<!-- Footer  -->
<div style="margin-top: 130px;">
    <%@include file="Footer.jsp" %>
    </div>
    <!-- Footer  -->
</body>
</html>