package ego.vo;

public class SearchVO
{
	private String kind;     //구분(공지,문의)	
	private String keyword;  //검색 키워드
	private String date;	 //검색 일자
	private String sortorder; //오름/내림차순
	
	public SearchVO()
	{
		kind      = "J";
		keyword   = "";
		sortorder = "desc";
	}
	public String getKeyword() 				{ return keyword;	      } 
	public String getDate() 				{ return date;			  }

	public void setKeyword(String keyword) 	{ this.keyword = keyword; }
	public void setDate(String date) 		{ this.date    = date;	  }

	public void PrintInfo()
	{
		System.out.println( "========================================");
		System.out.println(" 검색키워드 keyword : " + getKeyword() );
		System.out.println(" 검색 일자 date : " + getDate() );
		System.out.println( "========================================");
	}
	
	
	public static void main(String[] args) 
	{
		SearchVO vo = new SearchVO();

		vo.setDate("2011-13-11");
		vo.setKeyword("테스트3");
		
		vo.PrintInfo();
	}

}
