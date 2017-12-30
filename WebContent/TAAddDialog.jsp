<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.UserDBHelper"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Add TA</title>
</head>
<body>

	<div class="modal fade" id="addTAModal" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h1 class="mdoal-title">新增TA</h1>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" action="TAServlet" method="post">
						<div class="form-group">
							<label for="add_TA_id"> 學號</label> 
							<select class="form-control" id="add_TA_id" name="TA_id"
							onchange="selectTA()" required="required">
								<%
									ArrayList<String[]> TADatas = new UserDBHelper().getSpecifyData();
									for(int i=0; i<TADatas.size(); i++){
								%>
										<option value ="<%=i%>">
											<%
												out.println(TADatas.get(i)[0]);
											%>
										</option>
								<%
									}
								%>
							</select>
						</div>
						<div class="form-group">
							<label for="add_TA_name"> 姓名</label> <input type="text" value=<%=TADatas.get(0)[1]%>
								class="form-control" id="add_TA_name" name="TA_name" list="TA_name_list"
								placeholder="請輸入姓名" required="required" readonly>
							<datalist id="TA_name_list">
								<%
									for(int i=0 ;i<TADatas.size(); i++){
								%>
										<option value=<%out.println(TADatas.get(i)[1]);%>></option>
								<%
									}
								%>
							</datalist>
						</div>
						<div class="form-group">
							<label for="add_TA_email"> E-mail</label> <input type="email" value=<%=TADatas.get(0)[2]%>
								class="form-control" id="add_TA_email" name="TA_email" list="TA_email_list"
								placeholder="請輸入E-mail" required="required" readonly>
							<datalist id="TA_email_list">
								<%
									for(int i=0 ;i<TADatas.size(); i++){
								%>
										<option value=<%out.println(TADatas.get(i)[2]);%>></option>
								<%
									}
								%>
							</datalist>
						</div>
						<button type="submit" class="btn btn-success btn-block" id="add_TA_submit">
							新增</button>
						<button type="submit" class="btn btn-danger btn-block"
							data-dismiss="modal" id="add_TA_cancel">取消</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>

