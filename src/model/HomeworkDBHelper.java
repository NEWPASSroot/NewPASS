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
	private String COL_HOMEWORK_DELAY_DEADLINE = "delay_deadline";
	private String COL_HOMEWORK_INFORMATION = "information";
	private String COL_HOMEWORK_LINK = "link";
	private String COL_HOMEWORK_ATTACH_FILE_NAME = "attach_file_name";
	private String COL_HOMEWORK_ATTACH_FILE = "attach_file";
	private String COL_HOMEWORK_UT_FILE_NAME = "UT_file_name";
	private String COL_HOMEWORK_UT_FILE = "UT_file";
	private DatabaseConnector dbConnector = new DatabaseConnector();

	public ArrayList<HomeworkData> getAllData() {
		String sql = "Select * From " + TABLE_NAME;
		ArrayList<HomeworkData> result = new ArrayList<HomeworkData>();
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			while (resultSet.next()) {
				HomeworkData homeworkData = new HomeworkData();
				homeworkData.id = resultSet.getInt(COL_HOMEWORK_ID);
				homeworkData.name = resultSet.getString(COL_HOMEWORK_NAME);
				homeworkData.deadline = resultSet.getString(COL_HOMEWORK_DEADLINE);
				homeworkData.delayDeadline = resultSet.getBoolean(COL_HOMEWORK_DELAY_DEADLINE);
				homeworkData.information = resultSet.getString(COL_HOMEWORK_INFORMATION);
				homeworkData.link = resultSet.getString(COL_HOMEWORK_LINK);
				homeworkData.attach_file = resultSet.getBlob(COL_HOMEWORK_ATTACH_FILE);
				homeworkData.attach_file_name = resultSet.getString(COL_HOMEWORK_ATTACH_FILE_NAME);
				homeworkData.UT_file = resultSet.getBlob(COL_HOMEWORK_UT_FILE);
				homeworkData.UT_file_name = resultSet.getString(COL_HOMEWORK_UT_FILE_NAME);
				result.add(homeworkData);
			}
			System.out.println("Finish getting all data of homeworks");
		} catch (Exception e) {
			System.out.println("Can not get all data of our homeworks: " + e);
		}
		return result;
	}

	public String getAttachFileName(int id) {
		String sql = "Select " + COL_HOMEWORK_ATTACH_FILE_NAME + " From " + TABLE_NAME + " Where " + COL_HOMEWORK_ID
				+ " = " + id;
		String fileName = "";
		ResultSet resultSet;
		try {
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
		String sql = "Select " + COL_HOMEWORK_ATTACH_FILE + " From " + TABLE_NAME + " Where " + COL_HOMEWORK_ID + " = "
				+ id;
		Blob attachFile = null;
		ResultSet resultSet;
		try {
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

	public String getUTFileName(int id) {
		String sql = "Select " + COL_HOMEWORK_UT_FILE_NAME + " From " + TABLE_NAME + " Where " + COL_HOMEWORK_ID + " = "
				+ id;
		String fileName = "";
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				fileName = resultSet.getString(COL_HOMEWORK_UT_FILE_NAME);
			}
			System.out.println("Finish getting file name of UT");
		} catch (Exception e) {
			System.out.println("Can not get file name of UT: " + e);
		}
		return fileName;
	}

	public Blob getUTFile(int id) {
		String sql = "Select " + COL_HOMEWORK_UT_FILE + " From " + TABLE_NAME + " Where " + COL_HOMEWORK_ID + " = "
				+ id;
		Blob UTFile = null;
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				UTFile = resultSet.getBlob(COL_HOMEWORK_UT_FILE);
			}
			System.out.println("Finish getting the UT file of homeworks");
		} catch (Exception e) {
			System.out.println("Can not get the UT file of our homeworks: " + e);
		}
		return UTFile;
	}

	public String getHomeworkName(int id) {
		String sql = "Select " + COL_HOMEWORK_NAME + " From " + TABLE_NAME + " Where " + COL_HOMEWORK_ID + " = " + id;
		String homeworkName = "";
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				homeworkName = resultSet.getString(COL_HOMEWORK_NAME);
			}
			System.out.println("Finish getting the name of homework");
		} catch (Exception e) {
			System.out.println("Can not get the name of our homework: " + e);
		}
		return homeworkName;
	}

	public String getDeadline(int id) {
		String sql = "Select " + COL_HOMEWORK_DEADLINE + " From " + TABLE_NAME + " Where " + COL_HOMEWORK_ID + " = "
				+ id;
		String deadline = "";
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				deadline = resultSet.getString(COL_HOMEWORK_DEADLINE);
			}
			System.out.println("Finish getting the deadline of homework");
		} catch (Exception e) {
			System.out.println("Can not get the deadline of our homework: " + e);
		}
		return deadline;
	}

	public void insertHomework(String name, String deadline, boolean delayDeadline, String information, String link,
			String attachFileName, InputStream attachFile, String UTFileName, InputStream UTFile) {
		String sql = "Insert Into " + TABLE_NAME + " (" + COL_HOMEWORK_NAME + ", " + COL_HOMEWORK_DEADLINE + ", "
				+ COL_HOMEWORK_DELAY_DEADLINE + ", " + COL_HOMEWORK_INFORMATION + ", " + COL_HOMEWORK_LINK + ", "
				+ COL_HOMEWORK_ATTACH_FILE_NAME + ", " + COL_HOMEWORK_ATTACH_FILE + ", " + COL_HOMEWORK_UT_FILE_NAME
				+ ", " + COL_HOMEWORK_UT_FILE + ") Value ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = dbConnector.connection.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, deadline);
			ps.setBoolean(3, delayDeadline);
			ps.setString(4, information);
			ps.setString(5, link);
			ps.setString(6, attachFileName);
			ps.setBlob(7, attachFile);
			ps.setString(8, UTFileName);
			ps.setBlob(9, UTFile);
			ps.execute();
		} catch (Exception e) {
			System.out.println("Insert Homework Error: " + e);
		}
	}

	public void updateHomework(int id, String name, String deadline, boolean delayDeadline, String information,
			String link) {
		String sql = "Update " + TABLE_NAME + " Set " + COL_HOMEWORK_NAME + " = ?, " + COL_HOMEWORK_DEADLINE + " = ?, "
				+ COL_HOMEWORK_DELAY_DEADLINE + " = ?, " + COL_HOMEWORK_INFORMATION + " = ?, " + COL_HOMEWORK_LINK
				+ " = ? Where " + COL_HOMEWORK_ID + " = ?";
		try {
			DatabaseConnector databaseConnector = new DatabaseConnector();
			PreparedStatement ps = databaseConnector.connection.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, deadline);
			ps.setBoolean(3, delayDeadline);
			ps.setString(4, information);
			ps.setString(5, link);
			ps.setInt(6, id);
			ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Update Homework Error: " + ex);
		}

	}

	public void updateAttachFile(int id, String attachFileName, InputStream attachFile) {
		String sql = "Update " + TABLE_NAME + " Set " + COL_HOMEWORK_ATTACH_FILE_NAME + " = ?, "
				+ COL_HOMEWORK_ATTACH_FILE + " = ? Where " + COL_HOMEWORK_ID + " = ?";
		try {
			DatabaseConnector databaseConnector = new DatabaseConnector();
			PreparedStatement ps = databaseConnector.connection.prepareStatement(sql);
			ps.setString(1, attachFileName);
			ps.setBlob(2, attachFile);
			ps.setInt(3, id);
			ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Update Attach File Error: " + ex);
		}
	}

	public void updateUTFile(int id, String UTFileName, InputStream UTFile) {
		String sql = "Update " + TABLE_NAME + " Set " + COL_HOMEWORK_UT_FILE_NAME + " = ?, " + COL_HOMEWORK_UT_FILE
				+ " = ? Where " + COL_HOMEWORK_ID + " = ?";
		try {
			DatabaseConnector databaseConnector = new DatabaseConnector();
			PreparedStatement ps = databaseConnector.connection.prepareStatement(sql);
			ps.setString(1, UTFileName);
			ps.setBlob(2, UTFile);
			ps.setInt(3, id);
			ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Update Attach File Error: " + ex);
		}
	}

	public void deleteHomework(int id) {
		String sql = "Delete From " + TABLE_NAME + " Where " + COL_HOMEWORK_ID + " = " + id;
		try {
			dbConnector.statement.executeUpdate(sql);
		} catch (Exception ex) {
			System.out.println("Delete Homework Error: " + ex);
		}
	}

}
