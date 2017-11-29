package model;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class HomeworkUploadServlet
 */
@WebServlet("/HomeworkFileUploadServlet")
@MultipartConfig(maxFileSize = 169999999)
public class HomeworkUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HomeworkDBHelper homeworkDBHelper = new HomeworkDBHelper();
		request.setCharacterEncoding("UTF-8");
		String idString = request.getParameter("homework_id");
		int id = idString == null || idString.equals("") ? 0 : Integer.parseInt(idString);
		String name = request.getParameter("homework_name");
		String deadline = request.getParameter("homework_deadline");
		String information = request.getParameter("homework_information");
		String link = request.getParameter("homework_link");
		Part attachFile = request.getPart("homework_attach_file");
		String attachFileName = "";
		InputStream inputStream = null;
		if (attachFile != null) {
			attachFileName = attachFile.getSubmittedFileName();
			inputStream = attachFile.getInputStream();
		}
		if (id == 0) {
			if (name != null) {
				homeworkDBHelper.insertHomework(name, deadline, information, link, attachFileName, inputStream);
			}
		} else {
			if (name != null) {
				homeworkDBHelper.updateHomework(id, name, deadline, information, link);
			} else {
				homeworkDBHelper.deleteHomework(id);
			}
		}
		response.sendRedirect("/NewPASS/python.jsp#homeworks");
	}

}
