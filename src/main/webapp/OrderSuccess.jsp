<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allcomponents/allcss.jsp"%>
</head>
<body style="background-color: #d4d9d6;">
	<%@include file="allcomponents/Navbar.jsp"%>
	
	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Placed Successfully</h2>
		<h5>With in 7 days your Product Will Be Delivered in Your Address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
		<a href="UserOrder.jsp" class="btn btn-warning mt-3">View Order</a>
	</div>
	
	
	<%@include file="allcomponents/Footer.jsp"%>
</body>
</html>