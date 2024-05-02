<%@page import="java.util.List"%>
<%@page import="com.db.Dbconnect"%>
<%@page import="com.datao.BookOrderDataImpl"%>
<%@page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Order</title>
    <%@include file="allcomponents/allcss.jsp"%>
</head>
<body>
    <!-- Navbar -->
    <%@include file="allcomponents/Navbar.jsp"%>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp" />
    </c:if>

    <div class="container p-1">
        <h3 class="text-center text-primary">My Order</h3>
        <table class="table table-striped mt-5">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment type</th>
                </tr>
            </thead>
            <tbody>
                <%
                User u = (User) session.getAttribute("userobj");
                BookOrderDataImpl data = new BookOrderDataImpl(Dbconnect.getConn());
                List<BookOrder> blist = data.getBook(u.getEmail());
                
                if (blist != null && !blist.isEmpty()) {
                    for(BookOrder b : blist) {
                %>
                        <tr>
                            <th scope="row"><%=b.getOrderid()%></th>
                            <td><%=b.getUsername()%></td>
                            <td><%=b.getBookname()%></td>
                            <td><%=b.getAuthor()%></td>
                            <td><%=b.getPrice()%></td>
                            <td><%=b.getPaymenttype()%></td>
                        </tr>	
                <%
                    }
                } else {
                %>
                    <tr>
                        <td colspan="6">No orders found.</td>
                    </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
    <!-- Footer -->
    <%@include file="allcomponents/Footer.jsp"%>
    <!-- Footer -->
</body>
</html>
