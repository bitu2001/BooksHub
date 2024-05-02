<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Settings</title>
    <%@include file="allcomponents/allcss.jsp" %>
    <style>
        a {
            text-decoration: none;
            color: black;
        }

        a:hover {
            text-decoration: none;
        }

        /* Add hover effect for cards */
        .card:hover {
            background-color: #7d7b7a;
            color:white;
        }
    </style>
</head>

<body style="background-color: #4f4f4f">
<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"/>
</c:if>
    <%@include file="allcomponents/Navbar.jsp" %>

    <div class="container">
        <h3 class="text-center text-white">Hello ${userobj.name}</h3>
        <div class="row p-5">
            <div class="col-md-4">
                <a href="SellBook.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="text-primary">
                                <i class="fa-solid fa-book-open fa-3x"></i>
                            </div>
                            <h3>Sell Old Book</h3>
                        </div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-4">
                <a href="OldBook.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="text-primary">
                                <i class="fa-solid fa-book-open fa-3x"></i>
                            </div>
                            <h3>Old Book</h3>
                        </div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-4">
                <a href="EditProfile.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="text-primary">
                                <i class="fa-solid fa-pen-to-square fa-3x"></i>
                            </div>
                            <h3>Edit Profile</h3>
                            
                        </div>
                    </div>
                </a>
            </div>
          
           <div class="col-md-6 mt-3">
    <a href="UserOrder.jsp">
        <div class="card">
            <div class="card-body text-center">
                <div class="text-danger">
                    <i class="fa-solid fa-box fa-3x"></i>
                </div>
                <h3>My Order</h3>
                <p>Track Your Order</p>
            </div>
        </div>
    </a>
</div>

<div class="col-md-6 mt-3">
    <a href="HelpPage.jsp">
        <div class="card">
            <div class="card-body text-center">
                <div class="text-primary">
                    <i class="fa-regular fa-user fa-3x"></i>                            
                </div>
                <h3>Help Center</h3>
                <p>24*7 Service</p>
            </div>
        </div>
    </a>
</div>
           
        </div>
    </div>

    <%@include file="allcomponents/Footer.jsp" %>
</body>

</html>
