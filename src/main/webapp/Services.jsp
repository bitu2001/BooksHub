<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Services Section Using Bootstrap 4</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/fontawesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:500,700&display=swap" rel="stylesheet">
	<%@include file="allcomponents/allcss.jsp" %>
	<style type="text/css">
	
	a,p,h1,h2,h3,h4,ul {
	margin: 0;
	padding: 0;
}

.section-services {
	padding-top: 110px;
	padding-bottom: 120px;
	font-family: "Poppins", sans-serif;
	background-color: #211f24;
	color: #fff;
}

.section-services .header-section {
	margin-bottom: 35px;
}

.section-services .header-section .title {
	position: relative;
	margin-bottom: 40px;
	padding-bottom: 25px;
	text-transform: uppercase;
	font-weight: 700;
}

.section-services .header-section .title:before {
	content: "";
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 140px;
	height: 1px;
	background-color: #f70037;
}

.section-services .header-section .title:after {
	content: "";
	position: absolute;
	bottom: -1px;
	left: 50%;
	transform: translateX(-50%);
	width: 45px;
	height: 3px;
	background-color: #f70037;
}

.section-services .header-section .title span {
	color: #f70037;
}

.section-services .header-section .description {
	color: #6f6f71;
}

.section-services .single-service {
	margin-top: 40px;
	background-color: #24252a;
	box-shadow: 0 0 10px 0 rgba(0,0,0,.1);
}

.section-services .single-service .part-1 {
	padding: 40px 40px 25px;
	border-bottom: 2px solid #1d1e23;
}

.section-services .single-service .part-1 i {
	margin-bottom: 25px;
	font-size: 50px;
	color: #f70037;
}

.section-services .single-service .part-1 .title {
	font-size: 17px;
	font-weight: 700;
	letter-spacing: 0.02em;
	line-height: 1.8em;
}

.section-services .single-service .part-2 {
	padding: 30px 40px 40px;
}

.section-services .single-service .part-2 .description {
	margin-bottom: 22px;
	color: #6f6f71;
	font-size: 14px;
	line-height: 1.8em;
}

.section-services .single-service .part-2 a {
	color: #fff;
	font-size: 14px;
	text-decoration: none;
}

.section-services .single-service .part-2 a i {
	margin-right: 10px;
	color: #f70037;
}
	
	</style>
</head>
<body>
    <%@include file="allcomponents/Navbar.jsp" %>

	<section class="section-services">
		<div class="container">
			<div class="row justify-content-center text-center">
				<div class="col-md-10 col-lg-8">
					<div class="header-section">
						<h2 class="title">Exclusive <span>Services</span></h2>
						<p class="description">There are many variations of passages of Lorem Ipsum available but the majority have suffered alteration in some injected humour</p>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Start Single Service -->
				<div class="col-md-6 col-lg-4">
					<div class="single-service">
						<div class="part-1">
							<i class="fab fa-500px"></i>
							<h3 class="title">Express delivery innovative Design service</h3>
						</div>
						<div class="part-2">
							<p class="description">Express delivery inno service effective logistics solution for delivery of small cargo delivery service.</p>
							<a href="#"><i class="fas fa-arrow-circle-right"></i>Read More</a>
						</div>
					</div>
				</div>
				<!-- / End Single Service -->
				<!-- Start Single Service -->
				<div class="col-md-6 col-lg-4">
					<div class="single-service">
						<div class="part-1">
							<i class="fab fa-angellist"></i>
							<h3 class="title">Online chat may refer to any kind communication</h3>
						</div>
						<div class="part-2">
							<p class="description">Express delivery inno service effective logistics solution for delivery of small cargo delivery service.</p>
							<a href="#"><i class="fas fa-arrow-circle-right"></i>Read More</a>
						</div>
					</div>
				</div>
				<!-- / End Single Service -->
				<!-- Start Single Service -->
				<div class="col-md-6 col-lg-4">
					<div class="single-service">
						<div class="part-1">
							<i class="fas fa-award"></i>
							<h3 class="title">Service provider provide organizations consulting</h3>
						</div>
						<div class="part-2">
							<p class="description">Express delivery inno service effective logistics solution for delivery of small cargo delivery service.</p>
							<a href="#"><i class="fas fa-arrow-circle-right"></i>Read More</a>
						</div>
					</div>
				</div>
				<!-- / End Single Service -->
				<!-- Start Single Service -->
				<div class="col-md-6 col-lg-4">
					<div class="single-service">
						<div class="part-1">
							<i class="fab fa-asymmetrik"></i>
							<h3 class="title">Express delivery innovative Design service</h3>
						</div>
						<div class="part-2">
							<p class="description">Express delivery inno service effective logistics solution for delivery of small cargo delivery service.</p>
							<a href="#"><i class="fas fa-arrow-circle-right"></i>Read More</a>
						</div>
					</div>
				</div>
				<!-- / End Single Service -->
				<!-- Start Single Service -->
				<div class="col-md-6 col-lg-4">
					<div class="single-service">
						<div class="part-1">
							<i class="fas fa-broadcast-tower"></i>
							<h3 class="title">Provide solutions and services to end users</h3>
						</div>
						<div class="part-2">
							<p class="description">Express delivery inno service effective logistics solution for delivery of small cargo delivery service.</p>
							<a href="#"><i class="fas fa-arrow-circle-right"></i>Read More</a>
						</div>
					</div>
				</div>
				<!-- / End Single Service -->
				<!-- Start Single Service -->
				<div class="col-md-6 col-lg-4">
					<div class="single-service">
						<div class="part-1">
							<i class="fab fa-canadian-maple-leaf"></i>
							<h3 class="title">This broad term incorporates all IT businesses</h3>
						</div>
						<div class="part-2">
							<p class="description">Express delivery inno service effective logistics solution for delivery of small cargo delivery service.</p>
							<a href="#"><i class="fas fa-arrow-circle-right"></i>Read More</a>
						</div>
					</div>
				</div>
				<!-- / End Single Service -->
			</div>
		</div>
	</section>
	 <%@include file="allcomponents/Footer.jsp" %>

</body>
</html>