<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.Dbconnect"%>
<%@page import="com.datao.CartDataImpl"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<%@include file="allcomponents/allcss.jsp"%>
<!-- Add jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    .error-message {
        color: red;
        font-size: 14px;
    }
</style>
<script>
    $(document).ready(function(){
        $('#pincode').on('input', function(){
            var pincode = $(this).val();
            
            // Ensure pincode contains only 6 digits
            var sanitizedPincode = pincode.replace(/\D/g, ''); // Remove non-numeric characters
            if (sanitizedPincode.length > 6) {
                sanitizedPincode = sanitizedPincode.substring(0, 6); // Limit to 6 digits
            }

            $(this).val(sanitizedPincode); // Update input value with sanitized pincode

            // Check if pincode contains exactly 6 digits
            if(/^\d{6}$/.test(sanitizedPincode)) {
                $.ajax({
                    url: 'https://api.postalpincode.in/pincode/' + sanitizedPincode,
                    type: 'GET',
                    success: function(response){
                        if(response && response[0].PostOffice && response[0].PostOffice.length > 0){
                            var city = response[0].PostOffice[0].District;
                            var state = response[0].PostOffice[0].State;

                            $('#city').val(city);
                            $('#state').val(state);
                        }
                    }
                });
            } else {
                // If pincode does not match the pattern, clear city and state fields
                $('#city').val('');
                $('#state').val('');
            }
        });
    });
</script>


</head>
<body style="background-color: #d4d9d6;">

    <%@include file="allcomponents/Navbar.jsp"%>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp" />
    </c:if>

    <c:if test="${not empty SuccessMsg}">
        <div class="alert alert-success" role="alert">${SuccessMsg}</div>
        <c:remove var="SuccessMsg" scope="session" />
    </c:if>

    <c:if test="${not empty FailedMsg}">
        <div class="alert alert-danger text-center" role="alert">${FailedMsg}</div>
        <c:remove var="FailedMsg" scope="session" />
    </c:if>

    <div class="container">
        <div class="row p-2">
            <div class="col-md-6">
                <div class="card bg-white ml-4">
                    <div class="card-body">
                        <h3 class="text-center text-success">Your Items</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Book Name</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Action</th>
                                    <th scope="col">Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                User u = (User) session.getAttribute("userobj");
                                CartDataImpl data = new CartDataImpl(Dbconnect.getConn());
                                Double totalPrice = 0.00;
                                List<Cart> cart = data.getBookByUser(u.getId());

                                for (Cart c : cart) {
                                    totalPrice = c.getTotal_price();
                                %>
                                <tr>
                                    <th scope="row"><%=c.getBookname()%></th>
                                    <td><%=c.getAuthor()%></td>
                                    <td><%=c.getPrice()%></td>
                                    <td><a
                                        href="removeCartItem?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid() %>"
                                        class="btn btn-danger btn-small">Remove</a></td>
                                </tr>
                                <%
                                }
                                %>
                                <tr>
                                    <th>Total Price</th>
                                    <td></td>
                                    <td></td>
                                    <td><%=totalPrice%></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>


            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center text-success">Your Order Details</h3>
                        <form action="Order" method="post">
                        <input type="hidden" value="${userobj.id }" name="id">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Name</label> 
                                    <input type="text" name="username" class="form-control" value="<%=u.getName()%>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">email</label> 
                                    <input type="email" name="userEmail" class="form-control" value="<%=u.getEmail()%>">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Mobile No</label> 
                                    <input type="number" name="userphno" class="form-control" value="<%=u.getPhno()%>">
                                </div>
                                  <div class="form-group col-md-6">
                                    <label for="inputPassword4">Zip Code</label> 
                                    <input id="pincode" name="pincode" type="number" class="form-control" required>
                                </div>
                                
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Land Mark</label> 
                                    <input type="text" name="landmrk" class="form-control" required>
                                </div>
                              <div class="form-group col-md-6">
                                    <label for="inputPassword4">Address</label> 
                                    <input type="text" name="useradd" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">City</label> 
                                    <input id="city" name="city" type="text" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">State</label> 
                                    <input id="state" name="state" type="text" class="form-control" required>
                                </div>
                            </div>

                            <div class="form-group col-md">
                                <label for="inputState">Payment Method</label> 
                                <select id="inputState" name="paymenttype" class="form-control">
                                    <option value="noselect">--Select--</option>
                                    <option value="cod">Cash On Delivery</option>
                                </select>
                            </div>

                            <div class="text-center">
                                <button class="btn btn-warning">Order Now</button>
                                <a href="index.jsp" class="btn btn-primary">Continue
                                    Shopping</a>
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
