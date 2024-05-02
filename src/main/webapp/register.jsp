<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Here</title>
<%@include file="allcomponents/allcss.jsp"%>
<script>
	function validatePassword() {
		var password = document.getElementById("exampleInputPassword1").value;
		var capitalLetter = /[A-Z]/;
		var specialCharacter = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
		var number = /[0-9]/;

		if (!capitalLetter.test(password)) {
			alert("Password must contain at least one capital letter.");
			return false;
		}
		if (!specialCharacter.test(password)) {
			alert("Password must contain at least one special character.");
			return false;
		}
		if (!number.test(password)) {
			alert("Password must contain at least one number.");
			return false;
		}
		return true;
	}

	function validateFullName() {
		var fullName = document.getElementById("exampleInputFullName").value;
		var invalidCharacters = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?0-9]/; // Exclude numeric, special characters, and spaces
		var fullNameError = document.getElementById("fullNameError");

		fullNameError.innerHTML = ""; // Clear previous error message

		if (invalidCharacters.test(fullName)) {
			fullNameError.innerHTML = "Full name must not contain numeric or special characters.";
			return false;
		}
		return true;
	}

	function validateMobileNumber() {
		var mobileNumber = document.getElementById("exampleInputMobileNumber").value;
		var mobileNumberPattern = /^[6-9]\d{9}$/; // Starts with 6, 7, 8, or 9 and consists of exactly 10 digits
		var mobileNumberError = document.getElementById("mobileNumberError");

		mobileNumberError.innerHTML = ""; // Clear previous error message

		if (!mobileNumberPattern.test(mobileNumber)) {
			mobileNumberError.innerHTML = "Mobile number should start from 6, 7, 8, or 9 and consist of 10 digits.";
			return false;
		}
		return true;
	}

	function validateForm() {
		if (!validateFullName() || !validateMobileNumber()
				|| !validatePassword()) {
			return false;
		}
		return true;
	}
	 // Get the checkbox element
    const checkbox = document.getElementById('exampleCheck1');
    
    // Add click event listener to checkbox
    checkbox.addEventListener('click', function() {
        // Display popup if checkbox is checked
        if (checkbox.checked) {
            document.getElementById('popup').style.display = 'block';
        } else {
            document.getElementById('popup').style.display = 'none';
        }
    });

    // Get the buttons in the popup
    const confirmBtn = document.getElementById('confirmBtn');
    const cancelBtn = document.getElementById('cancelBtn');

    // Add click event listener to confirm button
    confirmBtn.addEventListener('click', function() {
        // Do something when user confirms
        alert('You have agreed to the terms and conditions.');
        // You can add further actions here, such as form submission
    });

    // Add click event listener to cancel button
    cancelBtn.addEventListener('click', function() {
        // Hide the popup when user cancels
        document.getElementById('popup').style.display = 'none';
        // Uncheck the checkbox
        checkbox.checked = false;
    });
</script>

</head>
<body style="background-color: #4f4f4f">
	<!-- Header -->
	<%@include file="allcomponents/Navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Registration Page</h4>

						<c:if test="${not empty Success }">
							<p class="text-center text-success">${Success }</p>
							<c:remove var="Success" scope="session" />
						</c:if>
						<c:if test="${not empty Failed }">
							<p class="text-danger text success">${Failed }</p>
							<c:remove var="Failed" scope="session" />
						</c:if>
						<form action="register" method="post"
							onsubmit="return validateForm();">
							<div class="form-group">
								<label for="exampleInputFullName">Enter Full name</label> <input
									type="text" class="form-control" id="exampleInputFullName"
									aria-describedby="emailHelp" placeholder="Enter your name"
									name="fname" required> <small id="fullNameError"
									class="form-text text-danger"></small>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email" required>
							</div>
							<div class="form-group">
								<label for="exampleInputMobileNumber">Phone number</label> <input
									type="number" class="form-control"
									id="exampleInputMobileNumber" placeholder="Enter Phone number"
									required name="phno"> <small id="mobileNumberError"
									class="form-text text-danger"></small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required name="password">
							</div>

							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check" required> <label
									class="form-check-label" for="exampleCheck1">Agree
									terms and condition</label>
							</div>

							
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
							<div class="text-center">
								<a href="login.jsp">Already Have Account<br> SignIn
								</a><br>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--Footer -->
	<%@include file="allcomponents/Footer.jsp"%>

</body>
</html>