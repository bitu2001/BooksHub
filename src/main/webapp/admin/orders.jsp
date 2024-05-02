<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.db.Dbconnect"%>
<%@page import="com.datao.BookOrderDataImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Order Books</title>
<%@include file="allcss.jsp"%>

</head>
<body>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp" />
    </c:if>
	<!-- Navbar -->
	<%@include file="Navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<!-- Navbar -->
	<h3 class="text-center">Hello Admin</h3>

	<table class="table">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Adress</th>
				<th scope="col">Phone Number</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookOrderDataImpl data = new BookOrderDataImpl(Dbconnect.getConn());
			List<BookOrder> blist = data.getAllOrderBook();
			for(BookOrder b:blist)
			{%>
				<tr>
				<th scope="row"><%=b.getOrderid() %></th>
				<td><%=b.getUsername() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFulladd() %></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getBookname() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymenttype() %></td>
			</tr>
			<%}
			%>
			

		</tbody>
	</table>
	<!-- Footer  -->
	<div style="margin-top: 130px;">
		<%@include file="Footer.jsp"%>
	</div>
	<!-- Footer  -->
</body>
</html>