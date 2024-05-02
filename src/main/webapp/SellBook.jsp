<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Old Book</title>
<%@include file="allcomponents/allcss.jsp" %>
</head>
<body style="background-color: #d4d9d6;">
    <%@include file="allcomponents/Navbar.jsp" %>
    <%User u=(User)session.getAttribute("userobj"); %>
    <c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>


    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <form action="addoldbook" method="post" enctype="multipart/form-data">
                        
                        
                        <input type="hidden" value="${ userobj.name} ">
                        <input type="hidden" value="${userobj.email }" name="user">
                            <h4 class="text-center text-primary">Sell Old Book</h4>
                             <c:if test="${not empty Successmsg}">
                      <p class="text-success text-center">${Successmsg}</p>
                      <c:remove var="Successmsg" scope="session"/>
                      </c:if>

                      <c:if test="${not empty Failedmsg}">
                      <p class="text-danger text-center">${Failedmsg}</p>
                      <c:remove var="Failedmsg" scope="session"/>
                      </c:if>
                            <div class="form-group">
                              <label for="exampleInputEmail1">Book Name</label>
                              <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="bname">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Author Name</label>
                                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="author">
                              </div>
                              <div class="form-group">
                                <label for="exampleInputEmail1">Price</label>
                                <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="price">
                              </div>
                             
                              <div class="form-group">
                                <label for="exampleInputEmail1">Upload Photo</label>
                                <input type="file" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="bimg"
                                accept="image/png, image/gif, image/jpeg">
                              </div>
                            <div class="text-center">
                            <button type="submit" class="btn btn-primary">Add</button>
                        </div>
                          </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="allcomponents/Footer.jsp" %>
</body>
</html>