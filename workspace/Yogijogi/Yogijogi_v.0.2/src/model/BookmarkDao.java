package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.BookmarkVo;
import dbconn.DBConn;

public class BookmarkDao
{
	Connection conn;
	DBConn db;
	
	public BookmarkDao() 
	{	
		
		db = new DBConn();
		conn = db.getConnection();		
	}
	
	/* 북마크가 있는지 */
	public int bookmarkIs(int mno, String cno) {
		
		int exec = 0;
		
		String sql = "";
		sql += "SELECT * ";
		sql += "FROM bookmark ";
		sql += "WHERE mno = ? and cno = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			pstmt.setString(2, cno);
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
		
			if(rs.next()) 
			{
				exec = 1;
			} 
		}catch (SQLException e) 
		{		
			e.printStackTrace();
		}	

		return exec;
	}
	
	//************************북마크를 등록한다******************************//
	public int bookmarkInsert(BookmarkVo bm)
	{
		int exec=0;
		
		String sql = "insert into bookmark (mno,cno) ";
		sql += "values (?,?)";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bm.getMno());
			pstmt.setString(2, bm.getCno());
			
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
	
	//******************북마크를 삭제한다******************************//
	public int bookmarkDelete(BookmarkVo bm)
	{
		int exec=0;
		
		String sql = "delete from bookmark ";
		sql += "where mno = ? and cno = ?";
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bm.getMno());
			pstmt.setString(2, bm.getCno());
			
			exec = pstmt.executeUpdate();
		}catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return exec;
	}
	
	//******************북마크를 삭제한다******************************//
	public void bookmarkDelete(int bmno)
	{
		String sql = "delete from bookmark ";
		sql += "where bmno = ?";
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bmno);
		}catch (SQLException e)
		{
			e.printStackTrace();
		}
		return;
	}
	
	//******************북마크를 조회한다***************************//
	public ArrayList<BookmarkVo> bookmarkIndex(int mno)
	{
		ArrayList<BookmarkVo> list = null;
		String sql = "";
		sql += "SELECT bmno, b.mno, bmdate, c.csubject, c.ckind, c.cno, c.cplace, c.cstartDay, c.cendDay ";
		sql += "FROM bookmark as b ";
		sql += "inner join culture as c ";
		sql += "on c.cno = b.cno ";
		sql += "WHERE b.mno = " + mno;
		sql += " order by bmno desc";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
		
			list = new ArrayList<BookmarkVo>();
			while(rs.next()) 
			{
				BookmarkVo vo = new BookmarkVo();
				vo.setBmdate(rs.getString("bmdate"));
				vo.setBmno(rs.getString("bmno"));
				vo.setCno(rs.getString("cno"));
				vo.setCkind(rs.getString("ckind"));
				vo.setMno(rs.getString("mno"));
				vo.setCsubject(rs.getString("csubject"));
				vo.setCplace(rs.getString("cplace"));
				vo.setCstartDay(rs.getString("cstartDay"));
				vo.setCendDay(rs.getString("cendDay"));
				
				list.add(vo);
			} 
		}catch (SQLException e) 
		{		
			e.printStackTrace();
		}	

		return list;
	}

}
