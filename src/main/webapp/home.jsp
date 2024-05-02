<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="allcomponents/allcss.jsp" %>
</head>
<body>
    <%@include file="allcomponents/Navbar.jsp" %>
<h1>User:home</h1>
<c:if test="${not empty userobj}">
          <h1>Name:${userobj.name}</h1>
          <h1>Email:${userobj.email}</h1>
          </c:if>
</body>
</html>