package model;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/HomeworkFileSubmitUploadServlet")
@MultipartConfig(maxFileSize = 169999999)
public class HomeworkUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SubmitHomeworkDBHelper submitHomeworkDBHelper = new SubmitHomeworkDBHelper();
		request.setCharacterEncoding("UTF-8");
		String idString = request.getParameter("homework_id");
		int id = idString == null || idString.equals("") ? 0 : Integer.parseInt(idString);
		String teacherAssignmentIdString = request.getParameter("teacher_assignment_id");
		int teacherAssignmentId = Integer.parseInt(teacherAssignmentIdString);
		String studentId = request.getParameter("student_id");
		String submitDatetime = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss").format(Calendar.getInstance().getTime());
		Part homeworkFile = request.getPart("homework_file");
		String homeworkFileName = "";
		InputStream inputStream = null;
		if (homeworkFile != null) {
			homeworkFileName = homeworkFile.getSubmittedFileName();
			inputStream = homeworkFile.getInputStream();
		}
		if (id == 0) {
			if (studentId != null) {
				submitHomeworkDBHelper.insertHomework(teacherAssignmentId, studentId, 0, submitDatetime, homeworkFileName, inputStream);
			}
		} else {
			if (studentId != null) {
				//submitHomeworkDBHelper.updateHomework(id, name, deadline, information, link, attachFileName, inputStream);
			} else {
				submitHomeworkDBHelper.deleteHomework(id);
			}
		}
		response.sendRedirect("/NewPASS/python-student.jsp#homeworks");
	}

}
