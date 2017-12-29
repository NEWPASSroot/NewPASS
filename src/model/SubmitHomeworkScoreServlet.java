package model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SubmitHomeworkScoreServlet
 */
@WebServlet("/SubmitHomeworkScoreServlet")
public class SubmitHomeworkScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SubmitHomeworkDBHelper submitHomeworkDBHelper = new SubmitHomeworkDBHelper();
		String assignmentIdString = request.getParameter("submit_homework_scores_assignment_id");
		int assignmentId = (assignmentIdString == null || assignmentIdString.equals("")) ? 0
				: Integer.parseInt(assignmentIdString);
		String scoreIdString = request.getParameter("submit_homework_scores_id");
		String scoreString = request.getParameter("submit_homework_scores");
		if (scoreString != null || !scoreString.equals("")) {
			String[] scoresId = scoreIdString.split(" ");
			String[] scores = scoreString.split(" ");
			for (int i = 0; i < scoresId.length; i++) {
				String scoreId = scoresId[i];
				String score = scores[i];
				if (!scoreId.equals("") && !score.equals("")) {
					System.out.println(assignmentId+ " " + scoreId + " " + score);
					submitHomeworkDBHelper.updateScore(assignmentId, scoreId, Integer.parseInt(score));
				}
			}
		}
		response.sendRedirect("viewSubmitStatus.jsp");
	}

}
