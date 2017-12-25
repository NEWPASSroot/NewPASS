<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="model.User"%>
<%@ page import="model.UserDBHelper"%>
<%@ page import="model.HomeworkDBHelper"%>
<%@ page import="model.SubmitHomeworkData"%>
<%@ page import="model.SubmitHomeworkDBHelper"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>查看全班作業上傳情形</title>
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
		String userId = "", userRole = "";
		if (session.getAttribute("userId") == null) {
			response.sendRedirect("login.jsp");
		} else {
			response.setHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			userId = session.getAttribute("userId").toString();
			userRole = session.getAttribute("userRole").toString();
		}
		UserDBHelper userDBHelper = new UserDBHelper();
		HomeworkDBHelper homeworkDBHelper = new HomeworkDBHelper();
		SubmitHomeworkDBHelper submitHomeworkDBHelper = new SubmitHomeworkDBHelper();
		ArrayList<User> students = userDBHelper.getAllStudents();
		request.setCharacterEncoding("UTF-8");
		String assignmentIdString = request.getParameter("teacher_assignment_id");
		int assignmentId = assignmentIdString == null || assignmentIdString.equals("")
				? 0
				: Integer.parseInt(assignmentIdString);
		if (assignmentId > 0) {
			session.setAttribute("assignmentId", assignmentId);
			response.sendRedirect("#");
		}
		if (session.getAttribute("assignmentId") != null) {
			assignmentIdString = session.getAttribute("assignmentId").toString();
			assignmentId = Integer.parseInt(assignmentIdString);
		}
		String homeworkName = homeworkDBHelper.getHomeworkName(assignmentId);
	%>

	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		// Load the Visualization API and the piechart package.
		google.load('visualization', '1.0', {
			'packages' : [ 'corechart', 'bar' ]
		});

		// Set a callback to run when the Google Visualization API is loaded.
		google.setOnLoadCallback(drawChart);

		// Callback that creates and populates a data table,
		// instantiates the pie chart, passes in the data and
		// draws it.
		function drawChart() {

			// Create the data table.  ******原始資料******
	<%int[] status = new int[3];
			int[] ranges = new int[11];
			for (User student : students) {
				String studentId = student.userId;
				String submitHWTime = submitHomeworkDBHelper.getSubmitHomeworkTime(assignmentId, studentId);
				String deadline = homeworkDBHelper.getDeadline(assignmentId);
				if (submitHWTime == null || submitHWTime.equals("")) {
					status[2]++;
					ranges[0]++;
				} else {
					int score = submitHomeworkDBHelper.getScore(assignmentId, studentId);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
					if (sdf.parse(submitHWTime).getTime() > sdf.parse(deadline).getTime()) {
						status[1]++;
					} else {
						status[0]++;
					}
					int range1 = 0, range2 = 9;
					for (int i = 0; i < ranges.length; i++) {
						if (score >= range1 && score <= range2) {
							ranges[i]++;
							break;
						}
						range1 += 10;
						range2 += 10;
					}
				}
			}%>
		var data = new google.visualization.DataTable();
			data.addColumn('string', 'Item');
			data.addColumn('number', 'Number of people');
			data.addRows([ [ '已繳交',
	<%=status[0]%>
		], [ '遲交',
	<%=status[1]%>
		],
					[ '未繳交',
	<%=status[2]%>
		] ]);

			var data3 = new google.visualization.arrayToDataTable(
					[
							[ 'Score', 'Number of people' ],
	<%int range1 = 0, range2 = 9;
			for (int i = 0; i < ranges.length - 1; i++) {
				out.println("['" + range1 + "-" + range2 + "', " + ranges[i] + "], ");
				range1 += 10;
				range2 += 10;
			}%>
		[
									'100',
	<%=ranges[ranges.length - 1]%>
		] ]);

			// *********************差異之處*************************
			// Set chart options
			var options = {
				'title' : '繳交狀態',
				'width' : 1200,
				'height' : 900
			};

			var options3 = {
				'title' : '成績分布圖',
				'width' : 800,
				'height' : 600
			};

			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document
					.getElementById('chart_div'));
			var chart3 = new google.charts.Bar(document
					.getElementById('chart_div3'));

			chart.draw(data, options);
			chart3.draw(data3, options3);
		}
	</script>

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
					<li><a href="#submitStatus">SubmitStatus</a></li>
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
								<a href="python-student.jsp"> <%=homeworkName%>
								</a>
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
	<!--Submit Status-->
	<section id="submitStatus" class="section-padding">
		<div class="container">
			<div class="row">
				<div class="header-section text-center">
					<h2>Submit Status</h2>
					<hr class="bottom-line">
				</div>
			</div>
		</div>
		<div class="container">
			<table class="table">
				<thead>
					<tr>
						<th><h3>Id</h3></th>
						<th><h3>Name</h3></th>
						<th><h3>Submit Status</h3></th>
						<th><h3>Score</h3></th>
						<th><h3>Submit Time</h3></th>
						<th><h3>File Name</h3></th>
					</tr>
				</thead>
				<tbody>
					<%
						for (User student : students) {
							String studentId = student.userId;
							String studentName = student.name;
							int score = submitHomeworkDBHelper.getScore(assignmentId, studentId);
							String submitHWTime = submitHomeworkDBHelper.getSubmitHomeworkTime(assignmentId, studentId);
							String deadline = homeworkDBHelper.getDeadline(assignmentId);
							String HWFileName = submitHomeworkDBHelper.getHomeworkFileName(assignmentId, studentId);
							if (submitHWTime == null || submitHWTime.equals("")) {
					%>
					<tr class="danger">
						<td><%=studentId%></td>
						<td><%=studentName%></td>
						<td>
							<%
								out.print("未繳交");
							%>
						</td>
						<td><%=score%></td>
						<td><%=submitHWTime%></td>
						<td><%=HWFileName%></td>
					</tr>
					<%
						} else {
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
								if (sdf.parse(submitHWTime).getTime() > sdf.parse(deadline).getTime()) {
					%>
					<tr class="warning">
						<td><%=studentId%></td>
						<td><%=studentName%></td>
						<td>
							<%
								out.print("遲交");
								long dif = (sdf.parse(submitHWTime).getTime()-sdf.parse(deadline).getTime());
								long secondUnit = 1000;
								long minuteUnit = secondUnit * 60;
								long hourUnit = minuteUnit * 60;
								long dayUnit = hourUnit * 24;
								long days = dif / dayUnit;
								if(days==0){
									long hours = dif / hourUnit;
									if(hours==0){
										long minutes = dif / minuteUnit;
										if(minutes==0){
											long seconds = dif / secondUnit;
											out.print(seconds+"秒");
										}else{
											out.print(minutes+"分鐘");
										}
									}else{
										out.print(hours+"小時");
									}
								}else{
									out.print(days+"天");
								}
							%>
						</td>
						<td><%=score%></td>
						<td><%=submitHWTime%></td>
						<td><%=HWFileName%></td>
					</tr>

					<%
						} else {
					%>
					<tr class="info">
						<td><%=studentId%></td>
						<td><%=studentName%></td>
						<td>
							<%
								out.print("已繳交");
							%>
						</td>
						<td><%=score%></td>
						<td><%=submitHWTime%></td>
						<td><%=HWFileName%></td>
					</tr>
					<%
						}
							}
					%>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</section>
	<!--Submit Status-->

	<!--Pie Chart-->
	<div id="chart_div"></div>
	<div id="chart_div3"></div>
	<!--/ Pie Chart-->

	<!--Footer-->
	<footer id="footer" class="footer">
		<div class="container text-center">

			<!-- End newsletter-form -->
			Â©2016 Mentor Theme. All rights reserved
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

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="contactform/contactform.js"></script>

</body>

</html>
