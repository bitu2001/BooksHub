<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <%@include file="allcomponents/allcss.jsp" %>
</head>
<body style="background-color: #4f4f4f">
    <%@include file="allcomponents/Navbar.jsp" %>
    <div class="container p-2">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <form action="forgotPassword" method="post">
                            <h4 class="text-center">Forgot Password</h4>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Your Email</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                    placeholder="Enter email" required name="email">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Send OTP</button>
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
