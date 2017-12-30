package model;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HomeworkFileSubmitDownloadServlet")
@MultipartConfig(maxFileSize = 169999999)
public class HomeworkDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SubmitHomeworkDBHelper submitHomeworkDBHelper = new SubmitHomeworkDBHelper();
		Unzip unzip=new Unzip();
		request.setCharacterEncoding("UTF-8");
		String idString = request.getParameter("homework_id");
		int id = idString == null || idString.equals("") ? 0 : Integer.parseInt(idString);
		String homeworkFileName = submitHomeworkDBHelper.getHomeworkFileName(id);
		Blob homeworkFile = submitHomeworkDBHelper.getAttachFile(id);
		if (homeworkFile == null) {
			System.out.println("No File");
			return;
		}
		InputStream inputStream = null;
		try {
			String contentType = this.getServletContext().getMimeType(homeworkFileName);
			response.setHeader("Content-Type", contentType);
			response.setHeader("Content-Length", String.valueOf(homeworkFile.length()));
			response.setHeader("Content-Disposition", "inline; filename=\"" + homeworkFileName + "\"");
			inputStream = homeworkFile.getBinaryStream();
			byte[] bytes = new byte[1024];
			int bytesRead;
			while ((bytesRead = inputStream.read(bytes)) != -1) {
				response.getOutputStream().write(bytes, 0, bytesRead);
			}
			if(contentType != null && contentType.equals("application/zip")) {
				String dirPath = System.getProperty("user.home")+"/Downloads/";
				String filePath = dirPath+homeworkFileName;
				File file = new File(filePath);
				Thread t=new Thread(new Runnable() {
					public void run() {
						while(!file.exists()) {
							System.out.println("Catching the file...");
						}
						try {
							unzip.unzip(filePath, dirPath);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				});
				t.start();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("InputStream error: " + e);
		} finally {
			inputStream.close();
		}
	}

	

}
