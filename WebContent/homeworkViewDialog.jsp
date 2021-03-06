<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>View Homework</title>
</head>
<body>
	<%
		String role = "";
		if(session.getAttribute("userRole")!=null){
			role = session.getAttribute("userRole").toString();
		}
	%>
	<div class="modal fade" id="viewHomeworkModal" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="pdeleteing: 35px 50px;">
					<h3 class="modal-title">查看作業資訊</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="pdeleteing: 40px 50px;">
					<div class="container-fluid">
						<label for="view_homework_name" style="color: #3399FF">作業標題</label>
						<p id="view_homework_name"></p>
					</div>
					<div class="container-fluid">
						<label for="view_homework_deadline" style="color: #3399FF">繳交期限</label>
						<p id="view_homework_deadline"></p>
					</div>
					<div class="container-fluid">
						<div class="form-check">
							<label class="form-check-label" for="add_homework_delay_deadline"
								style="color: #3399FF"><input type="checkbox"
								class="form-check-input" id="view_homework_delay_deadline"
								name="homework_delay_deadline" disabled> 允許遲交</label>
						</div>
						<br>
					</div>
					<div class="container-fluid">
						<label for="view_homework_information" style="color: #3399FF">作業描述</label>
						<p id="view_homework_information"></p>
					</div>
					<div class="container-fluid" id="view_homework_link"></div>
					<div class="container-fluid" id="view_homework_attach_file"></div>
					<%
						if(!role.equals("student")){
					%>
						<div class="container-fluid" id="view_homework_UT_file"></div>
					<%
						}
					%>
					<br>
					<button type="submit" class="btn btn-danger btn-block"
						data-dismiss="modal">關閉</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>

