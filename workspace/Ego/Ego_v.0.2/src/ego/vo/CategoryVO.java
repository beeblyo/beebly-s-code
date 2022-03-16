package ego.vo;

public class CategoryVO
{
	private String no;   //카테고리 번호
	private String name; //카테고리 이름
	
	public String getCategoryNumber()	     { return no;		 }
	public String getCategoryName() 		 { return name;		 }

	public void setCategoryNumber(String no) { this.no   = no;	 }
	public void setCategoryName(String name) { this.name = name; }
	
	public void PrintInfo()
	{
		System.out.println( "========================================");
		System.out.println( "카테고리 번호 no : " + getCategoryNumber());
		System.out.println( "카테고리 이름 name : " + getCategoryName());
		System.out.println( "========================================");
	}

	public static void main(String[] args) 
	{

	}

}
