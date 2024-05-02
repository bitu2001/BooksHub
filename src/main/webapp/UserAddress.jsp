<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Address</title>
<%@include file="allcomponents/allcss.jsp" %>
</head>
<body style="background-color: #d4d9d6;">
    <%@include file="allcomponents/Navbar.jsp" %>

    <div class="container">
        <div class="row justify-content-center p-3"> <!-- Center align the content -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center text-warning">Your Address</h3>
                        <form>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputAddress">Address</label>
                                    <input type="text" class="form-control" id="inputAddress">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputLandmark">Landmark</label>
                                    <input type="text" class="form-control" id="inputLandmark">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="inputCity">City</label>
                                    <input type="text" class="form-control" id="inputCity">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputState">State</label>
                                    <input type="text" class="form-control" id="inputState">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputZip">Zip Code</label>
                                    <input type="number" class="form-control" id="inputZip">
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-warning text-white">Add Address</button>
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
