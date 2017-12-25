package model;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SubmitHomeworkDBHelper {

	public ResultSet resultSet;
	private String TABLE_NAME = "submit_homeworks";
	private String COL_ID = "id";
	private String COL_TEACHER_ASSIGNMENT_ID = "teacher_assignment_id";
	private String COL_STUDENT_ID = "student_id";
	private String COL_SCORE = "score";
	private String COL_SUBMIT_DATETIME = "submit_datetime";
	private String COL_HOMEWORK_FILE_NAME = "homework_file_name";
	private String COL_HOMEWORK_FILE = "homework_file";
	private DatabaseConnector dbConnector = new DatabaseConnector();

	public ArrayList<SubmitHomeworkData> getAllData() {
		String sql = "Select * From " + TABLE_NAME;
		ArrayList<SubmitHomeworkData> result = new ArrayList<SubmitHomeworkData>();
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			while (resultSet.next()) {
				SubmitHomeworkData submitHomeworkData = new SubmitHomeworkData();
				submitHomeworkData.id = resultSet.getInt(COL_ID);
				submitHomeworkData.teacher_assignment_id = resultSet.getInt(COL_TEACHER_ASSIGNMENT_ID);
				submitHomeworkData.student_id = resultSet.getString(COL_STUDENT_ID);
				submitHomeworkData.score = resultSet.getInt(COL_SCORE);
				submitHomeworkData.submit_datetime = resultSet.getString(COL_SUBMIT_DATETIME);
				submitHomeworkData.homework_file_name = resultSet.getString(COL_HOMEWORK_FILE_NAME);
				submitHomeworkData.homework_file = resultSet.getBlob(COL_HOMEWORK_FILE);
				result.add(submitHomeworkData);
			}
			System.out.println("Finish getting all data of submitted homeworks");
		} catch (Exception e) {
			System.out.println("Can not get all data of submitted homeworks: " + e);
		}
		return result;
	}

	public int getHomeworkFileId(int teacherAssignmentId, String studentId) {
		String sql = "Select " + COL_ID + " From " + TABLE_NAME + " Where " + COL_TEACHER_ASSIGNMENT_ID + " = "
				+ teacherAssignmentId + " And " + COL_STUDENT_ID + " = " + studentId;
		int id = 0;
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				id = resultSet.getInt(COL_ID);
			}
			System.out.println("Finish getting the id of submitted homework");
		} catch (Exception e) {
			System.out.println("Can not get the id of submitted homework: " + e);
		}
		return id;
	}

	public String getHomeworkFileName(int id) {
		String sql = "Select " + COL_HOMEWORK_FILE_NAME + " From " + TABLE_NAME + " Where " + COL_ID + " = " + id;
		String fileName = null;
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				fileName = resultSet.getString(COL_HOMEWORK_FILE_NAME);
			}
			System.out.println("Finish getting file name of homeworks");
		} catch (Exception e) {
			System.out.println("Can not get file name of our homeworks: " + e);
		}
		return fileName;
	}

	public String getHomeworkFileName(int assignmentId, String studentId) {
		String sql = "Select " + COL_HOMEWORK_FILE_NAME + " From " + TABLE_NAME + " Where " + COL_TEACHER_ASSIGNMENT_ID
				+ " = " + assignmentId + " And " + COL_STUDENT_ID + " = " + studentId;
		String fileName = null;
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				fileName = resultSet.getString(COL_HOMEWORK_FILE_NAME);
			}
			System.out.println("Finish getting file name of homeworks with assignmentId and studentId");
		} catch (Exception e) {
			System.out.println("Can not get file name of our homeworks with assignmentId and studentId: " + e);
		}
		return fileName;
	}

	public String getSubmitHomeworkTime(int assignmentId, String studentId) {
		String sql = "Select " + COL_SUBMIT_DATETIME + " From " + TABLE_NAME + " Where " + COL_TEACHER_ASSIGNMENT_ID
				+ " = " + assignmentId + " And " + COL_STUDENT_ID + " = " + studentId;
		String submitTime = "";
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				submitTime = resultSet.getString(COL_SUBMIT_DATETIME);
			}
			System.out.println("Finish getting the submit status of homeworks");
		} catch (Exception e) {
			System.out.println("Can not get the submit status of homeworks: " + e);
		}
		return submitTime;
	}

	public int getScore(int assignmentId, String studentId) {
		String sql = "Select " + COL_SCORE + " From " + TABLE_NAME + " Where " + COL_TEACHER_ASSIGNMENT_ID + " = "
				+ assignmentId + " And " + COL_STUDENT_ID + " = " + studentId;
		int score = 0;
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				score = resultSet.getInt(COL_SCORE);
			}
			System.out.println("Finish getting the score of a homework");
		} catch (Exception e) {
			System.out.println("Can not get the score of a homework: " + e);
		}
		return score;
	}

	public Blob getAttachFile(int id) {
		Blob attachFile = null;
		ResultSet resultSet;
		try {
			String sql = "Select " + COL_HOMEWORK_FILE + " From " + TABLE_NAME + " Where " + COL_ID + " = " + id;
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				attachFile = resultSet.getBlob(COL_HOMEWORK_FILE);
			}
			System.out.println("Finish getting the attach file of homeworks");
		} catch (Exception e) {
			System.out.println("Can not get the attach file of our homeworks: " + e);
		}
		return attachFile;
	}

	public ArrayList<Integer> getDeleteId(int teacherAssignmentId) {
		ArrayList<Integer> result = new ArrayList<Integer>();
		ResultSet resultSet;
		try {
			String sql = "Select " + COL_ID + " From " + TABLE_NAME + " Where " + COL_TEACHER_ASSIGNMENT_ID + " = "
					+ teacherAssignmentId;
			resultSet = dbConnector.statement.executeQuery(sql);
			while (resultSet.next()) {
				result.add(resultSet.getInt(COL_ID));
			}
			System.out.println("Finish getting the delete id of homeworks");
		} catch (Exception e) {
			System.out.println("Can not get the delete id of our homeworks: " + e);
		}
		return result;
	}

	public void insertHomework(int teacherAssignmentId, String studentId, String submitDatetime,
			String homeworkFileName, InputStream homeworkFile) {
		String sql = "Insert Into " + TABLE_NAME + " (" + COL_TEACHER_ASSIGNMENT_ID + ", " + COL_STUDENT_ID + ", "
				+ COL_SUBMIT_DATETIME + ", " + COL_HOMEWORK_FILE_NAME + ", " + COL_HOMEWORK_FILE
				+ ") Value ( ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = dbConnector.connection.prepareStatement(sql);
			ps.setInt(1, teacherAssignmentId);
			ps.setString(2, studentId);
			ps.setString(3, submitDatetime);
			ps.setString(4, homeworkFileName);
			ps.setBlob(5, homeworkFile);
			ps.execute();
		} catch (Exception e) {
			System.out.println("Insert Submitted Homework Error: " + e);
		}
	}

	public void updateHomework(int id, String submitDatetime, String homeworkFileName, InputStream homeworkFile) {
		String sql = "Update " + TABLE_NAME + " Set " + COL_SUBMIT_DATETIME + " = ?," + COL_HOMEWORK_FILE_NAME
				+ " = ?, " + COL_HOMEWORK_FILE + " = ? Where " + COL_ID + " = ?";
		try {
			DatabaseConnector databaseConnector = new DatabaseConnector();
			PreparedStatement ps = databaseConnector.connection.prepareStatement(sql);
			ps.setString(1, submitDatetime);
			ps.setString(2, homeworkFileName);
			ps.setBlob(3, homeworkFile);
			ps.setInt(4, id);
			ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Update Submitted Homework " + ex);
		}

	}

	public void deleteHomework(int id) {
		String sql = "Delete From " + TABLE_NAME + " Where " + COL_ID + " = " + id;
		try {
			dbConnector.statement.executeUpdate(sql);
		} catch (Exception ex) {
			System.out.println("Delete Submitted Homework Error: " + ex);
		}
	}

}
