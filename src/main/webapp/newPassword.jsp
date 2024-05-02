<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Enter New Password</title>
<!-- Bootstrap 4 CSS -->
<%@include file="allcomponents/allcss.jsp"%>
<style>
    .error-message {
        color: red;
        font-size: 14px;
    }
</style>
</head>
<body style="background-color: #4f4f4f">
    <%@include file="allcomponents/Navbar.jsp" %>

    <div>
        <!-- Container containing all contents -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                    <!-- White Container -->
                    <div class="container bg-white rounded mt-2 mb-2 px-0">
                        <!-- Main Heading -->
                        <div class="row justify-content-center align-items-center pt-3">
                            <h1>
                                <strong>Reset Password</strong>
                            </h1>
                        </div>
                        <div class="pt-3 pb-3">
                            <form class="form-horizontal" action="newPassword" method="POST" onsubmit="return validateForm()">
                                <!-- User Name Input -->
                                <div class="form-group row justify-content-center px-3">
                                    <div class="col-9 px-0">
                                        <input type="text" id="password" name="password" placeholder="&#xf084; &nbsp; New Password"
                                            class="form-control border-info placeicon">
                                        <div id="password-error" class="error-message"></div>
                                    </div>
                                </div>
                                <!-- Password Input -->
                                <div class="form-group row justify-content-center px-3">
                                    <div class="col-9 px-0">
                                        <input type="password" id="confPassword" name="confPassword"
                                            placeholder="&#xf084; &nbsp; Confirm New Password"
                                            class="form-control border-info placeicon">
                                        <div id="confPassword-error" class="error-message"></div>
                                    </div>
                                </div>
                            
                                <!-- Log in Button -->
                                <div class="form-group row justify-content-center">
                                    <div class="col-3 px-3 mt-3">
                                        <input type="submit" value="Reset" class="btn btn-block btn-info">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- Alternative Login -->
                        <div class="mx-0 px-0 bg-light">
                            
                            <!-- Horizontal Line -->
                            <div class="px-4 pt-5">
                                <hr>
                            </div>
                            <!-- Register Now -->
                            <div class="pt-2">
                                <div class="row justify-content-center">
                                    <h5>
                                        Don't have an Account?<span><a href="register.jsp" class="text-danger"> Register Now!</a></span>
                                    </h5>
                                </div>
                                <div class="row justify-content-center align-items-center pt-4 pb-5">
                                    <div class="col-4">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="allcomponents/Footer.jsp" %>

    <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var confPassword = document.getElementById("confPassword").value;
            var passwordError = document.getElementById("password-error");
            var confPasswordError = document.getElementById("confPassword-error");
            var isValid = true;

            passwordError.innerHTML = "";
            confPasswordError.innerHTML = "";

            // Password format validation
            var formatRegex = /^(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{8,}$/;

            if (!formatRegex.test(password)) {
                passwordError.innerHTML = "Password must start with a capital letter, contain at least one special character, one number, and be at least 8 characters long";
                isValid = false;
            }

            if (password.trim() === "") {
                passwordError.innerHTML = "Password is required";
                isValid = false;
            }

            if (confPassword.trim() === "") {
                confPasswordError.innerHTML = "Please confirm your password";
                isValid = false;
            } else if (password !== confPassword) {
                confPasswordError.innerHTML = "Passwords do not match";
                isValid = false;
            }

            return isValid;
        }
    </script>
</body>
</html>
