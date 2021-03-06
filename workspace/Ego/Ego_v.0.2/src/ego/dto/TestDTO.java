package ego.dto;

import java.io.File;
import java.util.ArrayList;
import org.zeroturnaround.zip.ZipUtil;
import ego.dbms.*;
import ego.vo.TestVO;

public class TestDTO extends DBManager
{
	String uploadPath = "C:\\hje\\수업자료\\30_팀프로젝트\\05.통합구현\\Ego\\Ego_v.0.2\\WebContent\\testlist\\";
	String test_for_sql;
	/************[필수]테스트 등록 이전 해시태그 먼저 등록*****************/
	public String make_testHashtag_forsql(TestVO vo,String...value)
	{
		vo.setHashtag(value);
		vo.PrintHashInfo();
		test_for_sql = vo.getHashtag_forsql();
		System.out.println("테스트에 넣어진 해시태그 sql : " 
		+ test_for_sql);
		return test_for_sql;
	}
	
	
	/******************테스트를 등록한다******************************/
	public boolean testInsert(TestVO vo, String file)
	{
		System.out.println("디비연결 확인");
		if(DBOpen() == false) return false;
		System.out.println("디비연결 완료");
		
		System.out.println("sql문 작성");
		String sql  = "";
		sql += "insert into test (u_no,cg_no,t_title,t_foldername,t_hashtag) ";
		sql += "values (";
		sql += "'" + vo.getWriterNumber() + "',";
		sql += "'" + vo.getCategoryNumber() + "',";
		sql += "'" + vo.getTestTitle() + "',";
		sql += "'" + vo.getFoldername() + "',";		
		sql += "'" + vo.getHashtag_forsql() + "')";
		System.out.println("sql문 작성 완료");
		System.out.println(sql);
		System.out.println("sql문 실행");
		RunSQL(sql);
		System.out.println("sql문 실행 완료");
		
		ZipUtil.unpack(new File(file), new File(uploadPath+vo.getFoldername()));
		return true;
	}
	
	/******************테스트 제목,폴더명을 업데이트 한다******************************/
	public boolean testUpdate(TestVO vo, String file)
	{
		//브라우저에서 넣을 input 값 변수명
		System.out.println("디비연결 확인");
		if ( DBOpen() == false ) {return false;}
		System.out.println("디비연결 완료");

		System.out.println("sql문 작성");
		String sql = "";
		sql += "UPDATE test ";
		sql += "SET t_title = '" + vo.getTestTitle().replace("'", "") + "',";
		sql += "t_hashtag = '" + vo.getHashtag_forsql() + "' ";
		if(!(file == null || file.equals("")))
		{
			sql += "t_foldername = '" + vo.getFoldername() + "' ";
		}
		sql += "WHERE t_no = " + vo.getTestNumber();
		System.out.println("sql문 작성 완료");
		System.out.println(sql);

		System.out.println("sql문 실행");
		RunSQL(sql);
		System.out.println("sql문 실행 완료");
		return true;
	}
	
	
	/******************테스트를 등록한다******************************/
	/*
	public boolean testInsert(TestVO vo, String hashtag_sql)
	{
		if(DBOpen() == false) return false;
		String sql  = "";
		sql += "insert into test (t_title,t_foldername,t_hashtag) ";
		sql += "values (";
		sql += "'" + vo.getTestTitle().replace("'","") + "',";
		sql += "'" + vo.getFoldername() + "',";		
		sql += "'" + hashtag_sql + "')";
		RunSQL(sql);
		return true;
	}
	*/
	
	/******************테스트를 삭제한다******************************/
	public void testDelete(TestVO vo)
	{
		if(DBOpen() == true) 
		{
			String sql  = "";
			sql += "DELETE FROM test WHERE t_no = " + vo.getTestNumber();
			RunSQL(sql);
		}
	}
	
	/******************테스트 제목,폴더명을 업데이트 한다******************************/
	/*
	public boolean testUpdate(TestVO vo, String hashtag_sql)
	{
		//브라우저에서 넣을 input 값 변수명
		if ( DBOpen() == false ) {return false;}
		String sql = "";
		sql += "UPDATE test ";
		sql += "SET t_title = '" + vo.getTestTitle().replace("'", "") + "',";
		sql += "t_hashtag = '" + hashtag_sql + "', ";
		sql += "t_foldername = '" + vo.getFoldername() + "' ";
		sql += "WHERE t_no = " + vo.getTestNumber();
		RunSQL(sql);
		return true;
	}
	*/
	
	/******test를 목록을 최신순으로 보여준다(테스트 제목, 참여수, 폴더명)*********************/
	public boolean selectTestIndex(TestVO vo)
	{
		if( DBOpen() == false) {return false;}
		String sql = "";
		sql += "SELECT t_title,t_rjoincount,t_foldername ";
		sql += "FROM test ";
		sql += "order by t_no desc";
		OpenQuery(sql);
		if (this.GetNext() == false)
		{
			this.CloseQuery();
			this.DBClose();	
		}
		
		return true;
	}
	
	/******test목록 최신순 출력*********************/
	public ArrayList<TestVO> testRead()
	{
		return testRead("");
		
	}
	
	/******test목록 최신순 limit 출력*********************/
	public ArrayList<TestVO> testRead(String limit)
	{
		return testRead(limit,"");
	}
	
	/******test목록 최신순 검색어 출력*********************/
	public ArrayList<TestVO> testRead(String limit, String cate)
	{
		return testRead(limit,cate,"");
	}
	
	/******test목록 최신순 검색어 출력*********************/
	public ArrayList<TestVO> testRead(String limit, String cate,String key)
	{
		return testRead(limit,"0",cate,key);
	}
	
	/******test목록 최신순 검색어 출력*********************/
	public ArrayList<TestVO> testRead(String limit,String limit_start, String cate,String key)
	{
		ArrayList<TestVO> vos = null;
		String sql = "";
		
		sql += "SELECT t_no, u_no, t.cg_no, t_title, t_rjoincount, t_foldername, t_hashtag, t_postdate, ";
		sql += "(SELECT u_nickname from user where u_no = t.u_no) as writer, ";
		sql += "c.cg_name ";
		sql += "FROM test as t ";
		sql += "inner join category as c ";
		sql += "on t.cg_no = c.cg_no ";
		if(!cate.equals("")) sql += "where  t.cg_no = '" + cate + "' ";
		if(!key.equals("")) sql += "and  t_title like '%" + key + "%' ";
		sql += "order by t_no desc ";
		if(!limit.equals("")) sql += "limit " + limit_start + "," + limit;
		
		if( DBOpen() == false) return vos;
		if (!OpenQuery(sql))
		{
			CloseQuery();
			DBClose();
			return vos;
		}
		
		vos = new ArrayList<TestVO>();
		while (GetNext())
		{
			TestVO vo = new TestVO();
			vo.setTestNumber(GetValue("t_no"));
			vo.setWriterName(GetValue("writer"));
			vo.setCategoryNumber(GetValue("cg_no"));
			vo.setCategoryName(GetValue("cg_name"));
			vo.setTestTitle(GetValue("t_title"));
			vo.setJoincount(GetInt("t_rjoincount"));
			vo.setFoldername(GetValue("t_foldername"));
			vo.setHashtag_forsql("");
			vo.setPostdate(GetValue("t_postdate"));
			
			vos.add(vo);
			vo.PrintInfo();
		}
		
		CloseQuery();
		DBClose();	
		return vos;
	}
	
	/******test목록 최신순 검색어 출력*********************/
	public ArrayList<TestVO> testReadTop(String no)
	{
		return testRead(no);
	}
	
	/****test시작-결과 화면을 조회한다 (테스트 제목, 참여수, 폴더명, 해시태그, 게시일 )********/
	public TestVO selectTestView(String no)
	{
		TestVO vo = null;
		
		if( DBOpen() == false) {return vo;}
		String sql = "";
		sql += "SELECT t_no, u_no, t.cg_no, t_title, t_rjoincount, t_foldername, t_hashtag, t_postdate, ";
		sql += "(SELECT u_nickname from user where u_no = t.u_no) as writer, ";
		sql += "c.cg_name ";
		sql += "FROM test as t ";
		sql += "inner join category as c ";
		sql += "on t.cg_no = c.cg_no ";
		sql += "WHERE t_no = " + no;
		
		OpenQuery(sql);
		if (this.GetNext() == false)
		{
			this.CloseQuery();
			this.DBClose();	
		}

		vo = new TestVO();
		vo.setTestNumber(GetValue("t_no"));
		vo.setCategoryNumber(GetValue("cg_no"));
		vo.setCategoryName(GetValue("cg_name"));
		vo.setTestTitle(GetValue("t_title"));
		vo.setJoincount(GetInt("t_rjoincount"));
		vo.setFoldername(GetValue("t_foldername"));
		vo.setHashtag_forsql(GetValue("t_hashtag"));
		vo.setPostdate(GetValue("t_postdate"));
		
		return vo;
	}
	
	/*******************테스트의 해시태그를 조회한다***********************/
	public void testHashtagView(TestVO vo)
	{
		DBOpen();
		String sql = "";
		sql += "SELECT t_hashtag ";
		sql += "FROM test ";
		sql += "WHERE t_no = " + vo.getTestNumber();
		OpenQuery(sql);
		String test1_hashtag_sql = "";
		//select 값을 얻는다
		while( GetNext() == true)
		{
			test1_hashtag_sql = GetValue("t_hashtag");
		}	
		CloseQuery();
		
		//select에서 얻은 값에서 , 기준으로 split을 한다
		String[] test1_get_hash = test1_hashtag_sql.split(",");
		for(int i = 0; i<test1_get_hash.length; i++)
		{
			System.out.println(
			i + "번째 해시태그는 : " +  test1_get_hash[i]);
		}
		
	}
	
	/*******************테스트의 해시태그 값을 얻는다***********************/
	public String getTestOneHashtag(TestVO vo,int value)
	{
		DBOpen();
		String sql = "";
		sql += "SELECT t_hashtag ";
		sql += "FROM test ";
		sql += "WHERE t_no = " + vo.getTestNumber();
		OpenQuery(sql);
		String test1_hashtag_sql = "";
		//select 값을 얻는다
		while( GetNext() == true)
		{
			test1_hashtag_sql = GetValue("t_hashtag");
		}	
		CloseQuery();
		
		//select에서 얻은 값에서 , 기준으로 split을 한다
		String[] test1_get_hash = test1_hashtag_sql.split(",");
		return test1_get_hash[value];
	}
	
	
	
	/********************테스트 조회수를 증가시킨다***********************/
	public boolean upJoinCount(String no)
	{
		if( DBOpen() == false) {return false;}
		String sql = "";
		
		sql = "UPDATE test ";
		sql += "SET t_rjoincount = t_rjoincount + 1 ";
		sql += "WHERE t_no = " + no;
		RunSQL(sql);
		return true;
	}
	
	public static void main(String[] args) 
	{
		/***********데이터베이스 연결 종료는 tail에서*************/
	}

}
