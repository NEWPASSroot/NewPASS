<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Edit Homework</title>
</head>
<body>

	<div class="modal fade" id="editHomeworkModal" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="pediting: 35px 50px;">
					<h1 class="modal-title">編輯作業資訊</h1>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="pediting: 40px 50px;">
					<form role="form" action="HomeworkFileUploadServlet" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="edit_homework_id"> 作業Id</label> <input type="text"
								class="form-control" id="edit_homework_id" name="homework_id"
								readonly>
						</div>
						<div class="form-group">
							<label for="edit_homework_name"> 作業名稱</label> <input type="text"
								class="form-control" id="edit_homework_name"
								name="homework_name" placeholder="請輸入作業名稱" required>
						</div>
						<div class="form-group">
							<label for="edit_homework_deadline"> 繳交期限</label> <input
								type="datetime-local" class="form-control"
								id="edit_homework_deadline" name="homework_deadline" required>
						</div>
						<div class="form-check">
							<label class="form-check-label" for="edit_homework_delay_deadline"><input
								type="checkbox" class="form-check-input"
								id="edit_homework_delay_deadline" name="homework_delay_deadline"> 允許遲交</label>
						</div>
						<br>
						<div class="form-group">
							<label for="edit_homework_information"> 作業描述</label>
							<textarea class="form-control" id="edit_homework_information"
								name="homework_information" required></textarea>
						</div>
						<div class="form-group">
							<label for="edit_homework_link"> 附件連結</label>
							<textarea class="form-control" id="edit_homework_link"
								name="homework_link"></textarea>
						</div>
						<div class="form-group">
							<label for="edit_homework_attach_file"> 附件</label> <input
								type="file" class="form-control" id="edit_homework_attach_file"
								name="homework_attach_file">
							<p id="edit_original_homework_attach_file"></p>
						</div>
						<div class="form-group">
							<label for="edit_homework_UT"> UT</label> <input type="file"
								class="form-control" id="edit_homework_UT" name="homework_UT">
							<p id="edit_original_homework_UT_file"></p>
						</div>
						<button type="submit" class="btn btn-success btn-block" id="edit_homework_submit">
							編輯</button>
						<button type="submit" class="btn btn-danger btn-block"
							data-dismiss="modal" id="edit_homework_cancel">取消</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>

