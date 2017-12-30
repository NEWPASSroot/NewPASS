package model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TAServlet
 */
@WebServlet("/TAServlet")
public class TAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDBHelper userDBHelper = new UserDBHelper();
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("TA_name");
		System.out.println(userName);
		String userEmail = request.getParameter("TA_email");
		System.out.println(userEmail);
		if (userName == null && userEmail == null) {
			String userId = request.getParameter("TA_id");
			userDBHelper.deleteTA(userId);
		} else {
			String indexString = request.getParameter("TA_id");
			if(indexString == null || indexString.equals("")) {
				System.out.println("No Index of TA");
				return;
			}
			int index = Integer.parseInt(indexString);
			ArrayList<String> studentId = userDBHelper.getAllStudentId();
			String userId = studentId.get(index);
			System.out.println(userId);
			userDBHelper.addTA(userId);
		}
		response.sendRedirect("python.jsp#faculity-member");
	}

}
