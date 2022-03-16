package ego.vo;

public class RecommedVO 
{
	private int no;			//추천 번호
	private String kind;	//추천 종류 (L:좋아요, P:정확해요)
	private String date;	//추천 일자
	
	
	public int    getRecommedNumber()			{ return no;		}
	public String getRecommedKind() 			{ return kind;		}
	public String getRecommedDate() 			{ return date;		}

	public void setRecommedNumber(int no) 		{ this.no   = no;	}
	public void setRecommedKind(String kind) 	{ this.kind = kind;	}
	public void setRecommedDate(String date) 	{ this.date = date;	}
	
	public void PrintInfo()
	{
		System.out.println( "========================================");
		System.out.println("추천 번호 no : " + getRecommedNumber() );
		System.out.println("추천 종류 kind : " + getRecommedKind() );
		System.out.println("추천 일자 date : " + getRecommedDate() );
		System.out.println("========================================");
	}

	public static void main(String[] args) 
	{

	}

}
