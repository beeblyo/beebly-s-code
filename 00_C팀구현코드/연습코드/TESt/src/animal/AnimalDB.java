package animal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class AnimalDB
{
	
	String host     = "";
	String userid   = "";
	String passwd   = "";
	Connection conn = null;
	Statement stmt  = null;
	ResultSet result = null;
	
	public AnimalDB()
	{
		host   = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
		userid = "root";
		passwd = "ezen";
	}
	
	public boolean DBOpen()
	{
		//JDBC 드라이버를 로딩한다.
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			//데이터베이스 연결 ON
			conn = DriverManager.getConnection(host,userid,passwd);
			
		} catch (Exception e) 
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public void DBClose()
	{
		try 
		{
			conn.close();
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean RunSQL(String sql)
	{
		try
		{
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean OpenQuery(String sql)
	{
		try 
		{
			stmt   = conn.createStatement();
			result = stmt.executeQuery(sql);
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean GetNext()
	{
		try 
		{
			return result.next();
		} catch (Exception e) 
		{
			e.printStackTrace();
			return false;
		}
	}
	
	public String GetSval(String column)
	{
		try 
		{
			return result.getString(column);
		} catch (SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	public int GetIval(String column)
	{
		try 
		{
			return result.getInt(column);
		} catch (SQLException e) 
		{
			e.printStackTrace();
			return 0;
		}
		
	}
	
	public void CloseQuery()
	{
		try {
			result.close();
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
