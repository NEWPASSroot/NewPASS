package model;

import java.sql.Blob;

public class HomeworkData {
	public int id;
	public String name;
	public String deadline;
	public boolean delayDeadline;
	public String information;
	public String link;
	public String attach_file_name;
	public Blob attach_file;
	public String UT_file_name;
	public Blob UT_file;
}
