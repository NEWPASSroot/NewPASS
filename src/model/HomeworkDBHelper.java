package model;

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
	private DatabaseConnector dbConnector = new DatabaseConnector();

	public ArrayList<HomeworkData> getAllData() {
		ArrayList<HomeworkData> result=new ArrayList<HomeworkData>();
		ResultSet resultSet;
		try {
			String sql = "Select * From " + TABLE_NAME;
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				HomeworkData homeworkData = new HomeworkData();
				homeworkData.id=resultSet.getInt(COL_HOMEWORK_ID);
				homeworkData.name=resultSet.getString(COL_HOMEWORK_NAME);
				homeworkData.deadline=resultSet.getString(COL_HOMEWORK_DEADLINE);
				homeworkData.information=resultSet.getString(COL_HOMEWORK_INFORMATION);
				result.add(homeworkData);
			}
			System.out.println("Finish getting all data of homeworks");
		} catch (Exception e) {
			System.out.println("Can not get all data of our homeworks: " + e);
		}
		return result;
	}

	public void insertHomework(String name, String deadline, String information) {
		String sql = "Insert Into " + TABLE_NAME + " (" + COL_HOMEWORK_NAME + ", " + COL_HOMEWORK_DEADLINE + ", " + COL_HOMEWORK_INFORMATION + ") Value ( ?, ?, ?)";
		try {
			PreparedStatement ps = dbConnector.connection.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, deadline);
			ps.setString(3, information);
			ps.execute();
		} catch (Exception e) {
			System.out.println("Insert User Error: " + e);
		}
	}
	
	public void updateHomework(int id, String name, String deadline, String information) {
		String sql = "Update " + TABLE_NAME + " Set " + COL_HOMEWORK_NAME + " = ?, " + COL_HOMEWORK_DEADLINE + " = ?, "
				+ COL_HOMEWORK_INFORMATION + " = ? Where " + COL_HOMEWORK_ID + " = ?";
		try {
			DatabaseConnector databaseConnector = new DatabaseConnector();
			PreparedStatement ps = databaseConnector.connection.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, deadline);
			ps.setString(3, information);
			ps.setInt(4, id);
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
