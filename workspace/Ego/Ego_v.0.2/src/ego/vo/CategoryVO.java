package ego.vo;

public class CategoryVO
{
	private String no;   //ī�װ� ��ȣ
	private String name; //ī�װ� �̸�
	
	public String getCategoryNumber()	     { return no;		 }
	public String getCategoryName() 		 { return name;		 }

	public void setCategoryNumber(String no) { this.no   = no;	 }
	public void setCategoryName(String name) { this.name = name; }
	
	public void PrintInfo()
	{
		System.out.println( "========================================");
		System.out.println( "ī�װ� ��ȣ no : " + getCategoryNumber());
		System.out.println( "ī�װ� �̸� name : " + getCategoryName());
		System.out.println( "========================================");
	}

	public static void main(String[] args) 
	{

	}

}
