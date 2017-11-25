<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ page import="java.util.ArrayList"%>
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
		HomeworkDBHelper homeworkDBHelper = new HomeworkDBHelper();
		request.setCharacterEncoding("UTF-8");
		String idString = request.getParameter("homework_id");
		int id = idString == null || idString.equals("") ? 0 : Integer.parseInt(idString);
		String name = request.getParameter("homework_name");
		String deadline = request.getParameter("homework_deadline");
		String information = request.getParameter("homework_information");
		ArrayList<HomeworkData> homeworkDatas = homeworkDBHelper.getAllData();
		if (id == 0) {
			if (name != null) {
				homeworkDBHelper.insertHomework(name, deadline, information);
				response.sendRedirect("#");
			}
		} else {
			if (name != null) {
				homeworkDBHelper.updateHomework(id, name, deadline, information);
			} else {
				homeworkDBHelper.deleteHomework(id);
			}
			response.sendRedirect("#");
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
					<li><a href="#organisations">Organisations</a></li>
					<li><a href="#courses">Courses</a></li>
					<li><a href="#pricing">Pricing</a></li>
					<li><a href="#" data-target="#login" data-toggle="modal">Sign
							in</a></li>
					<li class="btn-trial"><a href="#footer">Free Trail</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--/ Navigation bar-->
	<!--Modal box-->
	<div class="modal fade" id="login" role="dialog">
		<div class="modal-dialog modal-sm">

			<!-- Modal content no 1-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-center form-title">Login</h4>
				</div>
				<div class="modal-body padtrbl">

					<div class="login-box-body">
						<p class="login-box-msg">Sign in to start your session</p>
						<div class="form-group">
							<form name="" id="loginForm">
								<div class="form-group has-feedback">
									<!----- username -------------->
									<input class="form-control" placeholder="Username" id="loginid"
										type="text" autocomplete="off" /> <span
										style="display: none; font-weight: bold; position: absolute; color: red; position: absolute; padding: 4px; font-size: 11px; background-color: rgba(128, 128, 128, 0.26); z-index: 17; right: 27px; top: 5px;"
										id="span_loginid"></span>
									<!---Alredy exists  ! -->
									<span class="glyphicon glyphicon-user form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<!----- password -------------->
									<input class="form-control" placeholder="Password"
										id="loginpsw" type="password" autocomplete="off" /> <span
										style="display: none; font-weight: bold; position: absolute; color: grey; position: absolute; padding: 4px; font-size: 11px; background-color: rgba(128, 128, 128, 0.26); z-index: 17; right: 27px; top: 5px;"
										id="span_loginpsw"></span>
									<!---Alredy exists  ! -->
									<span class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="checkbox icheck">
											<label> <input type="checkbox" id="loginrem">
												Remember Me
											</label>
										</div>
									</div>
									<div class="col-xs-12">
										<button type="button" class="btn btn-green btn-block btn-flat"
											onclick="userlogin()">Sign In</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!--/ Modal box-->
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
					<h2>Meet Our Faculty Member</h2>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Exercitationem nesciunt vitae,<br> maiores, magni dolorum
						aliquam.
					</p>
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
							<p>Office Hours: Thu 10:10-12:00 and Fri 10:10-12:00, or by appointment</p>
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
							<p>Office Hours: Thu 10:10-12:00 and Fri 10:10-12:00, or by appointment</p>
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
					<h2>Homeworks</h2>
					<button class="btn btn-primary" id="button_add_homework"
				onclick="addHomework()">新增作業</button>
			<button class="btn btn-success" id="button_edit_homework"
				onclick="editHomework()" disabled="disabled">編輯作業</button>
			<button class="btn btn-danger" id="button_delete_homework"
				onclick="deleteHomework()" disabled="disabled">刪除作業</button>
					<hr class="bottom-line">
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<div class="price-table">
						<!-- Plan  -->
						<div class="pricing-head">
							<h4>Homework#1</h4>
							<span class="fa fa-usd curency"></span> <span class="amount">200</span>
						</div>

						<!-- Plean Detail -->
						<div class="price-in mart-15">
							<a href="#" class="btn btn-bg green btn-block">PURCHACE</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="price-table">
						<!-- Plan  -->
						<div class="pricing-head">
							<h4>Quarterly Plan</h4>
							<span class="fa fa-usd curency"></span> <span class="amount">800</span>
						</div>

						<!-- Plean Detail -->
						<div class="price-in mart-15">
							<a href="#" class="btn btn-bg yellow btn-block">PURCHACE</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="price-table">
						<!-- Plan  -->
						<div class="pricing-head">
							<h4>Year Plan</h4>
							<span class="fa fa-usd curency"></span> <span class="amount">1200</span>
						</div>

						<!-- Plean Detail -->
						<div class="price-in mart-15">
							<a href="#" class="btn btn-bg red btn-block">PURCHACE</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ Homework-->
	<!--Contact-->
	<section id="contact" class="section-padding">
		<div class="container">
			<div class="row">
				<div class="header-section text-center">
					<h2>Contact Us</h2>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Exercitationem nesciunt vitae,<br> maiores, magni dolorum
						aliquam.
					</p>
					<hr class="bottom-line">
				</div>
				<div id="sendmessage">Your message has been sent. Thank you!</div>
				<div id="errormessage"></div>
				<form action="" method="post" role="form" class="contactForm">
					<div class="col-md-6 col-sm-6 col-xs-12 left">
						<div class="form-group">
							<input type="text" name="name" class="form-control form"
								id="name" placeholder="Your Name" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="Your Email" data-rule="email"
								data-msg="Please enter a valid email" />
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="subject"
								id="subject" placeholder="Subject" data-rule="minlen:4"
								data-msg="Please enter at least 8 chars of subject" />
							<div class="validation"></div>
						</div>
					</div>

					<div class="col-md-6 col-sm-6 col-xs-12 right">
						<div class="form-group">
							<textarea class="form-control" name="message" rows="5"
								data-rule="required" data-msg="Please write something for us"
								placeholder="Message"></textarea>
							<div class="validation"></div>
						</div>
					</div>

					<div class="col-xs-12">
						<!-- Button -->
						<button type="submit" id="submit" name="submit"
							class="form contact-form-button light-form-button oswald light">SEND
							EMAIL</button>
					</div>
				</form>

			</div>
		</div>
	</section>
	<!--/ Contact-->
	<!--Footer-->
	<footer id="footer" class="footer">
		<div class="container text-center">

			<h3>Start Your Free Trial Now!</h3>

			<form class="mc-trial row">
				<div class="form-group col-md-3 col-md-offset-2 col-sm-4">
					<div class=" controls">
						<input name="name" placeholder="Enter Your Name"
							class="form-control" type="text">
					</div>
				</div>
				<!-- End email input -->
				<div class="form-group col-md-3 col-sm-4">
					<div class=" controls">
						<input name="EMAIL" placeholder="Enter Your email"
							class="form-control" type="email">
					</div>
				</div>
				<!-- End email input -->
				<div class="col-md-2 col-sm-4">
					<p>
						<button name="submit" type="submit"
							class="btn btn-block btn-submit">
							Submit <i class="fa fa-arrow-right"></i>
						</button>
					</p>
				</div>
			</form>
			<!-- End newsletter-form -->
			<ul class="social-links">
				<li><a href="#link"><i class="fa fa-twitter fa-fw"></i></a></li>
				<li><a href="#link"><i class="fa fa-facebook fa-fw"></i></a></li>
				<li><a href="#link"><i class="fa fa-google-plus fa-fw"></i></a></li>
				<li><a href="#link"><i class="fa fa-dribbble fa-fw"></i></a></li>
				<li><a href="#link"><i class="fa fa-linkedin fa-fw"></i></a></li>
			</ul>
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

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="contactform/contactform.js"></script>
	<script src="homeworkEvent.js"></script>

</body>

</html>
