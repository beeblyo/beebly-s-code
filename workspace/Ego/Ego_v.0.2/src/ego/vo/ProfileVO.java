package ego.vo;

public class ProfileVO 
{
	int no;			//프로필 번호
	String p_name;	//프로필 물리이름
	String f_name;	//프로필 논리이름
	
	
	public int    getP_Number() 			{ return no;			}
	public String getP_Name() 				{ return p_name;		}
	public String getF_Name() 				{ return f_name;		}

	public void setP_Number(int no) 		{ this.no     = no;		}
	public void setP_name(String p_name) 	{ this.p_name = p_name;	}
	public void setF_name(String f_name) 	{ this.f_name = f_name;	}

	public void PrintInfo()
	{
		System.out.println( "========================================");
		System.out.println("프로필 번호no : " + 	getP_Number());
		System.out.println("프로필 물리이름p_name : " + getP_Name());
		System.out.println("프로필 논리이름f_name : " + getF_Name());
		System.out.println( "========================================");
	}
	
	public static void main(String[] args) 
	{

	}

}
