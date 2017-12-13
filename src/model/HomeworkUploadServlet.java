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
		if (studentId != null) {
			int id = submitHomeworkDBHelper.getHomeworkFileId(teacherAssignmentId, studentId);
			if(id ==0) {
				submitHomeworkDBHelper.insertHomework(teacherAssignmentId, studentId, submitDatetime, homeworkFileName, inputStream);
			}else {
				submitHomeworkDBHelper.updateHomework(id, submitDatetime, homeworkFileName, inputStream);
			}
		}
		response.sendRedirect("/NewPASS/python-student.jsp#homeworks");
	}

}
