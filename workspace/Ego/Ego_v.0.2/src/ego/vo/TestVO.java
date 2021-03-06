package ego.vo;
import java.util.ArrayList;

import ego.dbms.*;


public class TestVO 
{
	private String no; 				//테스트 번호
	private String uno; 			//작성자 번호
	private String writer; 			//작성자
	private String cno; 			//테스트 카테고리 번호
	private String cname; 			//테스트 카테고리 이름
	private int joincount; 			//테스트 참여수
	private String title; 			//테스트 제목
	private String foldername; 		//테스트 폴더명
	private String[] hashtag; 		//테스트 해시태그
	private String postdate; 		//테스트 게시일
	private String hashtag_forsql = "";
	
	
	
	public String getTestNumber() 	  {return no;			}
	public String getWriterNumber()   {return uno;			}
	public String getWriterName()     {return writer;		}
	public String getCategoryNumber() {return cno;			}
	public String getCategoryName()   {return cname;		}
	public int getJoinCount() 		  {return joincount;	}
	public String getTestTitle() 	  {return title;		}
	public String getFoldername()     {return foldername;	}	
	public String getPostdate() 	  {return postdate;		}
	public String[] getHashtag()      {return hashtag;		}
	
	
	public void setTestNumber(String no) 			{this.no = no;					}
	public void setWriterNumber(String uno)    		{this.uno = uno;				}
	public void setWriterName(String writer)    	{this.writer = writer;			}
	public void setCategoryNumber(String cno) 		{this.cno = cno;				}
	public void setCategoryName(String cname) 		{this.cname = cname;			}
	public void setJoincount(int joincount) 		{this.joincount = joincount;	}
	public void setTestTitle(String title) 			{this.title = title;			}
	public void setFoldername(String foldername) 	{this.foldername = foldername;	}
	public void setPostdate(String postdate) 		{this.postdate = postdate;		}
	
	public void setHashtag(String[] hashtag)
	{
		if(!(hashtag == null || hashtag.length == 0))
		{
			this.hashtag = hashtag;
			
			for(int i=0; i<hashtag.length; i++)
			{
				hashtag_forsql += hashtag[i];
				if(i != hashtag.length-1)
				{
					hashtag_forsql += ",";
				}
			}
		}
	}
	
	public ArrayList<HashtagVO> makeHashteg()
	{
		ArrayList<HashtagVO> list = null;
		
		if(!(hashtag_forsql == null || hashtag_forsql.equals("")))
		{
			list = new ArrayList<HashtagVO>();
			
			String[] str_list = hashtag_forsql.split(",");
			for(int i=0; i<str_list.length;i++)
			{
				HashtagVO hash = new HashtagVO();
				hash.setHash(str_list[i]);
				list.add(hash);
			}
		}
		return list;
	}
	
	public void setHashtag_forsql(String hashtag_forsql) {this.hashtag_forsql = hashtag_forsql;}
	
	
	public void PrintInfo()
	{
		System.out.println( "========================================");
		System.out.println( "테스트번호 no : " + getTestNumber() );
		System.out.println( "테스트 카테고리 번호 : " + getCategoryNumber() );
		System.out.println( "테스트 카테고리 이름 : " + getCategoryName() );
		System.out.println( "테스트 참여수 joincount : " + getJoinCount() );
		System.out.println( "테스트 제목 title : " + getTestTitle() );
		System.out.println( "테스트 폴더명 foldername : " + getFoldername() );
		//System.out.println( "테스트 해시태그 hashtag: " + getHashtag_forsql() );
		//System.out.println( "테스트 게시일 postdate : " + getPostdate() );
		System.out.println( "========================================");
	}
	
	
	/****************************해시태그***********************************/
	
	
	//한가지 테스트에 대한 해시테그를 열람
	String[] hashtag_for_ary;
	public void PrintHashInfo()
	{
		hashtag_for_ary = getHashtag();
		System.out.println("===해시태그 목록===");
		for(int i=0; i < hashtag_for_ary.length; i++)
		{
			System.out.println(hashtag_for_ary[i]);
		}
	}
	
	
	/******vo에 집어넣은 값 sql insert위해 배열을 String으로 만들기********/
	/***콤마(,)단위로 끊어져 String으로 만들어짐*************************/
	public String getHashtag_forsql() {
		return hashtag_forsql;
	}
	
	
	
	
	
	
	
	
	public static void main(String[] args) 
	{
		//***************해시태그 세팅*****************//
		//*********해시태그가 미리 세팅되어 있고 수정불가 하다면 해시태그VO에서 해시값
		//작성하고 아래와같이 세팅하지 않아도 된다*************************//
		//HashtagVO key = new HashtagVO();
		//key.setHash(0, "역사");
		//key.setHash(1, "정치");
		//String val = key.getHash(0);
		//String val2 = key.getHash(1);
		//key.HashInfo();

		
		
		
		/************테스트에 해시태그 넣기 순서****************************/
		/*
		//(1)해시태그 목록을 조회한다
		HashtagVO key = new HashtagVO();
		key.HashInfo();
		
		//(2)값을 넣는다
		TestVO test1 = new TestVO();
		test1.setTestTitle("테스트 제목1입니다");
		test1.setHashtag("추리","일상","건강","미래","랜덤"); //배열 값이 들어갔다
		
		//(3)넣어진 테스트 값 목록을 조회한다
		test1.PrintHashInfo();
		
		//(4)배열 값을 string으로 만든다
		String test1_sql;
		test1_sql = test1.getHashtag_forsql();
		System.out.println("test1_sql = " + test1_sql);
		*/
		/***************[DTO]*******************/
		/*
		//(5)sql 구문에 insert한다
		DBManager dbms = new DBManager();
		dbms.DBOpen();
		String sql = "";
		sql += "INSERT INTO test (t_hashtag) ";
		sql += "VALUES ('"+ test1_sql +"')";
		dbms.RunSQL(sql);
		
		//(6)테스트 해시태그 값을 얻는다
		//sql select 구문을 실행한다
		sql = "SELECT t_hashtag ";
		sql += "FROM test";
		dbms.OpenQuery(sql);
		String test1_hashtag_sql = "";
		//select 값을 얻는다
		while( dbms.GetNext() == true)
		{
			test1_hashtag_sql = dbms.GetValue("t_hashtag");
		}	
		dbms.CloseQuery();
		
		//select에서 얻은 값에서 , 기준으로 split을 한다
		String[] test1_get_hash = test1_hashtag_sql.split(",");
		for(int i = 0; i<test1_get_hash.length; i++)
		{
			System.out.println(
			test1.getTestTitle() + i + "번째 해시태그는 : " +  test1_get_hash[i]);
		}
		*/
	}

}
