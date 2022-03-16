package ego.vo;

public class BookmarkVO 
{
	private String t_no;	 //테스트 번호
	private String folder;	 //테스트 폴더이름
	private String t_title;	 //테스트 제목
	private String u_no;	 //유저 번호
	private String bm_no;	 //즐겨찾기 번호
	private String bm_date;	 //즐겨찾기 날짜
	
	
	public String getBm_Number() 			{ return bm_no;		      }
	public String getTitle() 				{ return bm_date;         }
	public String getBm_Date() 				{ return t_title;         }
	public String getTest_Number() 			{ return t_no;		      }
	public String getUser_Number() 			{ return u_no;		      }
	public String getFolder()               { return folder;          }
	
	public void setBm_Number(String bm_no) 	{ this.bm_no   = bm_no;   }
	public void setBm_Date(String bm_date) 	{ this.bm_date = bm_date; }
	public void setTitle(String t_title) 	{ this.t_title = t_title; }
	public void setTest_Number(String t_no) { this.t_no    = t_no;    }
	public void setUser_Number(String u_no) { this.u_no    = u_no;    }
	public void setFolder(String folder)    { this.folder = folder;   }
	
	public void PrintInfo()
	{
		System.out.println( "========================================");
		System.out.println("테스트 번호 t_no : " + 	getTest_Number());
		System.out.println("테스트 폴더이름 folder : " + 	getFolder());
		System.out.println("유저 번호 u_no : " + 	getUser_Number());
		System.out.println("즐겨찾기 번호 no : " + 	getBm_Number());
		System.out.println("즐겨찾기 날짜 bm_date : " + getBm_Date());
		System.out.println( "========================================");
	}

}
