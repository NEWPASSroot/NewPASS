function addTA(){
	$("#addTAModal").modal();
}

function selectTA(){
	var selectTAId = document.getElementById("add_TA_id")
	var index = selectTAId.options[selectTAId.selectedIndex].value;
	document.getElementById("add_TA_name").value = document.getElementById("TA_name_list").options[index].value;
	document.getElementById("add_TA_email").value = document.getElementById("TA_email_list").options[index].value;
}

function deleteTA(id, name, email){
	$("#deleteTAModal").modal();
	document.getElementById("delete_TA_id").value = id;
	document.getElementById("delete_TA_name").value = name;
	document.getElementById("delete_TA_email").value = email;
}