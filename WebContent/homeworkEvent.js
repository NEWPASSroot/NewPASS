function addHomework() {
	$("#addHomeworkModal").modal();
}

function editHomework(id, name, deadline, information, link) {
	$("#editHomeworkModal").modal();
	document.getElementById("edit_homework_id").value = id;
	document.getElementById("edit_homework_name").value = name;
	document.getElementById("edit_homework_deadline").value = deadline;
	document.getElementById("edit_homework_information").value = information;
	document.getElementById("edit_homework_link").value = link;
}

function deleteHomework(id, name, deadline, information, link) {
	$("#deleteHomeworkModal").modal();
	document.getElementById("delete_homework_id").value = id;
	document.getElementById("delete_homework_name").value = name;
	document.getElementById("delete_homework_deadline").value = deadline;
	document.getElementById("delete_homework_information").value = information;
	document.getElementById("delete_homework_link").value = link;
}

function viewHomework(name, deadline, information, link) {
	$("#viewHomeworkModal").modal();
	document.getElementById("view_homework_name").innerHTML = name;
	document.getElementById("view_homework_deadline").innerHTML = deadline;
	document.getElementById("view_homework_information").innerHTML = information;
	if (link) {
		document.getElementById("view_homework_link").innerHTML = "<label for=\"view_homework_link\" style=\"color: #3399FF\">附件連結</label><br><a href = \""
				+ link
				+ "\" id=\"view_homework_link\" target=\"blank\">"
				+ link + "</a>";
	} else {
		document.getElementById("view_homework_link").innerHTML = "";
	}
}