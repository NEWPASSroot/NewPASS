package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDBHelper {

	private String TABLE_NAME = "user";
	private String COL_ID = "id";
	private String COL_USER_ID = "user_id";
	private String COL_USER_NAME = "name";
	private String COL_USER_PASSWORD = "password";
	private String COL_USER_ROLE = "role";
	private String COL_USER_EMAIL = "email";
	private DatabaseConnector dbConnector = new DatabaseConnector();

	public ArrayList<User> getAllData() {
		String sql = "Select * From " + TABLE_NAME;
		ArrayList<User> result = new ArrayList<User>();
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			while (resultSet.next()) {
				User user = new User();
				user.id = resultSet.getInt(COL_ID);
				user.userId = resultSet.getString(COL_USER_ID);
				user.name = resultSet.getString(COL_USER_NAME);
				user.password = resultSet.getString(COL_USER_PASSWORD);
				user.role = resultSet.getString(COL_USER_ROLE);
				user.email = resultSet.getString(COL_USER_EMAIL);
				result.add(user);
			}
			System.out.println("Finish getting all data of users");
		} catch (Exception e) {
			System.out.println("Can not get all data of users: " + e);
		}
		return result;
	}

	public ArrayList<String[]> getSpecifyData() {
		String sql = "Select " + COL_USER_ID + ", " + COL_USER_NAME + ", " + COL_USER_EMAIL + " From " + TABLE_NAME
				+ " Where " + COL_USER_ROLE + " = 'student' ";
		ArrayList<String[]> result = new ArrayList<String[]>();
		ResultSet resultSet;
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			while (resultSet.next()) {
				String[] data = new String[3];
				data[0] = resultSet.getString(COL_USER_ID);
				data[1] = resultSet.getString(COL_USER_NAME);
				data[2] = resultSet.getString(COL_USER_EMAIL);
				result.add(data);
			}
			System.out.println("Finish getting specify data of users");
		} catch (Exception e) {
			System.out.println("Can not get specify data of users: " + e);
		}
		return result;
	}

	public String[] login(String userId, String userPassword) {
		String sql = "Select " + COL_USER_ID + ", " + COL_USER_NAME + ", " + COL_USER_ROLE + ", " + COL_USER_PASSWORD
				+ " From " + TABLE_NAME + " Where " + COL_USER_ID + " = '" + userId + "' And " + COL_USER_PASSWORD
				+ " = '" + userPassword + "'";
		ResultSet resultSet;
		String userName = "", userRole = "";
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				userName = resultSet.getString(COL_USER_NAME);
				userRole = resultSet.getString(COL_USER_ROLE);
			}
			System.out.print("login ");
			if (!userRole.equals("")) {
				System.out.println("successfully");
			} else {
				System.out.println("fail");
			}
		} catch (Exception e) {
			System.out.println("The sql program for login has the error: " + e);
		}
		String[] result = { userName, userRole };
		return result;
	}

	public void insertUser(String userId, String userName, String userRole, String userEmail) {
		String sql = "Insert Into " + TABLE_NAME + " (" + COL_USER_ID + ", " + COL_USER_NAME + ", " + COL_USER_PASSWORD
				+ ", " + COL_USER_ROLE + ", " + COL_USER_EMAIL + ") Value ( ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = dbConnector.connection.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, userName);
			ps.setString(3, userId);
			ps.setString(4, userRole);
			ps.setString(5, userEmail);
			ps.execute();
		} catch (Exception e) {
			System.out.println("Insert User Error: " + e);
		}
	}

	public void updateUser(int id, String userId, String userName, String userPassword, String userRole,
			String userEmail) {
		String sql = "Update " + TABLE_NAME + " Set " + COL_USER_ID + " = ?, " + COL_USER_NAME + " = ?, "
				+ COL_USER_PASSWORD + " = ?, " + COL_USER_ROLE + " = ?, " + COL_USER_EMAIL + " = ? Where " + COL_ID
				+ " = ? ";
		try {
			PreparedStatement ps = dbConnector.connection.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, userName);
			ps.setString(3, userPassword);
			ps.setString(4, userRole);
			ps.setString(5, userEmail);
			ps.setInt(6, id);
			ps.executeUpdate();
		}

		catch (Exception ex) {
			System.out.println("Update User Error: " + ex);
		}
	}

	public void deleteUser(int id) {
		String sql = "Delete From " + TABLE_NAME + " Where " + COL_ID + " = " + id;
		try {
			dbConnector.statement.executeUpdate(sql);
		} catch (Exception ex) {
			System.out.println("Delete User Error: " + ex);
		}
	}

	public User getPersonalInfo(String userId) {
		String sql = "Select " + COL_ID + ", " + COL_USER_NAME + ", " + COL_USER_EMAIL + " From " + TABLE_NAME
				+ " Where " + COL_USER_ID + " = " + userId;
		ResultSet resultSet;
		User user = new User();
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			while (resultSet.next()) {
				user.id = resultSet.getInt(COL_ID);
				user.userId = userId;
				user.name = resultSet.getString(COL_USER_NAME);
				user.email = resultSet.getString(COL_USER_EMAIL);
			}
			System.out.println("Finish getting personal information");
		} catch (Exception e) {
			System.out.println("Can not get personal information: " + e);
		}
		return user;
	}

	public ArrayList<User> getAllStudents() {
		String sql = "Select * From " + TABLE_NAME + " Where " + COL_USER_ROLE + " = 'student' ";
		ResultSet resultSet;
		ArrayList<User> result = new ArrayList<User>();
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			while (resultSet.next()) {
				User user = new User();
				user.id = resultSet.getInt(COL_ID);
				user.userId = resultSet.getString(COL_USER_ID);
				user.name = resultSet.getString(COL_USER_NAME);
				user.password = resultSet.getString(COL_USER_PASSWORD);
				user.role = resultSet.getString(COL_USER_ROLE);
				user.email = resultSet.getString(COL_USER_EMAIL);
				result.add(user);
			}
			System.out.println("Finish getting all data of students");
		} catch (Exception e) {
			System.out.println("Can not get all data of students: " + e);
		}
		return result;
	}

	public ArrayList<String> getAllStudentId() {
		String sql = "Select " + COL_USER_ID + " From " + TABLE_NAME + " Where " + COL_USER_ROLE + " = 'student' Or " + COL_USER_ROLE + " = 'TA' ";
		ResultSet resultSet;
		ArrayList<String> result = new ArrayList<String>();
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			while (resultSet.next()) {
				result.add(resultSet.getString(COL_USER_ID));
			}
			System.out.println("Finish getting all Id of students");
		} catch (Exception e) {
			System.out.println("Can not get all Id of students: " + e);
		}
		return result;
	}
	
	public String[] getTA() {
		String sql = "Select " + COL_USER_ID + ", " + COL_USER_NAME + ", " + COL_USER_EMAIL + " From " + TABLE_NAME + " Where " + COL_USER_ROLE + " = 'TA' ";
		ResultSet resultSet;
		String[] result = new String[3]; 
		try {
			resultSet = dbConnector.statement.executeQuery(sql);
			if (resultSet.next()) {
				result[0] = resultSet.getString(COL_USER_ID);
				result[1] = resultSet.getString(COL_USER_NAME);
				result[2] = resultSet.getString(COL_USER_EMAIL);
			}
			System.out.println("Finish getting the information of TA");
		} catch (Exception e) {
			System.out.println("Can not get the information of TA: " + e);
		}
		return result;
	}

	public void editEmail(String userId, String userEmail) {
		String sql = "Update " + TABLE_NAME + " Set " + COL_USER_EMAIL + " = ? Where " + COL_USER_ID + " = ? ";
		try {
			PreparedStatement ps = dbConnector.connection.prepareStatement(sql);
			ps.setString(1, userEmail);
			ps.setString(2, userId);
			ps.executeUpdate();
		}

		catch (Exception ex) {
			System.out.println("Update Email Error: " + ex);
		}
	}

	public void editPassword(String userId, String userPassword) {
		String sql = "Update " + TABLE_NAME + " Set " + COL_USER_PASSWORD + " = ? Where " + COL_USER_ID + " = ? ";
		try {
			PreparedStatement ps = dbConnector.connection.prepareStatement(sql);
			ps.setString(1, userPassword);
			ps.setString(2, userId);
			ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Update Password Error: " + ex);
		}
	}

	public void addTA(String userId) {
		String sql = "Update " + TABLE_NAME + " Set " + COL_USER_ROLE + " = 'TA' Where " + COL_USER_ID + " = ? ";
		try {
			PreparedStatement ps = dbConnector.connection.prepareStatement(sql);
			ps.setString(1, userId);
			ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Add TA Error: " + ex);
		}
	}

	public void deleteTA(String userId) {
		String sql = "Update " + TABLE_NAME + " Set " + COL_USER_ROLE + " = 'student' Where " + COL_USER_ID + " = ? ";
		try {
			PreparedStatement ps = dbConnector.connection.prepareStatement(sql);
			ps.setString(1, userId);
			ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Delete TA Error: " + ex);
		}
	}
}
