package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConn;



public class MemberDao 
{
	public final static int ID_ERROR      = 0;
	public final static int DUPLICATE     = 1;
	public final static int NOT_DUPLICATE = 2;
	
	Connection conn;
	DBConn db;
	
	public MemberDao()
	{					
		db = new DBConn();
		conn = db.getConnection();
	}
	
	//회원 정보 중복 검사
	//리턴값 : ERROR - 오류, DUPLICATE - 중복, NOT_DUPLICATE - 중복아님 
	public int IsDuplicate(String mid)
	{
        PreparedStatement pstmt = null; 
        ResultSet rs = null;
		
		String sql = "";
		sql  = "select mid ";
		sql += "from member ";
		sql += "where mid = ?";
		
		try 
		{
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, mid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next() == true)
			{
				/*
				conn.close();
				*/
				return DUPLICATE;
			}
					
		} catch (SQLException e) 
		{
	
			e.printStackTrace();
		}
		return NOT_DUPLICATE;	
	}
	
	public int IsDuplicate1(String memail)
	{
		PreparedStatement pstmt = null; 
        ResultSet rs = null;
		
		String sql = "";
		sql  = "select memail ";
		sql += "from member ";
		sql += "where memail = ?";
		
		try 
		{
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, memail);
			
			rs = pstmt.executeQuery();
			
			if(rs.next() == true)
			{
				/*
				conn.close();
				*/
				return DUPLICATE;
			}
					
		} catch (SQLException e) 
		{
	
			e.printStackTrace();
			return NOT_DUPLICATE;
		}
		
		return NOT_DUPLICATE;	
	}
	
	public int IsDuplicate2(String mpnum)
	{
		PreparedStatement pstmt = null; 
        ResultSet rs = null;
		
		String sql = "";
		sql  = "select mpnum ";
		sql += "from member ";
		sql += "where mpnum = ?";
		
		try 
		{
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, mpnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next() == true)
			{
				/*
				conn.close();
				*/
				return DUPLICATE;
			}
					
		} catch (SQLException e) 
		{
	
			e.printStackTrace();
		}
		
		return NOT_DUPLICATE;	
	}
	
	
	public int insertMember(MemberVo mv) 
	{
		int exec = 0;
		
		String sql = "insert into member(mid, mpw, mname, memail, mpnum, memailcheck) ";
		sql += "values (?, md5(?), ?, ?, ?,false)" ;
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mv.getMid());
			pstmt.setString(2, mv.getMpw());
			pstmt.setString(3, mv.getMname());
			pstmt.setString(4, mv.getMemail());
			pstmt.setString(5, mv.getMpnum());
			
			exec = pstmt.executeUpdate();
		} catch (SQLException e) 
		{	
			e.printStackTrace();
		}
		finally
		{
			/*
			try 
			{
				conn.close();
			} catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
			*/
		}
		return exec;
	}
	
	 public String getUserEmail(String mid)
	 {
         String SQL = "SELECT memail FROM member WHERE mid = ?";    
         String memail = null;
           PreparedStatement pstmt = null; //특정한 SQL 문장을 수행 하도록 하는 class
           ResultSet rs = null; // 특정한 SQL 문장을 수행한 이후에 나온 결과값에 대해 처리하고자 할 때 사용하는 class
           try
           {          
               pstmt = conn.prepareStatement(SQL); //conn 객체에서 prepareStatement를 실행하도록 준비
               pstmt.setString(1, mid);
               rs = pstmt.executeQuery();
               if(rs.next()) 
               {
            	   memail = rs.getString("memail");
               }
           } catch (Exception e)
           {
                e.printStackTrace();
           }
           return memail; // 데이터베이스 오류
     }
    
	
	public String getMemberEmailChecked(String mid) 
	{
		String mailCheck = null;
		//사용자 이메일 검증, 검증 없이 사용하지 못하게 할것이기 때문에 이 함수가 필요
        String SQL = "select memailcheck from member where mid = ?";    
    
        PreparedStatement pstmt = null; 
        ResultSet rs = null; 
        try 
        {          
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
            if(rs.next())
            {
            	mailCheck = rs.getString("memailcheck");
            }
        }catch (Exception e) 
        {
             e.printStackTrace();
        }
       return mailCheck;
	}
  
	public MemberVo setUserEmailChecked(String mid) 
	{ 
		//이메일 인증을 완료해주는 함수
		String SQL = "update member set memailcheck = true where mid = ?";    
	    PreparedStatement pstmt = null;
	    ResultSet rs = null; 
		
	    MemberVo mv = null;
	    
	    try 
	    {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			pstmt.close();
			
			SQL = "select mpw where mid = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, mid);
            rs = pstmt.executeQuery();
            if (rs.next()) 
			{
				mv = new MemberVo();
				
				mv.setMno(rs.getInt("mno"));
				mv.setMid(rs.getString("mid"));
				mv.setMpw(rs.getString("mpw"));
				mv.setMname(rs.getString("mname"));
				mv.setMemail(rs.getString("memail"));
				mv.setMemail(rs.getString("memailcheck"));
				mv.setMpnum(rs.getString("mpnum"));
				mv.setMjdate(rs.getString("mjdate"));
				mv.setMretire(rs.getString("mretire"));
				mv.setMrdate(rs.getString("mrdate"));
				mv.setMhost(rs.getString("mhost"));
				
			}	
            
		       
		} catch (SQLException e) 
	    {
			e.printStackTrace();
		} 
	    return mv;
	}       

	
	//회원 리스트 가져오기
	public ArrayList<MemberVo> selectAllMember()
	{
		ArrayList<MemberVo> alist = new ArrayList<MemberVo>();
		
		String sql ="select * from member order by mno desc";
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			
			while(rs.next())
			{
				MemberVo mv = new MemberVo();
	
				mv.setMno(rs.getInt("mno"));
				mv.setMid(rs.getString("mid"));
				mv.setMname(rs.getString("mname"));
				mv.setMemail(rs.getString("memail"));
				mv.setMemailchack(rs.getString("memailcheck"));
				mv.setMpnum(rs.getString("mpnum"));
				mv.setMjdate(rs.getString("mjdate"));
				mv.setMretire(rs.getString("mretire"));
				mv.setMrdate(rs.getString("mrdate"));
				mv.setMhost(rs.getString("mhost"));
				
				alist.add(mv);	
			}	
		} catch (SQLException e) 
		{

			e.printStackTrace();
		}
			
		return alist;
	}
	
	//회원 정보 하나 가져오기
	public MemberVo selectOneMember(int mno)
	{
		
		MemberVo mv = null;
		String sql="select * from member where mno = ?";
		PreparedStatement pstmt= null;
		ResultSet rs= null;
	
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			rs = pstmt.executeQuery();
		
			if(rs.next())
			{
				mv = new MemberVo();
				
				mv.setMno(rs.getInt("mno"));
				mv.setMid(rs.getString("mid"));
				mv.setMpw(rs.getString("mpw"));
				mv.setMemail(rs.getString("memail"));
				mv.setMemailchack(rs.getString("memailcheck"));
				mv.setMname(rs.getString("mname"));
				mv.setMpnum(rs.getString("mpnum"));
				mv.setMjdate(rs.getString("mjdate"));
				mv.setMretire(rs.getString("mretire"));
				mv.setMrdate(rs.getString("mrdate"));
				mv.setMhost(rs.getString("mhost"));
			}
		}catch(SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return mv;
	}
	
	public MemberVo loginMember(String mid, String mpw) 
	{
		MemberVo mv = null;
		ResultSet rs = null;
		String sql="select * from member where mid=? and mpw=md5(?) and memailcheck = 1";
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			rs  = pstmt.executeQuery();
			
			if (rs.next()) 
			{
				mv = new MemberVo();
				
				mv.setMno(rs.getInt("mno"));
				mv.setMid(rs.getString("mid"));
				mv.setMpw(rs.getString("mpw"));
				mv.setMname(rs.getString("mname"));
				mv.setMemail(rs.getString("memail"));
				mv.setMemail(rs.getString("memailcheck"));
				mv.setMpnum(rs.getString("mpnum"));
				mv.setMjdate(rs.getString("mjdate"));
				mv.setMretire(rs.getString("mretire"));
				mv.setMrdate(rs.getString("mrdate"));
				mv.setMhost(rs.getString("mhost"));
				
			}			
		} catch (SQLException e) 
		{			
			e.printStackTrace();
		} finally
		{
		}
		
		return mv;
	}
	
	public int modiInfo(MemberVo mv)
	{	
		int exec = 0;
		
		String sql = "";
	
		sql  = "update member ";
		sql += "set mpnum = ? ";
		if(!(mv.getMpw() == null || mv.getMpw().equals(""))) sql += ", mpw = md5(?) ";
		sql += "where mno = ?";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mv.getMpnum());
			if(mv.getMpw() != null)	{
				pstmt.setString(2, mv.getMpw());
				pstmt.setInt(3, mv.getMno());
			} else {
				pstmt.setInt(2, mv.getMno());
			}
			
			exec = pstmt.executeUpdate();
		
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return exec;
	}	
	
//	public MemberVo modiPassword(MemberVo mv)
//	{	
//		String sql = "";
//	
//		sql  = "update member ";
//		sql += "set mpw = md5(?) ";
//		sql += "where mno = ?";
//		
//		try
//		{
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, mv.getMpw());
//			pstmt.setInt(2, mv.getMno());
//			
//			pstmt.executeUpdate();
//		
//		} catch (SQLException e) 
//		{
//			e.printStackTrace();
//		}
//		return mv;
//	}	
	
	public int retireMember(int mno)
	{
		int exec = 0;
		
		String sql = "";
		
		sql  = "update member set ";
		sql += "mid= Null, mpw=Null, mname=Null, mpnum=Null, mretire='Y', mrdate=sysdate() ";
		sql += "where mno = ?";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
	
			pstmt.setInt(1, mno);
			
			exec = pstmt.executeUpdate();
		
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return exec;
	}
}
