package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.protocol.Resultset;

import dbconn.DBConn;
import model.SearchVo;
import model.BoardVo;

public class BoardDao 
{
	Connection conn;
	DBConn db;
	int exec = 0;
	String sql;
	private SearchVo search = null;
	private String where = "";
	
	public BoardDao() 
	{		
		db = new DBConn();
		conn = db.getConnection();		
	} 
	
	public BoardDao(SearchVo search)
	{
		this.search = search;

		//where = "bkind ='"+ search.getKind()+ "' ";
		if(search.getKeyword().equals("") != true)
		{
			where += " btitle like '%"+ search.getKeyword() + "%' ";
		}		
	}
	
	public int insertBoard(BoardVo bv)
	{
		sql = "insert into board(mno, btitle, bkind, bnote) ";
		sql += "values(?, ?, ?, ?)";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bv.getMno());
			pstmt.setString(2, bv.getBtopic()+"@@"+bv.getBtitle().replace("\n", "<br>").replace("<", "&lt;").replace(">", "&gt;"));
			pstmt.setString(3, bv.getBkind());
			pstmt.setString(4, bv.getBnote().replace("\n", "<br>").replace("<", "&lt;").replace(">", "&gt;"));
		 
			exec = pstmt.executeUpdate();
			
			sql = "select last_insert_id() as no ";
			pstmt.executeQuery();
			
			pstmt.close();
			
		 }catch(Exception e)
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
	
	public int updateBoard(BoardVo bv)
	{
		sql  = "update board ";
		sql += "set btitle = ?, ";
		sql += "bkind = ?, ";
		sql += "bnote = ? ";
		sql += "where bno = ?";
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bv.getBtopic()+"@@"+bv.getBtitle().replace("\n", "<br>").replace("<", "&lt;").replace(">", "&gt;"));
			pstmt.setString(2, bv.getBkind());
			pstmt.setString(3, bv.getBnote().replace("\n", "<br>").replace("<", "&lt;").replace(">", "&gt;"));
			pstmt.setInt(4, bv.getBno());
			
			exec = pstmt.executeUpdate();
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}
		return exec;
	}
	
	public int deleteBoard(int bno)
	{
		sql  = "delete from board ";
		sql += "where bno = ? ";
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			exec = pstmt.executeUpdate();
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}
		return exec;
	}
	
	public ArrayList<BoardVo> selectAllBoard(int startno, String bkind, String key)
	{
		System.out.println("페이지D:" + startno);
		System.out.println("구분D :" + bkind);
		System.out.println("검색값 D:" +key);
		
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		
		sql = "select bno,btitle,bnote,bkind,date(bwdate) as bwdate,bhit, ";
	    sql += "(select mname from member where mno = board.mno) as mname from board ";
	    
	    
	    if(!bkind.equals("A") )
    	{
    		sql += "where bkind = ? ";
    		sql += "and btitle like ? ";
    	}else
    	{
    		sql += "where btitle like ? ";
    	}
	   
	     
	    sql += "order by bno desc ";
		sql += "limit ?, 10";
		
	    PreparedStatement pstmt=null;
		ResultSet rs= null;
		try 
		{
			pstmt = conn.prepareStatement(sql);
			
			
			if(!bkind.equals("A"))
	    	{
				pstmt.setString(1, bkind);
				pstmt.setString(2, "%" + key + "%");
				pstmt.setInt(3, startno);
	    	}else
	    	{
	    		pstmt.setString(1, "%" + key + "%");
	    		pstmt.setInt(2, startno);
	    	}
			
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				BoardVo bv = new BoardVo();				
				bv.setBno(rs.getInt("bno"));
				bv.setBtitle(rs.getString("btitle"));
				bv.setBnote(rs.getString("bnote"));
				bv.setMname(rs.getString("mname"));
				bv.setBkind(rs.getString("bkind"));
				bv.setBwdate(rs.getString("bwdate"));
				bv.setBhit(rs.getString("bhit"));
				alist.add(bv);			
			}						
		} catch (SQLException e) 
		{		
			e.printStackTrace();
		}		
		return  alist; 
	}	
	
	public BoardVo selectOneBoard(int bno)
	{
		BoardVo bv = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		sql  = "select bno,mno,btitle,bkind,bnote,bwdate,bhit, ";
		sql += "(select mname from member where mno = board.mno) as mname ";
		sql += "from board ";
		sql += "where bno = ? ";
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				bv = new BoardVo();
				
				bv.setBno(rs.getInt("bno"));
				bv.setMname(rs.getString("mname"));
				bv.setBtitle(rs.getString("btitle").replace("&lt;", "<").replace("&gt;", ">").replace("<br>", "\n"));
				bv.setBkind(rs.getString("bkind"));
				bv.setBnote(rs.getString("bnote").replace("&lt;", "<").replace("&gt;", ">").replace("<br>", "\n"));
				bv.setBwdate(rs.getString("bwdate"));
				bv.setBhit(rs.getString("bhit"));
			}
			
		}catch (SQLException e)
		{		
			e.printStackTrace();
		}		
		return bv;
	}
	 
	public int hitUp(int bno) 
	{
		int exec = 0;
		PreparedStatement pstmt = null;
		
		String sql = "update board set bhit = bhit + 1 where bno = ? ";
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			exec = pstmt.executeUpdate();
		} catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		return exec;
	}
	
	public int boardTotal(String bkind)
	{
		int total = 0;
		ResultSet rs = null;
		sql = "select count(*) as count from board ";
		
		if(!bkind.equals("A"))
		{
			sql += "where bkind = ?";
		}
		System.out.println("total123 :");
		
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			
			if(!bkind.equals("A"))
			{
				pstmt.setString(1, bkind);
			}
			
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
	
}
