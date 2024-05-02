<%@page import="com.entity.User"%>
<%@page import="com.db.Dbconnect"%>
<%@page import="com.datao.BookDataImpl"%>
<%@page import="com.entity.Bookdetails"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="allcomponents/allcss.jsp"%>
<title>About Us</title>
<style type="text/css">
#any {
	color: #2c3145;
}

a, a:hover, a:focus, a:active {
	text-decoration: none;
	outline: none;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

.section_all {
	position: relative;
	padding-top: 80px;
	padding-bottom: 80px;
	min-height: 100vh;
}

.section-title {
	font-weight: 700;
	text-transform: capitalize;
	letter-spacing: 1px;
}

.section-subtitle {
	letter-spacing: 0.4px;
	line-height: 28px;
	max-width: 550px;
}

.section-title-border {
	background-color: #000;
	height: 1 3px;
	width: 44px;
}

.section-title-border-white {
	background-color: #fff;
	height: 2px;
	width: 100px;
}

.text_custom {
	color: #00bd2a;
}

.about_icon i {
	font-size: 22px;
	height: 65px;
	width: 65px;
	line-height: 65px;
	display: inline-block;
	background: #fff;
	border-radius: 35px;
	color: #00bd2a;
	box-shadow: 0 8px 20px -2px rgba(158, 152, 153, 0.5);
}

.about_header_main .about_heading {
	max-width: 450px;
	font-size: 24px;
}

.about_icon span {
	position: relative;
	top: -10px;
}

.about_content_box_all {
	padding: 28px;
}
</style>
</head>
<body style="background-color: #4f4f4f">

	<%@include file="allcomponents/Navbar.jsp"%>


	<section class="section_all bg-light" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section_title_all text-center">
						<h3 id="any" class="font-weight-bold">
							Welcome To <span class="text-custom">BookHub </span>
						</h3>
						<p class="section_subtitle mx-auto text-muted">BookHub is your
							one-stop destination for all things related to books and reading.
							Our platform connects passionate readers, authors, publishers,
							and literary enthusiasts from around the world, fostering a
							vibrant community built on a shared love of literature.</p>
						<div class="">
							<i class=""></i>
						</div>
					</div>
				</div>
			</div>

			<div class="row vertical_content_manage mt-5">
				<div class="col-lg-6">
					<div class="about_header_main mt-3">
						<div class="about_icon_box">
							<p class="text_custom font-weight-bold">Discover New Worlds</p>
						</div>
						<h6 id="any"
							class="about_heading text-capitalize font-weight-bold mt-4">Immerse
							yourself in captivating stories that transport you to different
							eras, cultures, and realms of imagination. Our extensive
							collection of books spans various genres, from classic literature
							to contemporary bestsellers, ensuring that every reader finds
							their next beloved tale.</h6>



					</div>
				</div>
				<div class="col-lg-6">
					<div class="img_about mt-3">
						<img src="https://i.ibb.co/qpz1hvM/About-us.jpg" alt=""
							class="img-fluid mx-auto d-block">
					</div>
				</div>
			</div>

			<div class="row mt-3">
				<div class="col-lg-4">
					<div class="about_content_box_all mt-3">
						<div class="about_detail text-center">
							<div class="about_icon">
								<i class="fas fa-pencil-alt"></i>
							</div>
							<h5 id="any"
								class="text-dark text-capitalize mt-3 font-weight-bold">Creative
								Design</h5>
							<p class="edu_desc mt-3 mb-0 text-muted">Join our lively
								community of book lovers and engage in thought-provoking
								discussions, share your personal reviews, and explore
								recommendations tailored to your reading preferences. Connect
								with like-minded individuals and forge lasting friendships based
								on your literary interests.</p>
						</div>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="about_content_box_all mt-3">
						<div class="about_detail text-center">
							<div class="about_icon">
								<i class="fab fa-angellist"></i>
							</div>
							<h5 id="any"
								class="text-dark text-capitalize mt-3 font-weight-bold">We
								make Best Result</h5>
							<p class="edu_desc mb-0 mt-3 text-muted">BookHub is not just
								about reading; it's a platform for creative expression. Aspiring
								authors can showcase their works, receive constructive feedback,
								and potentially find their path to publication. Our platform
								empowers writers to share their stories with the world.</p>
						</div>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="about_content_box_all mt-3">
						<div class="about_detail text-center">
							<div class="about_icon">
								<i class="fas fa-paper-plane"></i>
							</div>
							<h5 id="any"
								class="text-dark text-capitalize mt-3 font-weight-bold">best
								platform</h5>
							<p class="edu_desc mb-0 mt-3 text-muted">Dive deep into the
								world of literature with our curated collection of literary
								analyses, author interviews, and expert insights. Gain a deeper
								understanding of the craft of writing, explore the cultural and
								historical contexts of beloved works, and broaden your literary
								horizons.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<%@include file="allcomponents/Footer.jsp"%>
</body>
</html>