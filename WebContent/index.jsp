<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import="model.User"%>
<%@ page import="model.UserDBHelper"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PASS</title>
<meta name="description"
	content="Free Bootstrap Theme by BootstrapMade.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Open+Sans|Candal|Alegreya+Sans">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/imagehover.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- =======================================================
    Theme Name: Mentor
    Theme URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>

	<%
		UserDBHelper userDBHelper = new UserDBHelper();
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userName = "";
		String userPassword = request.getParameter("userPassword");
		String userRole = "";
		if(session.getAttribute("userId")==null){
			String[] userData = userDBHelper.login(userId, userPassword);
			userName = userData[0];
			userRole = userData[1];
			if(userRole.equals("")){
				response.sendRedirect("login.jsp");
			}else{
				session.setAttribute("userId", userId);
				session.setAttribute("userName", userName);
				session.setAttribute("userRole", userRole);
				response.sendRedirect("#"); //將傳過來的表單資料洗掉
			}
		}else{
			response.setHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
			response.setHeader("Pragma", "no-cache");
		}
	%>

	<!--Navigation bar-->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">PASS</a>
				<%
					if(session.getAttribute("userName")!=null && session.getAttribute("userRole")!=null)
					{
						userName = session.getAttribute("userName").toString();
						userRole = session.getAttribute("userRole").toString();
				%>
						<span><%out.print(userName+" 您好,您目前登入的身分是"+userRole);%></span>
				<%
					}
				%>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#courses">Courses</a></li>
					<li><a href="logout.jsp">Sign Out</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--/ Navigation bar-->
	<!--Banner-->
	<div class="banner">
		<div class="bg-color">
			<div class="container">
				<div class="row">
					<div class="banner-text text-center">
						<div class="text-border">
							<h2 class="text-dec">
								<marquee>Welcome to PASS</marquee>
							</h2>
						</div>
						<div class="intro-para text-center quote">
							<p class="big-text">Programming Assignment Submission System</p>
							<p class="small-text">This project aims to develop a system
								that facilitates the submission and grading of programming
								assignments. The system shall be a client-server system in which
								the server needs to provide the services for user
								authentication, user and programming assignment management,
								assignment submission, grading, and statistical report
								generation. The client should provide an interactive user
								interfaces and figures that allow users to view the status and
								summary of programming assignment submission.</p>
						</div>
						<a href="#courses" class="mouse-hover">
							<div class="mouse"></div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ Banner-->
	<!--Courses-->
	<section id="courses" class="section-padding">
		<div class="container">
			<div class="row">
				<div class="header-section text-center">
					<h2>Courses</h2>
					<hr class="bottom-line">
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-6 padleft-right">
					<figure class="imghvr-fold-up">
						<img src="img/course01.jpg" class="img-responsive">
						<figcaption>
							<h3>Python</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Magnam atque, nostrum veniam consequatur libero fugiat,
								similique quis.</p>
						</figcaption>
						<a href="python.jsp"></a>
					</figure>
				</div>
				<div class="col-md-4 col-sm-6 padleft-right">
					<figure class="imghvr-fold-up">
						<img src="img/course02.jpg" class="img-responsive">
						<figcaption>
							<h3>Java</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Magnam atque, nostrum veniam consequatur libero fugiat,
								similique quis.</p>
						</figcaption>
						<a href="#"></a>
					</figure>
				</div>
				<div class="col-md-4 col-sm-6 padleft-right">
					<figure class="imghvr-fold-up">
						<img src="img/course03.jpg" class="img-responsive">
						<figcaption>
							<h3>C&C++</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Magnam atque, nostrum veniam consequatur libero fugiat,
								similique quis.</p>
						</figcaption>
						<a href="#"></a>
					</figure>
				</div>
				<div class="col-md-4 col-sm-6 padleft-right">
					<figure class="imghvr-fold-up">
						<img src="img/course04.jpg" class="img-responsive">
						<figcaption>
							<h3>C#</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Magnam atque, nostrum veniam consequatur libero fugiat,
								similique quis.</p>
						</figcaption>
						<a href="#"></a>
					</figure>
				</div>
				<div class="col-md-4 col-sm-6 padleft-right">
					<figure class="imghvr-fold-up">
						<img src="img/course05.jpg" class="img-responsive">
						<figcaption>
							<h3>Visual Basic</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Magnam atque, nostrum veniam consequatur libero fugiat,
								similique quis.</p>
						</figcaption>
						<a href="#"></a>
					</figure>
				</div>
				<div class="col-md-4 col-sm-6 padleft-right">
					<figure class="imghvr-fold-up">
						<img src="img/course06.jpg" class="img-responsive">
						<figcaption>
							<h3>JavaScript</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Magnam atque, nostrum veniam consequatur libero fugiat,
								similique quis.</p>
						</figcaption>
						<a href="#"></a>
					</figure>
				</div>
			</div>
		</div>
	</section>
	<!--/ Courses-->
	<!--Footer-->
	<footer id="footer" class="footer">
	
	</footer>
	<!--/ Footer-->

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="contactform/contactform.js"></script>

</body>

</html>
