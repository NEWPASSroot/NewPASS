package model;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Map.Entry;
import java.util.AbstractMap.SimpleEntry;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
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
	private static final int DEFAULT_BUFFER_SIZE = 10240;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SubmitHomeworkDBHelper submitHomeworkDBHelper = new SubmitHomeworkDBHelper();
		HomeworkDBHelper homeworkDBHelper = new HomeworkDBHelper();
		Unzip unzip = new Unzip();
		request.setCharacterEncoding("UTF-8");
		String idString = request.getParameter("homework_id");
		int id = idString == null || idString.equals("") ? 0 : Integer.parseInt(idString);
		String HWName = homeworkDBHelper.getHomeworkName(id);
		String UTFileName = homeworkDBHelper.getUTFileName(id);
		Blob UTFile = homeworkDBHelper.getUTFile(id);
		if (UTFile == null) {
			System.out.println("No UT File");
			return;
		}
		ArrayList<Entry<String, Blob>> fileList = submitHomeworkDBHelper.getHomeworkFiles(id);
		fileList.add(new SimpleEntry<>(UTFileName, UTFile));
		response.setContentType("application/zip");
		response.setHeader("Content-Disposition", "attachment; filename=\"allHWFile.zip\"");
		ZipOutputStream output = null;
		byte[] bytes = new byte[DEFAULT_BUFFER_SIZE];
		try {
			output = new ZipOutputStream(new BufferedOutputStream(response.getOutputStream(), DEFAULT_BUFFER_SIZE));
			for (Entry<String, Blob> fileData : fileList) {
				if (fileData == null)
					continue;
				InputStream input = null;
				String fileName = fileData.getKey();
				Blob file = fileData.getValue();
				try {
					try {
						input = new BufferedInputStream(file.getBinaryStream(), DEFAULT_BUFFER_SIZE);
					} catch (Exception ex) {
						System.out.println("Can not input file: " + ex);
					}
					output.putNextEntry(new ZipEntry(fileName));
					for (int bytesRead = 0; (bytesRead = input.read(bytes)) > 0;) {
						output.write(bytes, 0, bytesRead);
					}
					output.closeEntry();
				} finally {
					if (input != null) {
						try {
							input.close();
						} catch (Exception ex) {
							System.out.println("Can not close input: " + ex);
						}
					}
				}
			}
		} finally {
			if (output != null) {
				try {
					output.close();
				} catch (Exception ex) {
					System.out.println("Can not close output: " + ex);
				}
			}
		}
		String dirPath = downloadDirPath + "allHWFile/";
		String filePath = downloadDirPath + "allHWFile.zip";
		String hwDirPath = dirPath + "Python/" + HWName + "/";
		File file = new File(filePath);
		ArrayList<String> studentIds = submitHomeworkDBHelper.getSubmittedStudentId(id);
		Thread t = new Thread(new Runnable() {
			public void run() {
				while (!file.exists()) {
					System.out.println("Catching the file...");
				}
				try {
					File dir = new File(dirPath);
					dir.mkdirs();
					unzip.unzip(filePath, dirPath);
					System.out.println("Finish unzip!");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				for (String studentId : studentIds) {
					String studentDirPath = hwDirPath + studentId + "/";
					File dir = new File(studentDirPath);
					dir.mkdirs();
					String submittedHWName = submitHomeworkDBHelper.getHomeworkFileName(id, studentId);
					String submittedHWSource = dirPath + submittedHWName;
					String submittedHWTarget = studentDirPath + "main.py";
					File source = new File(submittedHWSource);
					File target = new File(submittedHWTarget);
					if (source.renameTo(target)) {
						System.out.println("Move " + studentId + "'s " + submittedHWName + " successfully.");
					} else {
						System.out.println("Fail to move " + studentId + "'s " + submittedHWName + ".");
					}
					String testSourcePath = dirPath + UTFileName;
					String testTargetPath = studentDirPath + UTFileName;
					try {
						Files.copy(Paths.get(testSourcePath), Paths.get(testTargetPath),
								StandardCopyOption.REPLACE_EXISTING);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					File test = new File(testTargetPath);
					try {
						while(!test.exists()) {
							System.out.println("Catching the UT File...");
						}
						unzip.unzip(testTargetPath, studentDirPath);
						System.out.println("Finish Unzip UT File!");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					boolean isZip = submittedHWName.contains(".zip");
					if(isZip) {
						while(!target.exists()) {
							System.out.println("Catching the submitted Homework Zip");
						}
						try {
							unzip.unzip(submittedHWTarget, studentDirPath);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					
				}
				String score = "";
				try {
					score = post(hwDirPath, studentIds);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(score);
			}
		});
		t.start();
	}
	
	private static String post(String path, ArrayList<String> hwFolderList) throws Exception {
		if(path==null || path.equals("")) {
			return "";
		}
		if(hwFolderList == null || hwFolderList.isEmpty()) {
			return "";
		}
		String url = "http://127.0.0.1:5000/python";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		String folderList = hwFolderList.get(0);
		for(int i=1; i<hwFolderList.size(); i++) {
			folderList+=";"+hwFolderList.get(i);
		}
		if(path.charAt(path.length()-1)=='\\' || path.charAt(path.length()-1)=='/') {
			path = path.substring(0, path.length()-1);
		}
		String data ="path="+path+"&folderList="+folderList;
		con.setRequestMethod("POST");
        con.setDoOutput(true);
		con.setDoInput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(data);
		wr.flush();
		wr.close();
		int responseCode = con.getResponseCode();
		System.out.println(responseCode);
		
		BufferedReader in =new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while((inputLine = in.readLine())!=null) {
			response.append(inputLine);
		}
		return response.toString();
	}
}
