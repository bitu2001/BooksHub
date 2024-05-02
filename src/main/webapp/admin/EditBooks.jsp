<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.datao.BookDataImpl" %>
<%@ page import="com.entity.Bookdetails" %>
<%@ page import="com.db.Dbconnect" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin: Edit books</title>
    <%@ include file="allcss.jsp" %>
</head>
<body style="background-color: antiquewhite;">
<!-- Navbar -->
<%@ include file="Navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"></c:redirect>
    </c:if>
<!-- Navbar -->
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <%
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        BookDataImpl data = new BookDataImpl(Dbconnect.getConn());
                        Bookdetails b = data.getBookById(id);
                    %>
                    <form action="../editbooks" method="post" >
                        <h4 class="text-center">Edit Book</h4>
                  
                        <!-- Use hidden input field for book ID -->
                        <input type="hidden" name="idname" value="<%=b.getBookid() %>">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Book Name</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="bname"
                                   value="<%=b.getBookname() %>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Author Name</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="author"
                                   value="<%=b.getAuthor() %>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Price</label>
                            <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="price"
                                   value="<%=b.getPrice() %>">
                        </div>
                        <div class="form-group">
                            <label for="inputstate">Book Status</label>
                            <select name="status" id="inputState" class="form-control">
                                <% if("Active".equals(b.getstatus())){
                                	%>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
                                	<% 
                                }else{
                                	%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
                            	<% 
                                }
                                %>
                            </select>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </form>
                    <% } catch (Exception e) {
                        out.println("Invalid book ID.");
                        // Handle the exception as needed
                    }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer -->
<div style="margin-top: 130px;">
    <%@ include file="Footer.jsp" %>
</div>
<!-- Footer -->
</body>
</html>
