package ego.vo;
import java.util.ArrayList;

import ego.dbms.*;


public class TestVO 
{
	private String no; 				//�׽�Ʈ ��ȣ
	private String uno; 			//�ۼ��� ��ȣ
	private String writer; 			//�ۼ���
	private String cno; 			//�׽�Ʈ ī�װ��� ��ȣ
	private String cname; 			//�׽�Ʈ ī�װ��� �̸�
	private int joincount; 			//�׽�Ʈ ������
	private String title; 			//�׽�Ʈ ����
	private String foldername; 		//�׽�Ʈ ������
	private String[] hashtag; 		//�׽�Ʈ �ؽ��±�
	private String postdate; 		//�׽�Ʈ �Խ���
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
		System.out.println( "�׽�Ʈ��ȣ no : " + getTestNumber() );
		System.out.println( "�׽�Ʈ ī�װ��� ��ȣ : " + getCategoryNumber() );
		System.out.println( "�׽�Ʈ ī�װ��� �̸� : " + getCategoryName() );
		System.out.println( "�׽�Ʈ ������ joincount : " + getJoinCount() );
		System.out.println( "�׽�Ʈ ���� title : " + getTestTitle() );
		System.out.println( "�׽�Ʈ ������ foldername : " + getFoldername() );
		//System.out.println( "�׽�Ʈ �ؽ��±� hashtag: " + getHashtag_forsql() );
		//System.out.println( "�׽�Ʈ �Խ��� postdate : " + getPostdate() );
		System.out.println( "========================================");
	}
	
	
	/****************************�ؽ��±�***********************************/
	
	
	//�Ѱ��� �׽�Ʈ�� ���� �ؽ��ױ׸� ����
	String[] hashtag_for_ary;
	public void PrintHashInfo()
	{
		hashtag_for_ary = getHashtag();
		System.out.println("===�ؽ��±� ���===");
		for(int i=0; i < hashtag_for_ary.length; i++)
		{
			System.out.println(hashtag_for_ary[i]);
		}
	}
	
	
	/******vo�� ������� �� sql insert���� �迭�� String���� �����********/
	/***�޸�(,)������ ������ String���� �������*************************/
	public String getHashtag_forsql() {
		return hashtag_forsql;
	}
	
	
	
	
	
	
	
	
	public static void main(String[] args) 
	{
		//***************�ؽ��±� ����*****************//
		//*********�ؽ��±װ� �̸� ���õǾ� �ְ� �����Ұ� �ϴٸ� �ؽ��±�VO���� �ؽð�
		//�ۼ��ϰ� �Ʒ��Ͱ��� �������� �ʾƵ� �ȴ�*************************//
		//HashtagVO key = new HashtagVO();
		//key.setHash(0, "����");
		//key.setHash(1, "��ġ");
		//String val = key.getHash(0);
		//String val2 = key.getHash(1);
		//key.HashInfo();

		
		
		
		/************�׽�Ʈ�� �ؽ��±� �ֱ� ����****************************/
		/*
		//(1)�ؽ��±� ����� ��ȸ�Ѵ�
		HashtagVO key = new HashtagVO();
		key.HashInfo();
		
		//(2)���� �ִ´�
		TestVO test1 = new TestVO();
		test1.setTestTitle("�׽�Ʈ ����1�Դϴ�");
		test1.setHashtag("�߸�","�ϻ�","�ǰ�","�̷�","����"); //�迭 ���� ����
		
		//(3)�־��� �׽�Ʈ �� ����� ��ȸ�Ѵ�
		test1.PrintHashInfo();
		
		//(4)�迭 ���� string���� �����
		String test1_sql;
		test1_sql = test1.getHashtag_forsql();
		System.out.println("test1_sql = " + test1_sql);
		*/
		/***************[DTO]*******************/
		/*
		//(5)sql ������ insert�Ѵ�
		DBManager dbms = new DBManager();
		dbms.DBOpen();
		String sql = "";
		sql += "INSERT INTO test (t_hashtag) ";
		sql += "VALUES ('"+ test1_sql +"')";
		dbms.RunSQL(sql);
		
		//(6)�׽�Ʈ �ؽ��±� ���� ��´�
		//sql select ������ �����Ѵ�
		sql = "SELECT t_hashtag ";
		sql += "FROM test";
		dbms.OpenQuery(sql);
		String test1_hashtag_sql = "";
		//select ���� ��´�
		while( dbms.GetNext() == true)
		{
			test1_hashtag_sql = dbms.GetValue("t_hashtag");
		}	
		dbms.CloseQuery();
		
		//select���� ���� ������ , �������� split�� �Ѵ�
		String[] test1_get_hash = test1_hashtag_sql.split(",");
		for(int i = 0; i<test1_get_hash.length; i++)
		{
			System.out.println(
			test1.getTestTitle() + i + "��° �ؽ��±״� : " +  test1_get_hash[i]);
		}
		*/
	}

}