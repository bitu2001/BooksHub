<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Here</title>
<%@include file="allcomponents/allcss.jsp" %>
</head>
<body style="background-color: #4f4f4f">
<!-- Header -->
    <%@include file="allcomponents/Navbar.jsp" %>
    <div class="container p-2">
    <div class="row">
    <div class="col-md-4 offset-md-4">
    <div class="card">
    <div class="card-body">
    <form action="login" method="post">
      <h4 class="text-center">Login Page</h4>

					  <c:if test="${not empty Successmsg}">
                      <p class="text-success text-center">${Successmsg}</p>
                      <c:remove var="Successmsg" scope="session"/>
                      </c:if>
                       <c:if test="${not empty Success}">
                      <p class="text-success text-center">${Success}</p>
                      <c:remove var="Success" scope="session"/>
                      </c:if>
      <c:if test="${not empty Failed}">
        <p class="text-danger text-center">${Failed}</p>
        <c:remove var="Failed" scope="session"/>
        </c:if>
        

  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
    placeholder="Enter email" required name="email">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required name="password">
  </div>
 
<div class="text-center">
  <button type="submit" class="btn btn-primary">Submit</button><br>
    <a href="ForgotPassword.jsp">Forgot Password</a><br>
  <a href="register.jsp">Create Account</a>
</div>  
</form>
</div>
    </div>
    </div>
    </div>
    </div>
    
    
<!--Footer -->
<%@include file="allcomponents/Footer.jsp" %>
</body>
</html>