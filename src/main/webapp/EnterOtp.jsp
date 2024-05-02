<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter OTP</title>
   <%@include file="allcomponents/allcss.jsp"%>
    <style>
        body {
            background-color: #4f4f4f;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <%@include file="allcomponents/Navbar.jsp"%>
    
    
    <div class="form-gap"></div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center">
                            <h3><i class="fa fa-lock fa-4x"></i></h3>
                            <h2 class="text-center">Enter OTP</h2>
                            <% if (request.getAttribute("message") != null) { %>
                                <p class="text-danger ml-1"><%= request.getAttribute("message") %></p>
                            <% } %>

                            <div class="card-body">
                                <form id="register-form" action="ValidateOtp" role="form" autocomplete="off" class="form" method="post">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-envelope color-blue"></i></span>
                                            </div>
                                            <input id="opt" name="otp" placeholder="Enter OTP" class="form-control" type="text" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
                                    </div>
                                    <input type="hidden" class="hide" name="token" id="token" value="">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@include file="allcomponents/Footer.jsp"%>

</body>
</html>
