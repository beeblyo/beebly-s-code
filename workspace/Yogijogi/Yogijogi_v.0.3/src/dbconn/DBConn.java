package dbconn;
import java.sql.*;

public class DBConn 
{
	/*
	private String url = "jdbc:mysql://127.0.0.1:3306/jrbddb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
	private String user = "root";
	private String password = "ezen";
	*/
	//jjezen in database
	private String url = "jdbc:mysql://jjezen.cafe24.com:3307/api_20221011_a?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
	private String user = "a_user_20221011";
	private String password = "user1234!!"; 
	
	private static Connection conn = null;
	
	public Connection getConnection()
	{
		if(conn == null) {
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, password);
			}catch(Exception e){}
		}
		return conn;
	}
	
	
	public static void main(String[] args) 
	{
		
	}

}
