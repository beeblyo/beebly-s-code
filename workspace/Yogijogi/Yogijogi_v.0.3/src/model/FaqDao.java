package model;
import java.sql.*;
import java.util.ArrayList;
import dbconn.DBConn;

public class FaqDao 
{
	Connection conn;
	DBConn db;
	
	public FaqDao() 
	{		
		db = new DBConn();
		conn = db.getConnection();		
	} 
	
	public ArrayList<FaqVo> selectAllFaq()
	{
		ArrayList<FaqVo> alist = new ArrayList<FaqVo>();
		String sql = "SELECT * from faq";
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				FaqVo fv = new FaqVo();
				fv.setFno(rs.getInt("fno"));
				fv.setFtitle(rs.getString("ftitle"));
				fv.setFnote(rs.getString("fnote"));
				alist.add(fv);	
			}
		} catch (SQLException e) {e.printStackTrace();}
		return  alist;
	}
	
}
