package ego.vo;

public class ProfileVO 
{
	int no;			//������ ��ȣ
	String p_name;	//������ �����̸�
	String f_name;	//������ �����̸�
	
	
	public int    getP_Number() 			{ return no;			}
	public String getP_Name() 				{ return p_name;		}
	public String getF_Name() 				{ return f_name;		}

	public void setP_Number(int no) 		{ this.no     = no;		}
	public void setP_name(String p_name) 	{ this.p_name = p_name;	}
	public void setF_name(String f_name) 	{ this.f_name = f_name;	}

	public void PrintInfo()
	{
		System.out.println( "========================================");
		System.out.println("������ ��ȣno : " + 	getP_Number());
		System.out.println("������ �����̸�p_name : " + getP_Name());
		System.out.println("������ �����̸�f_name : " + getF_Name());
		System.out.println( "========================================");
	}
	
	public static void main(String[] args) 
	{

	}

}