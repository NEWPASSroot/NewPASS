<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<%@ page import="model.UserDBHelper"%>
<%@ page import="model.HomeworkData"%>
<%@ page import="model.HomeworkDBHelper"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Mentor Education Bootstrap Theme</title>
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
		HomeworkDBHelper homeworkDBHelper = new HomeworkDBHelper();
		ArrayList<HomeworkData> homeworkDatas = homeworkDBHelper.getAllData();
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userRole = request.getParameter("useRole");
		String userPassword = request.getParameter("userPassword");
		if (userDBHelper.login(userId, userPassword)) {
			session.setAttribute("userId", userId);
			session.setAttribute("userRole", userRole);
			response.sendRedirect("#");
		} else {
			if (session.getAttribute("userId") == null) {
				response.sendRedirect("login.jsp");
			}
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
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#content">課程內容</a></li>
					<li><a href="#faculity-member">老師和助教的資訊</a></li>
					<li><a href="#homeworks">作業</a></li>
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
							<h2 class="text-dec">Python程式設計</h2>
						</div>
						<div class="intro-para text-center quote">
							<p class="big-text">課程目標</p>
							<p class="small-text">Python是一種物件導向、直譯式的電腦程式語言。它的語法簡單，能夠輕鬆完成很多常見的任務，也經常被當作腳本語言用於處理系統管理和網路應用程式的編寫。近年來使用Python作為應用程式的開發工具已經是非常普遍的現象，舉凡Google、Facebook等大型網站，都可以見到Python的蹤跡。本課程將教導您瞭解Python程式語言的結構、特性及開發方式，並瞭解如何利用Python處理一般的程式設計問題，進而接觸如Django的Framework來開發Web應用。</p>
						</div>
						<a href="#content" class="mouse-hover">
							<div class="mouse"></div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ Banner-->
	<!--Feature-->
	<section id="content" class="section-padding">
		<div class="container">
			<div class="row">
				<div class="header-section text-center">
					<h2>課程內容</h2>
					<p>適合對象: 想了解Python程式語言的程式開發人員</p>
					<p>預備知識: 熟悉Windows作業系統、具備程式設計邏輯概念</p>
					<hr class="bottom-line">
				</div>
				<div class="feature-info">
					<div class="fea">
						<div class="col-md-4">
							<div class="heading pull-right">
								<h4>大綱</h4>
								<p>1. Python技術及開發環境介紹</p>
								<p>2. 資料型別</p>
								<p>3. 集合</p>
								<p>4. 結構控制</p>
								<p>5. 函數</p>
								<p>6. 模組(Module)</p>
								<p>7. 物件導向程式設計</p>
								<p>8. 例外處理</p>
							</div>
							<div class="fea-img pull-left">
								<i class="fa fa-css3"></i>
							</div>
						</div>
					</div>
					<div class="fea">
						<div class="col-md-4">
							<div class="heading pull-right">
								<h4>參考書</h4>
								<p>Textbook: Introducing Python Modern Computing in Simple
									Packages. Bill Lubanovic. O'Reilly Media, 2014. ISBN:
									1449359361.</p>
								<img src="img/python.jpg">
							</div>
							<div class="fea-img pull-left">
								<i class="fa fa-drupal"></i>
							</div>
						</div>
					</div>
					<div class="fea">
						<div class="col-md-4">
							<div class="heading pull-right">
								<h4>上課資訊</h4>
								<p>Time: Wed 13:10-16:00</p>
								<p>Place: Room 727, the 6th Classroom</p>
							</div>
							<div class="fea-img pull-left">
								<i class="fa fa-trophy"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ feature-->
	<!--Faculity member-->
	<section id="faculity-member" class="section-padding">
		<div class="container">
			<div class="row">
				<div class="header-section text-center">
					<h2>老師和助教的資訊</h2>
					<hr class="bottom-line">
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="pm-staff-profile-container">
						<div class="pm-staff-profile-image-wrapper text-center">
							<div class="pm-staff-profile-image">
								<img src="img/teacher.jpg" alt=""
									class="img-thumbnail img-circle" />
							</div>
						</div>
						<div class="pm-staff-profile-details text-center">
							<p class="pm-staff-profile-name">殺老師</p>
							<p class="pm-staff-profile-title">授課教師</p>
							<p class="pm-staff-profile-bio">
							<p>Office: Technology and Research Building 1732</p>
							<p>Office Hours: Thu 10:10-12:00 and Fri 10:10-12:00, or by
								appointment</p>
							<p>Email: killteacher@csie.ntut.edu.tw</p>
							<p>Phone: 02-2771-2171 ext. 1732</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="pm-staff-profile-container">
						<div class="pm-staff-profile-image-wrapper text-center">
							<div class="pm-staff-profile-image">
								<img src="img/assistant.jpg" alt=""
									class="img-thumbnail img-circle" />
							</div>
						</div>
						<div class="pm-staff-profile-details text-center">
							<p class="pm-staff-profile-name">里包恩</p>
							<p class="pm-staff-profile-title">助教</p>

							<p class="pm-staff-profile-bio">
							<p>Office: Technology and Research Building 1321</p>
							<p>Office Hours: Thu 10:10-12:00 and Fri 10:10-12:00, or by
								appointment</p>
							<p>Email: ribbon@csie.ntut.edu.tw</p>
							<p>Phone: 02-2771-2171 ext. 1321</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ Faculity member-->
	<!--Homework-->
	<section id="homeworks" class="section-padding">
		<div class="container">
			<div class="row">
				<div class="header-section text-center">
					<h2>作業</h2>
					<button class="btn btn-primary" id="button_add_homework"
						onclick="addHomework()">新增作業</button>
					<hr class="bottom-line">
				</div>
			</div>
		</div>
		<div class="container">
			<%
				for (int i = 0; i < homeworkDatas.size(); i++) {
					if (i % 3 == 0) {
						out.println("<div class=\"row\">");
					}
					out.println("<div class=\"col-md-4 col-sm-4\">");
					out.println("<div class=\"price-table\">");
					out.println("<!-- Plan  -->");
					out.println("<div class=\"pricing-head\">");
					String viewArgs = "'" + homeworkDatas.get(i).name + "', '" + homeworkDatas.get(i).deadline + "', '"
							+ homeworkDatas.get(i).information + "', '" + homeworkDatas.get(i).link + "'";
					out.println("<a href=\"#homeworks\" id=\"button_view_homework\" onclick=\"viewHomework(" + viewArgs
							+ ")\" ><h4>" + homeworkDatas.get(i).name + "</h4></a>");
					out.println("<span>繳交期限<br>" + homeworkDatas.get(i).deadline + "</span>");
					out.println("</div>");
					out.println("<div class=\"price-in mart-15\">");
					String editDeleteArgs = homeworkDatas.get(i).id + ", '" + homeworkDatas.get(i).name + "', '"
							+ homeworkDatas.get(i).deadline + "', '" + homeworkDatas.get(i).information + "', '"
							+ homeworkDatas.get(i).link + "'";
					out.println("<button class=\"btn btn-success\" id=\"button_edit_homework\" onclick=\"editHomework("
							+ editDeleteArgs + ")\">編輯</button>");
					out.println("<button class=\"btn btn-danger\" id=\"button_delete_homework\" onclick=\"deleteHomework("
							+ editDeleteArgs + ")\">刪除</button>");
					out.println(
							"<form role=\"form\" action=\"HomeworkFileDownloadServlet\" method=\"post\" enctype=\"multipart/form-data\">");
					out.println("<input type=\"text\" class=\"form-control\" name = \"homework_id\" value = "
							+ homeworkDatas.get(i).id + " readonly>");
					out.println("<button type=\"submit\" class=\"btn btn-success btn-block\">下載</button>");
					out.println("</form>");
					out.println("</div>");
					out.println("</div>");
					out.println("</div>");
					if ((i + 1) % 3 == 0) {
						out.println("</div><br>");
					}
				}
			%>
		</div>
	</section>
	<!--/ Homework-->
	<!--Footer-->
	<footer id="footer" class="footer">
		<div class="container text-center">
			©2016 Mentor Theme. All rights reserved
			<div class="credits">
				<!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Mentor
        -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade.com</a>
			</div>
		</div>
	</footer>
	<!--/ Footer-->

	<%@ include file="homeworkAddDialog.jsp"%>
	<%@ include file="homeworkEditDialog.jsp"%>
	<%@ include file="homeworkDeleteDialog.jsp"%>
	<%@ include file="homeworkViewDialog.jsp"%>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="contactform/contactform.js"></script>
	<script src="homeworkEvent.js"></script>

</body>

</html>
