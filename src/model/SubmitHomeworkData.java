package model;

import java.sql.Blob;

public class SubmitHomeworkData {
	public int id;
	public int teacher_assignment_id;
	public String student_id;
	public int score;
	public String submit_datetime;
	public String homework_file_name;
	public Blob homework_file;
}
