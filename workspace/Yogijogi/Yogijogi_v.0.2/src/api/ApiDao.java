package api;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConn;



public class ApiDao 
{
	public final static int ID_ERROR      = 0;
	public final static int DUPLICATE     = 1;
	public final static int NOT_DUPLICATE = 2;
	
	Connection conn;
	DBConn db;
	
	public ApiDao()
	{					
		db = new DBConn();
		conn = db.getConnection();
	}
	
	//문화 등록하기
	public int insertApi(ApiVo av) 
	{
		int exec = 0;
		
		String sql = "insert into culture(cadmfee,cage,ccontent,cETime,cendDay,chostName,cmngTel,corgNm,cplace,cstartDay,csubject,curl,ckind) ";
		sql += "values (?,?,?,?,?,?,?,?,?,?,?,?,?)" ;
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, av.getAdmfee());
			pstmt.setString(2, av.getAge());
			pstmt.setString(3, av.getContent());
			pstmt.setString(4, av.getETime());
			pstmt.setString(5, av.getEndDay());
			pstmt.setString(6, av.getHostName());
			pstmt.setString(7, av.getMngTel());
			pstmt.setString(8, av.getOrgNm());
			pstmt.setString(9, av.getPlace());
			pstmt.setString(10, av.getStartDay());
			pstmt.setString(11, av.getSubject());
			pstmt.setString(12, av.getUrl());
			pstmt.setString(13, av.getAkind());
			pstmt.setString(14, av.getLatitude());
			pstmt.setString(15, av.getLongitude());

			exec = pstmt.executeUpdate();
		} catch (SQLException e) 
		{	
			e.printStackTrace();
		}
		finally
		{
		}
		return exec;
	}

	//문화 내용 가져오기
	public ArrayList<ApiVo> selectAllApi()
	{
		return selectAllApi("S");
	}

	//문화 내용 가져오기
	public ArrayList<ApiVo> selectAllApi(String ckind)
	{
		return selectAllApi(ckind, 0);
	}
	
	public ArrayList<ApiVo> selectAllApi(String ckind, int start)
	{
		return selectAllApi(ckind, start, 8);
	}

	//문화 내용 가져오기
	public ArrayList<ApiVo> selectAllApi(String ckind, int start, int limit)
	{
		return selectAllApi(ckind, start, limit, "");
	}

	//문화 내용 가져오기
	public ArrayList<ApiVo> selectAllApi(String ckind, int start, int limit, String key)
	{
		ArrayList<ApiVo> alist = new ArrayList<ApiVo>();
		
		String sql ="select * from culture where ckind = ? and csubject like ? order by cno asc limit ?, ?";
		
		try 
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ckind);
			pstmt.setString(2, '%'+key+'%');
			pstmt.setInt(3, start);
			pstmt.setInt(4, limit);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(pstmt);
			
			while(rs.next())
			{
				ApiVo av = new ApiVo();
				
				av.setAno(rs.getString("cno"));
				av.setAkind(rs.getString("ckind"));
				av.setAdmfee(rs.getString("cadmfee"));
				av.setAge(rs.getString("cage"));
				av.setContent(rs.getString("ccontent"));
				av.setETime(rs.getString("cETime"));
				av.setEndDay(rs.getString("cendDay"));
				av.setHostName(rs.getString("chostName"));
				av.setMngTel(rs.getString("cmngTel"));
				av.setOrgNm(rs.getString("corgNm"));
				av.setPlace(rs.getString("cplace"));
				av.setStartDay(rs.getString("cstartDay"));
				av.setSubject(rs.getString("csubject"));
				av.setUrl(rs.getString("curl"));
				av.setAkind(rs.getString("ckind"));
				av.setLatitude(rs.getString("latitude"));
				av.setLongitude(rs.getString("longitude"));
				
				alist.add(av);	
			}	
		} catch (SQLException e) 
		{

			e.printStackTrace();
		}
			
		return alist;
	}
	
	//해당 문화 내용 가져오기
	public ApiVo selectOneApi(String ckind, String cno)
	{
		
		ApiVo av = null;
		String sql="select * from culture where cno = ? and ckind = ?";
		PreparedStatement pstmt= null;
		ResultSet rs= null;
	
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cno);
			pstmt.setString(2, ckind);
			rs = pstmt.executeQuery();
		
			if(rs.next())
			{
				av = new ApiVo();

				av.setAno(rs.getString("cno"));
				av.setAkind(rs.getString("ckind"));
				av.setAdmfee(rs.getString("cadmfee"));
				av.setAge(rs.getString("cage"));
				av.setContent(rs.getString("ccontent"));
				av.setETime(rs.getString("cETime"));
				av.setEndDay(rs.getString("cendDay"));
				av.setHostName(rs.getString("chostName"));
				av.setMngTel(rs.getString("cmngTel"));
				av.setOrgNm(rs.getString("corgNm"));
				av.setPlace(rs.getString("cplace"));
				av.setStartDay(rs.getString("cstartDay"));
				av.setSubject(rs.getString("csubject"));
				av.setUrl(rs.getString("curl"));
				av.setLatitude(rs.getString("latitude"));
				av.setLongitude(rs.getString("longitude"));
			}
		}catch(SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return av;
	}
	
	//마지막 문화 내용 가져오기
	public ApiVo selectLastOneApi(String kind)
	{
		
		ApiVo av = null;
		String sql="select * from culture where ckind = ? limit 1";
		PreparedStatement pstmt= null;
		ResultSet rs= null;
	
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kind);
			rs = pstmt.executeQuery();
		
			if(rs.next())
			{
				av = new ApiVo();

				av.setAno(rs.getString("cno"));
				av.setAkind(rs.getString("ckind"));
				av.setAdmfee(rs.getString("cadmfee"));
				av.setAge(rs.getString("cage"));
				av.setContent(rs.getString("ccontent"));
				av.setETime(rs.getString("cETime"));
				av.setEndDay(rs.getString("cendDay"));
				av.setHostName(rs.getString("chostName"));
				av.setMngTel(rs.getString("cmngTel"));
				av.setOrgNm(rs.getString("corgNm"));
				av.setPlace(rs.getString("cplace"));
				av.setStartDay(rs.getString("cstartDay"));
				av.setSubject(rs.getString("csubject"));
				av.setUrl(rs.getString("curl"));
				av.setAkind(rs.getString("ckind"));
				av.setLatitude(rs.getString("latitude"));
				av.setLongitude(rs.getString("longitude"));
			}
		}catch(SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return av;
	}
	
	//추천 내용 가져오기
	public ArrayList<ApiVo> selectBestApi(String key)
	{
		ArrayList<ApiVo> alist = new ArrayList<ApiVo>();
		ApiVo av = null;
		
		String sql="select * from culture where csubject like ? order by cno asc limit 0, 5";
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%'+key+'%');
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
			
			while(rs.next())
			{
				av = new ApiVo();
				
				av.setAno(rs.getString("cno"));
				av.setAkind(rs.getString("ckind"));
				av.setAdmfee(rs.getString("cadmfee"));
				av.setAge(rs.getString("cage"));
				av.setContent(rs.getString("ccontent"));
				av.setETime(rs.getString("cETime"));
				av.setEndDay(rs.getString("cendDay"));
				av.setHostName(rs.getString("chostName"));
				av.setMngTel(rs.getString("cmngTel"));
				av.setOrgNm(rs.getString("corgNm"));
				av.setPlace(rs.getString("cplace"));
				av.setStartDay(rs.getString("cstartDay"));
				av.setSubject(rs.getString("csubject"));
				av.setUrl(rs.getString("curl"));
				av.setAkind(rs.getString("ckind"));
				av.setLatitude(rs.getString("latitude"));
				av.setLongitude(rs.getString("longitude"));
				
				alist.add(av);
				System.out.println("add!!");
			}
		}catch(SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return alist;
	}
}
