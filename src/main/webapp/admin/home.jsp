<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
<%@include file="allcss.jsp" %>
<style>
    a{
        text-decoration: none;
        color: black;
    }
    a:hover{
        text-decoration: none;
        color: black;
    }
</style>
</head>
<body>
<!-- Navbar -->
<%@include file="Navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"></c:redirect>
    </c:if>
<!-- Navbar -->
<h3 class="text-center text-primary">Admin</h3>
<div class="container">
    <div class="row p-5">
        <div class="col-md-3">
        <a href="addbooks.jsp">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fa-solid fa-plus-square fa-3x text-primary"></i><br>
                    <h4 class="text-center">Add Books</h4>
                </div>
            </div>
            </a>
        </div>
        <div class="col-md-3">
        <a href="allbooks.jsp">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
                    <h4 class="text-center">All Books</h4>
                </div>
            </div>
            </a>
        </div>
        <div class="col-md-3">
        <a href="orders.jsp">
            <div class="card">
                <div class="card-body text-center">
                <i class="fa-solid fa-cart-shopping fa-3x text-warning"></i>
                    <br>
                    <h4 class="text-center">Order Books</h4>
                </div>
            </div>
            </a>
        </div>
        <div class="col-md-3">
        <!--Logout -->



<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     <div class="text-center">
      <h4>Do You Want To Logout</h4>
        <button  type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-danger">Logout</a>
     </div>
      </div>
    </div>
  </div>
</div>

<!--Logout -->
        <a href="../" data-toggle="modal" data-target="#exampleModalCenter">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i></i><br>
                    <h4 class="text-center">Logout Books</h4>
                </div>
            </div>
            </a>
        </div>
    </div>
</div>

<!-- Footer  -->
<div style="margin-top: 50px;">
    <%@include file="Footer.jsp" %>
    </div>
    <!-- Footer  -->

</body>
</html>