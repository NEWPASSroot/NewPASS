<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Add Homework</title>
</head>
<body>

	<div class="modal fade" id="addHomeworkModal" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h1 class="mdoal-title">新增作業資訊</h1>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" action="HomeworkFileUploadServlet" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="add_homework_name"> 作業名稱</label> <input type="text"
								class="form-control" id="add_homework_name" name="homework_name"
								placeholder="請輸入作業名稱" required="required">
						</div>
						<div class="form-group">
							<label for="add_homework_deadline"> 繳交期限</label> <input
								type="datetime-local" class="form-control"
								id="add_homework_deadline" name="homework_deadline"
								required="required">
						</div>
						<div class="form-check">
							<label class="form-check-label" for="add_homework_delay_deadline"><input
								type="checkbox" class="form-check-input"
								id="add_homework_delay_deadline" name="homework_delay_deadline"> 允許遲交</label>
						</div>
						<br>
						<div class="form-group">
							<label for="add_homework_information"> 作業描述</label>
							<input class="form-control" id="add_homework_information"
								name="homework_information" required="required">
						</div>
						<div class="form-group">
							<label for="add_homework_link"> 附件連結</label>
							<input class="form-control" id="add_homework_link"
								name="homework_link">
						</div>
						<div class="form-group">
							<label for="add_homework_attach_file"> 附件</label> <input
								type="file" class="form-control" id="add_homework_attach_file"
								name="homework_attach_file">
						</div>
						<div class="form-group">
							<label for="add_homework_UT"> UT</label> <input type="file"
								accept=".zip" class="form-control" id="add_homework_UT"
								name="homework_UT">
						</div>
						<button type="submit" class="btn btn-success btn-block" id="add_homework_submit">
							新增</button>
						<button type="submit" class="btn btn-danger btn-block"
							data-dismiss="modal" id="add_homework_cancel">取消</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>

