function addHomework() {
	$("#addHomeworkModal").modal();
}

function editHomework(id, name, deadline, delayDeadline, information, link, attachFileName, UTFileName) {
	$("#editHomeworkModal").modal();
	document.getElementById("edit_homework_id").value = id;
	document.getElementById("edit_homework_name").value = name;
	document.getElementById("edit_homework_deadline").value = deadline;
	document.getElementById("edit_homework_delay_deadline").checked = delayDeadline;
	document.getElementById("edit_homework_information").value = information;
	document.getElementById("edit_homework_link").value = link;
	if (attachFileName) {
		document.getElementById("edit_original_homework_attach_file").innerHTML = "檔案: "
				+ attachFileName;
	}
	if(UTFileName){
		document.getElementById("edit_original_homework_UT_file").innerHTML = "檔案: "
			+ UTFileName;
	}
}

function deleteHomework(id, name, deadline, delayDeadline, information, link, attachFileName, UTFileName) {
	$("#deleteHomeworkModal").modal();
	document.getElementById("delete_homework_id").value = id;
	document.getElementById("delete_homework_name").value = name;
	document.getElementById("delete_homework_deadline").value = deadline;
	document.getElementById("delete_homework_delay_deadline").checked = delayDeadline;
	document.getElementById("delete_homework_information").value = information;
	document.getElementById("delete_homework_link").value = link;
	document.getElementById("delete_homework_attach_file").value = attachFileName;
	document.getElementById("delete_homework_UT_file").value = UTFileName;
}

function viewHomework(id, name, deadline, delayDeadline, information, link, attachFileName, UTFileName) {
	$("#viewHomeworkModal").modal();
	document.getElementById("view_homework_name").innerHTML = name;
	document.getElementById("view_homework_deadline").innerHTML = deadline;
	document.getElementById("view_homework_delay_deadline").checked = delayDeadline;
	document.getElementById("view_homework_information").innerHTML = information;
	if (link) {
		document.getElementById("view_homework_link").innerHTML = "<label for=\"view_homework_link\" style=\"color: #3399FF\">附件連結</label><br><a href = \""
				+ link
				+ "\" id=\"view_homework_link\" target=\"blank\">"
				+ link + "</a>";
	} else {
		document.getElementById("view_homework_link").innerHTML = "";
	}
	if (attachFileName) {
		document.getElementById("view_homework_attach_file").innerHTML = "<label for=\"view_homework_attach_file\" style=\"color: #3399FF\">附件下載</label>"
				+ "<form role=\"form\" action=\"HomeworkFileDownloadServlet\" method=\"post\" enctype=\"multipart/form-data\">"
				+ "<input type=\"hidden\" class=\"form-control\" name = \"homework_id\" value = "
				+ id
				+ " readonly>"
				+ "<button type=\"submit\" class=\"btn btn-default\">"
				+ attachFileName + "</button>" + "</form>";
	} else {
		document.getElementById("view_homework_attach_file").innerHTML = "";
	}
	if (UTFileName) {
		document.getElementById("view_homework_UT_file").innerHTML = "<label for=\"view_homework_UT_file\" style=\"color: #3399FF\">作業批改</label>"
				+ "<form role=\"form\" action=\"HomeworkUTFileExecuteServlet\" method=\"post\" enctype=\"multipart/form-data\">"
				+ "<input type=\"hidden\" class=\"form-control\" name = \"homework_id\" value = "
				+ id
				+ " readonly>"
				+ "<button type=\"submit\" class=\"btn btn-default\">"
				+ UTFileName + "</button>" + "</form>";
	} else {
		document.getElementById("view_homework_UT_file").innerHTML = "";
	}
}

function submitHomeworkScores(size){
	var scoreId = "", score = "";
	for(var i=0; i<size; i++){
		scoreId+=document.getElementById("student_id_"+i).innerHTML+" ";
		score+=document.getElementById("submit_homework_score_"+i).value+" ";
	}
	document.getElementById("submit_homework_scores_id").value=scoreId;
	document.getElementById("submit_homework_scores").value=score;
}