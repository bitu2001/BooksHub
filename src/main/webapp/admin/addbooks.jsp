<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add books</title>
<%@include file="allcss.jsp" %>

</head>
<body style="background-color: antiquewhite;">
<!-- Navbar -->
<%@include file="Navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"></c:redirect>
    </c:if>
<!-- Navbar -->
<div class="container">
<div class="row">
    <div class="col-md-4 offset-md-4">
        <div class="card">
            <div class="card-body">
                <form action="../add_books" method="post" enctype="multipart/form-data">
                    <h4 class="text-center">Add Book</h4>

                    <!-- jstl -->
                    <c:if test="${not empty Successmsg}">
                      <p class="text-success text-center">${Successmsg}</p>
                      <c:remove var="Successmsg" scope="session"/>
                      </c:if>

                      <c:if test="${not empty Failedmsg}">
                      <p class="text-danger text-center">${Failedmsg}</p>
                      <c:remove var="Failedmsg" scope="session"/>
                      </c:if>
                      <!-- jstl  -->
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
                        <label for="exampleInputEmail1">Book Catagories</label>
                        <select name="catagory" id="inputState" class="form-control">
                            <option selected>--select--</option>
                            <option value="New">New Book</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">Book Status</label>
                        <select name="status" id="inputState" class="form-control">
                            <option selected>--select--</option>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">Upload Photo</label>
                        <input type="file" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="bimg">
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

<!-- Footer  -->
<div style="margin-top: 130px;">
    <%@include file="Footer.jsp" %>
    </div>
<!-- Footer  -->
</body>
</html>