<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.UserDBHelper"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Delete TA</title>
</head>
<body>

	<div class="modal fade" id="deleteTAModal" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h1 class="mdoal-title">刪除TA</h1>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" action="TAServlet" method="post">
						<div class="form-group">
							<label for="delete_TA_id"> 學號</label> 
							<input type="text" class="form-control" id="delete_TA_id" name="TA_id"
								placeholder="請輸入學號" required="required" readonly>
						</div>
						<div class="form-group">
							<label for="delete_TA_name"> 姓名</label> <input type="text"
								class="form-control" id="delete_TA_name" name="TA_name"
								placeholder="請輸入姓名" required="required" disabled>
						</div>
						<div class="form-group">
							<label for="delete_TA_email"> E-mail</label> <input type="email"
								class="form-control" id="delete_TA_email" name="TA_email"
								placeholder="請輸入E-mail" required="required" disabled>
						</div>
						<button type="submit" class="btn btn-success btn-block" id="delete_TA_submit">
							刪除</button>
						<button type="submit" class="btn btn-danger btn-block"
							data-dismiss="modal" id="delete_TA_cancel">取消</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>

