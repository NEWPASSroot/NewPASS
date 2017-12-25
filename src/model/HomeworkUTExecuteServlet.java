package model;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HomeworkUTFileExecuteServlet")
@MultipartConfig(maxFileSize = 169999999)
public class HomeworkUTExecuteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String downloadDirPath = System.getProperty("user.home") + "/Downloads/";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SubmitHomeworkDBHelper submitHomeworkDBHelper = new SubmitHomeworkDBHelper();
		HomeworkDBHelper homeworkDBHelper = new HomeworkDBHelper();
		Unzip unzip = new Unzip();
		request.setCharacterEncoding("UTF-8");
		String idString = request.getParameter("homework_id");
		int id = idString == null || idString.equals("") ? 0 : Integer.parseInt(idString);
		String UTFileName = homeworkDBHelper.getUTFileName(id);
		Blob UTFile = homeworkDBHelper.getUTFile(id);
		if (UTFile == null) {
			System.out.println("No UT File");
			return;
		}
		ArrayList<SubmitHomeworkData> homework = new ArrayList<SubmitHomeworkData>();
	}

	private void download(HttpServletResponse response, String fileName, Blob file, String contentType)
			throws Exception {
		response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Length", String.valueOf(file.length()));
		response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\"");
		InputStream inputStream = file.getBinaryStream();
		byte[] bytes = new byte[1024];
		int bytesRead;
		while ((bytesRead = inputStream.read(bytes)) != -1) {
			response.getOutputStream().write(bytes, 0, bytesRead);
		}
		inputStream.close();
	}

}
