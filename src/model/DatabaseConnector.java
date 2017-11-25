package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DatabaseConnector {
	public Connection connection;
	public Statement statement;
	
	private String DATABASE_NAME = "pass";
	private String ACCOUNT = "root";
	private String PASSWORD = "root";
	
	public DatabaseConnector() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+DATABASE_NAME, ACCOUNT, PASSWORD);
			statement = connection.createStatement();
		}catch(Exception e) {
			System.out.println("Database Connection Error: " + e);
		}
	}
}
