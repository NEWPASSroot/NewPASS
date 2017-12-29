package model;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

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
public class AttachFileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HomeworkDBHelper homeworkDBHelper = new HomeworkDBHelper();
		request.setCharacterEncoding("UTF-8");
		String idString = request.getParameter("homework_id");
		int id = idString == null || idString.equals("") ? 0 : Integer.parseInt(idString);
		String name = request.getParameter("homework_name");
		String deadline = request.getParameter("homework_deadline");
		String delayDeadlineString = request.getParameter("homework_delay_deadline");
		boolean delayDeadline = (delayDeadlineString == null || delayDeadlineString.equals("")) ? false
				: delayDeadlineString.equals("on");
		String information = request.getParameter("homework_information");
		String link = request.getParameter("homework_link");
		Part attachFile = request.getPart("homework_attach_file");
		Part UTFile = request.getPart("homework_UT");
		String attachFileName = "";
		String UTFileName = "";
		InputStream uploadHomework = null;
		InputStream uploadUT = null;
		if (attachFile != null) {
			attachFileName = attachFile.getSubmittedFileName();
			uploadHomework = attachFile.getInputStream();
		}
		if (UTFile != null) {
			UTFileName = UTFile.getSubmittedFileName();
			uploadUT = UTFile.getInputStream();
		}
		if (id == 0) {
			if (name != null) {
				homeworkDBHelper.insertHomework(name, deadline, delayDeadline, information, link, attachFileName, uploadHomework,
						UTFileName, uploadUT);
			}
		} else {
			if (name != null) {
				homeworkDBHelper.updateHomework(id, name, deadline, delayDeadline, information, link);
				if (!attachFileName.equals("")) {
					homeworkDBHelper.updateAttachFile(id, attachFileName, uploadHomework);
				}
				if (!UTFileName.equals("")) {
					homeworkDBHelper.updateUTFile(id, UTFileName, uploadUT);
				}
			} else {
				homeworkDBHelper.deleteHomework(id);
				SubmitHomeworkDBHelper submitHomeworkDBHelper = new SubmitHomeworkDBHelper();
				ArrayList<Integer> deleteId = submitHomeworkDBHelper.getDeleteId(id);
				for(int i : deleteId) {
					submitHomeworkDBHelper.deleteHomework(i);
				}
			}
		}
		response.sendRedirect("/NewPASS/python.jsp#homeworks");
	}

}
