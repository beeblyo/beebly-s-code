package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConn;

public class BookingDao {
	Connection conn;
	DBConn db;
	
	public BookingDao() {	
		
		db = new DBConn();
		conn = db.getConnection();		
	}
	
	public int insertBooking(BookingVo book) {
		int exec=0;
		 
		String sql  = "insert into booking(bkdate, bkkind, bkexpsc, bkmiddsc, bkchesc, bkadultc, bkchildc, bktotal, bktime) ";
		       sql += "values(?,?,?,?,?,?,?,?,?)";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getBkdate());
			pstmt.setString(2, book.getBkkind());
			pstmt.setString(3, book.getBkexpsc());
			pstmt.setString(4, book.getBkmiddsc());
			pstmt.setString(5, book.getBkchesc());
			pstmt.setString(6, book.getBkadultc());
			pstmt.setString(7, book.getBkchildc());
			pstmt.setString(8, book.getBktotal());
			pstmt.setString(9, book.getBktime());
			
			exec = pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			/*
			 try {
					conn.close();
				} catch (SQLException e) {				
					e.printStackTrace();
				}
				*/
		}
		
		
		return exec;
	}
	
	public ArrayList<BookingVo> selectAllBooking()
	{
		ArrayList<BookingVo> booking = new ArrayList<BookingVo>();
		
		String sql = "select * from booking order by bkno asc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				BookingVo book = new BookingVo();				
				book.setBkdate(rs.getString("bkdate"));
				book.setBkkind(rs.getString("bkkind"));
				book.setBkexpsc(rs.getString("bkexpsc"));
				book.setBkmiddsc(rs.getString("bkmiddsc"));
				book.setBkchesc(rs.getString("bkchesc"));
				book.setBkadultc(rs.getString("bkadultc"));
				book.setBkchildc(rs.getString("bkchildc"));
				book.setBktotal(rs.getString("bktotal"));
				book.setBktime(rs.getString("bktime"));
			}						
		} catch (SQLException e) 
		{		
			e.printStackTrace();
		}		
		
		return booking;
	}

}
