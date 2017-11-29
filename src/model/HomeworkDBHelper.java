package model;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class HomeworkDBHelper {

	public ResultSet resultSet;
	private String TABLE_NAME = "homeworks";
	private String COL_HOMEWORK_ID = "id";
	private String COL_HOMEWORK_NAME = "name";
	private String COL_HOMEWORK_DEADLINE = "deadline";
	private String COL_HOMEWORK_INFORMATION = "information";
	private String COL_HOMEWORK_LINK = "link";
	private String COL_HOMEWORK_ATTACH_FILE_NAME = "attach_file_name";
	private String COL_HOMEWORK_ATTACH_FILE = "attach_file";
	private DatabaseConnector dbConnector = new DatabaseConnector();

	public ArrayList<HomeworkData> getAllData() {
		ArrayList<HomeworkData> result = new ArrayList<HomeworkData>();
		ResultSet resultSet;
		try {
			String sql = "Select * From " + TABLE_NAME;
			resultSet = dbConnector.statement.executeQuery(sql);
			while (resultSet.next()) {
				HomeworkData homeworkData = new HomeworkData();
				homeworkData.id = resultSet.getInt(COL_HOMEWORK_ID);
				homeworkData.name = resultSet.getString(COL_HOMEWORK_NAME);
				homeworkData.deadline = resultSet.getString(COL_HOMEWORK_DEADLINE);
				homeworkData.information = resultSet.getString(COL_HOMEWORK_INFORMATION);
				homeworkData.link = resultSet.getString(COL_HOMEWORK_LINK);
				homeworkData.attach_file = resultSet.getBlob(COL_HOMEWORK_ATTACH_FILE);
				homeworkData.attach_file_name = resultSet.getString(COL_HOMEWORK_ATTACH_FILE_NAME);
				result.add(homeworkData);
			}
			System.out.println("Finish getting all data of homeworks");
		} catch (Exception e) {
			System.out.println("Can not get all data of our homeworks: " + e);
		}
		return result;
	}

	public String getAttachFileName(int id) {
		String fileName = null;
		ResultSet resultSet;
		try {
			String sql = "Select " + COL_HOMEWORK_ATTACH_FILE_NAME + " From " + TABLE_NAME + " Where " + COL_HOMEWORK_ID
					+ " = " + id;
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				fileName = resultSet.getString(COL_HOMEWORK_ATTACH_FILE_NAME);
			}
			System.out.println("Finish getting file name of homeworks");
		} catch (Exception e) {
			System.out.println("Can not get file name of our homeworks: " + e);
		}
		return fileName;
	}

	public Blob getAttachFile(int id) {
		Blob attachFile = null;
		ResultSet resultSet;
		try {
			String sql = "Select " + COL_HOMEWORK_ATTACH_FILE + " From " + TABLE_NAME + " Where " + COL_HOMEWORK_ID
					+ " = " + id;
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				attachFile = resultSet.getBlob(COL_HOMEWORK_ATTACH_FILE);
			}
			System.out.println("Finish getting the attach file of homeworks");
		} catch (Exception e) {
			System.out.println("Can not get the attach file of our homeworks: " + e);
		}
		return attachFile;
	}

	public void insertHomework(String name, String deadline, String information, String link, String attachFileName,
			InputStream attachFile) {
		String sql = "Insert Into " + TABLE_NAME + " (" + COL_HOMEWORK_NAME + ", " + COL_HOMEWORK_DEADLINE + ", "
				+ COL_HOMEWORK_INFORMATION + ", " + COL_HOMEWORK_LINK + ", " + COL_HOMEWORK_ATTACH_FILE_NAME + ", "
				+ COL_HOMEWORK_ATTACH_FILE + ") Value ( ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = dbConnector.connection.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, deadline);
			ps.setString(3, information);
			ps.setString(4, link);
			ps.setString(5, attachFileName);
			ps.setBlob(6, attachFile);
			ps.execute();
		} catch (Exception e) {
			System.out.println("Insert User Error: " + e);
		}
	}

	public void updateHomework(int id, String name, String deadline, String information, String link) {
		String sql = "Update " + TABLE_NAME + " Set " + COL_HOMEWORK_NAME + " = ?, " + COL_HOMEWORK_DEADLINE + " = ?, "
				+ COL_HOMEWORK_INFORMATION + " = ?, " + COL_HOMEWORK_LINK + " = ? Where " + COL_HOMEWORK_ID + " = ?";
		try {
			DatabaseConnector databaseConnector = new DatabaseConnector();
			PreparedStatement ps = databaseConnector.connection.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, deadline);
			ps.setString(3, information);
			ps.setString(4, link);
			ps.setInt(5, id);
			ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println(ex);
		}

	}

	public void deleteHomework(int id) {
		String sql = "Delete From " + TABLE_NAME + " Where " + COL_HOMEWORK_ID + " = " + id;
		try {
			dbConnector.statement.executeUpdate(sql);
		} catch (Exception ex) {
			System.out.println("Delete User Error: " + ex);
		}
	}

}
