package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConn;
import model.ReplyVo;

public class ReplyDao 
{
	Connection conn;
	DBConn db;
	int exec = 0;
	String sql;
	private ArrayList<ReplyVo> list;
	
	public ReplyDao()
	{
		db = new DBConn();
		conn = db.getConnection();
	}
	
	//´ñ±Û ¾²±â
	public int insertReply(ReplyVo rv)
	{		
		
		sql  = "insert into reply(bno, mno, rnote) ";
		sql += "value(?,?,?)" ;
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rv.getBno());
			pstmt.setString(2, rv.getMno());
			pstmt.setString(3, rv.getRnote());
			
			exec = pstmt.executeUpdate();
			
			sql = "select last_insert_id() as no ";
			pstmt.executeQuery();
			
		}catch (SQLException e) 
		{
			e.printStackTrace();
		}finally 
		 {
			try
			{
				conn.close();
			} catch (SQLException e)
			{				
				e.printStackTrace();
			}
		 }
		
		return exec;
	}
	
	//´ñ±Û »èÁ¦
	public int deleteReply(int rno)
	{	
		sql  = "delete from Reply ";
		sql += "where rno = ?";
	
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			exec = pstmt.executeUpdate();
		}catch (SQLException e)
		{
			e.printStackTrace();
		}finally 
		 {
			try
			{
				conn.close();
			} catch (SQLException e)
			{				
				e.printStackTrace();
			}
		 }
		
				
		return exec;
	}
	
	//´ñ±Û ¾÷µ¥ÀÌÆ® 
	public int updateReply(ReplyVo rv)
	{
		sql  = "update reply ";
		sql += "set rnote = ? ";
		sql += "where rno = ?";
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rv.getRnote());
			pstmt.setInt(2,  rv.getRno());
			
			exec = pstmt.executeUpdate();
		}catch (SQLException e)
		{
			e.printStackTrace();
		}finally 
		 {
			try
			{
				conn.close();
			} catch (SQLException e)
			{				
				e.printStackTrace();
			}
		 }
		
		return exec;
	}
	
	//´ñ±Û ¸ñ·Ï Á¶È¸
	public ArrayList<ReplyVo> selectAllReply(String bno)
	{
		ArrayList<ReplyVo> alist = new ArrayList<ReplyVo>();
			
		sql = "select rno,bno,mno,rnote,date(rwdate) as rwdate, ";
		sql += "(select mname from member where mno = reply.mno) as mname "; 
		sql += "from reply where bno = ? ";
		sql += "order by rno desc ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				ReplyVo rv = new ReplyVo();
				rv.setRno(rs.getInt("rno"));
				rv.setBno(rs.getString("bno"));
				rv.setMno(rs.getString("mno"));
				rv.setMname(rs.getString("mname"));
				rv.setRnote(rs.getString("rnote"));
				rv.setRwdate(rs.getString("rwdate"));
				//rv.setRdno(rs.getString("rdno"));
				alist.add(rv);
			}
		}catch (SQLException e)
		{
			e.printStackTrace();
		}finally 
		 {
			try
			{
				conn.close();
			} catch (SQLException e)
			{				
				e.printStackTrace();
			}
		 }
		 
		
		return alist;
	}
	
	public ReplyVo selectOneReply(int rno)
	{
		ReplyVo rv = null;
		ResultSet rs= null;
		sql = "select rno,bno,mno,rnote from reply where rno = ?";
		
		PreparedStatement pstmt;
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				rv = new ReplyVo();
					
				rv.setBno(rs.getString("bno"));
				rv.setRnote(rs.getString("rnote"));
				rv.setRno(rs.getInt("rno"));
			}	
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
	
		return rv;
	}
	
	public int getListTotal(int bno)
	{
		int total = 0;
		ResultSet rs = null;
		
		sql = "select count(*) as count from reply where bno = ?" ;
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				total = rs.getInt("count");
			}
		}catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return total;
	}
	
	public ReplyVo getItem(int index)
	{
		if(this.list == null) return null;
		else return list.get(index);
	}
	
}
