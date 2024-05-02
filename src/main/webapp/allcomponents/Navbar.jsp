<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<style>
.bg-custom{
	background-color: #24262b;
}
.navbar .nav-item:hover .nav-link{
	background-color: white;
	color:black;
	border-radius:15px;
}

</style>
<div class="container-fluid"
	style="height: 10px; background-color: #24262b;"></div>

<div class="container-fluid p-3" style="background-color: #464a47">
	<div class="row">
		<div class="col-md-3 text-primary">
			<h3>
				<i class="fa-solid fa-book"></i>BOOKSHUB
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="Search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="ch">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<div class="col-md-3">
			<c:if test="${not empty userobj}">
				<a class="btn btn-success" style="border-radius: 50px" href="Cart.jsp" class="p-2"><i
					class="fa-solid fa-cart-plus fa-1x text-white mr-4"></i></a>
				<a class="btn btn-primary text-white" style="border-radius: 40px;"><i
					class="fa-solid fa-user"></i>${userobj.name}</a>
				<a href="logout" class="btn btn-danger text-white"
					style="border-radius: 40px;"><i
					class="fa-solid fa-right-to-bracket"></i>Logout</a>
			</c:if>

			<c:if test="${empty userobj}">
				<a href="./login.jsp" class="btn btn-success "><i
					class="fa-solid fa-right-to-bracket"></i>Login</a>
				<a href="./register.jsp" class="btn btn-primary text-white"><i
					class="fa-solid fa-user-plus"></i>Register</a>
			</c:if>
		</div>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="./index.jsp"><i class="fas fa-home"></i>Home<span
					class="sr-only">(current)</span></a></li>
					<li class="nav-item active"><a class="nav-link"
				href="AboutUs.jsp"><i class="fa-solid fa-eject"></i></i>About Us<span
					class="sr-only">(current)</span></a></li>
			<li class="nav-item active"><a class="nav-link disabled"
				href="./AllRecentBooks.jsp"><i class="fa-solid fa-book-open"></i>Recent
					Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="./AllNewBook.jsp"><i class="fa-solid fa-book-open"></i>New
					Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="./AllOldBooks.jsp"><i class="fa-solid fa-book-open"></i>Old
					Book</a></li>
			<li class="nav-item active"><a class="nav-link" href="#"><i
					class="fa-solid fa-clock-rotate-left"></i>History</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="Setting.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"><i class="fa-solid fa-gear"></i>Setting</a> <a href="ContactUs.jsp"
				class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i
				class="fa-regular fa-address-book"></i>Contact Us</a>
		</form>
	</div>
</nav>
