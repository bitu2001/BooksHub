<%@page import="com.entity.Bookdetails"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.Dbconnect"%>
<%@page import="com.datao.BookDataImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Books</title>
<%@include file="allcomponents/allcss.jsp"%>
</head>
<body>
	<%@include file="allcomponents/Navbar.jsp"%>

	<div class="container p-5">
		<table class="table table-dark">
		<c:if test="${not empty SuccessMsg}">
		<div class="alert alert-success" role="alert">${SuccessMsg}</div>
		<c:remove var="SuccessMsg" scope="session" />
	</c:if>

	<c:if test="${not empty FailedMsg}">
		<div class="alert alert-danger" role="alert">${FailedMsg}</div>
		<c:remove var="FailedMsg" scope="session" />
	</c:if>
			<thead>
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User)session.getAttribute("userobj");
				String email = u.getEmail();
				BookDataImpl data = new BookDataImpl(Dbconnect.getConn());
				List<Bookdetails> list = data.getBookByOld(email, "Old");
				for (Bookdetails b : list) {
				%>
				<tr>
					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getBookcatagory()%></td>
					<td><%=b.getPrice()%></td>
					<td><a href="deleteoldbook?em=<%=email %>&&id=<%=b.getBookid() %>" class="btn btn-danger btn-sm">Delete</a></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>

	<%@include file="allcomponents/Footer.jsp"%>
</body>
</html>