<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
<%@include file="allcomponents/allcss.jsp"%>
</head>
<body style="background-color: #d4d9d6;">
	<%@include file="allcomponents/Navbar.jsp"%>

	<div class="container">
		<div class="row justify-content-center">
			<!-- Center align the content -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-primary">Edit Profile</h3>
						<c:if test="${not empty Success }">
      <p class="text-center text-success">${Success }</p>
      <c:remove var="Success" scope="session"/>
      </c:if>
      <c:if test="${not empty Failed }">
      <p class="text-danger text success">${Failed }</p>
            <c:remove var="Failed" scope="session"/>
      </c:if>
						<form action="updateProfile" method="post">
							<div class="form-group">
							<input type="hidden" value="${userobj.id }" name="id">
								<label for="exampleInputFullName">Enter Full name</label> <input
									type="text" class="form-control" id="exampleInputFullName"
									aria-describedby="emailHelp" name="fname" value="${userobj.name }"> <small
									id="fullNameError" class="form-text text-danger"></small>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" value="${userobj.email }">
							</div>
							<div class="form-group">
								<label for="exampleInputMobileNumber">Phone number</label> <input
									type="number" class="form-control"
									id="exampleInputMobileNumber" name="phno" value="${userobj.phno }"> <small
									id="mobileNumberError" class="form-text text-danger"></small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="allcomponents/Footer.jsp"%>
</body>
</html>
