<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Delete Homework</title>
</head>
<body>

	<div class="modal fade" id="deleteHomeworkModal" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="pdeleteing: 35px 50px;">
					<h1 class="modal-title">刪除作業資訊</h1>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="pdeleteing: 40px 50px;">
					<form role="form" action="HomeworkFileUploadServlet" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="delete_homework_id"> 作業Id</label> <input type="text"
								class="form-control" id="delete_homework_id" name="homework_id"
								readonly>
						</div>
						<div class="form-group">
							<label for="delete_homework_name"> 作業名稱</label> <input
								type="text" class="form-control" id="delete_homework_name"
								name="homework_name" placeholder="請輸入作業名稱" disabled>
						</div>
						<div class="form-group">
							<label for="delete_homework_deadline"> 繳交期限</label> <input
								type="datetime-local" class="form-control"
								id="delete_homework_deadline" name="homework_deadline" disabled>
						</div>
						<div class="form-check">
							<label class="form-check-label"
								for="delete_homework_delay_deadline"><input
								type="checkbox" class="form-check-input"
								id="delete_homework_delay_deadline"
								name="homework_delay_deadline" disabled> 允許遲交</label>
						</div>
						<br>
						<div class="form-group">
							<label for="delete_homework_information"> 作業描述</label>
							<textarea class="form-control" id="delete_homework_information"
								name="homework_information" disabled></textarea>
						</div>
						<div class="form-group">
							<label for="delete_homework_link"> 附件連結</label>
							<textarea class="form-control" id="delete_homework_link"
								name="homework_link" disabled></textarea>
						</div>
						<div class="form-group">
							<label for="delete_homework_attach_file"> 附件</label> <input
								type="text" class="form-control"
								id="delete_homework_attach_file" name="homework_attach_file"
								disabled>
						</div>
						<div class="form-group">
							<label for="delete_homework_UT_file"> UT</label> <input
								type="text" class="form-control" id="delete_homework_UT_file"
								name="homework_UT_file" disabled>
						</div>
						<button type="submit" class="btn btn-success btn-block">
							刪除</button>
						<button type="submit" class="btn btn-danger btn-block"
							data-dismiss="modal">取消</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>

