package ego.vo;
import java.util.*;
public class HashtagVO 
{

/****************************�ؽ��±�******************************/
	
	private String hash;     //�о��ڵ�
	private String hashname; //�о߸�
		
	public String getHash() 			{ return hash; 		  }
	public String getHashname()			{ return hashname;    }

	public void setHash(String hash)
	{
	
		this.hash = hash;
		switch (hash)
		{
			case "01": this.hashname = "#�ڿ�"; 		break;
			case "02": this.hashname = "#����"; 		break;
			case "03": this.hashname = "#����"; 		break;
			case "04": this.hashname = "#�߸�"; 		break;
			case "05": this.hashname = "#�ϻ�"; 		break;
			case "06": this.hashname = "#�ǰ�";		break;
			case "07": this.hashname = "#�о�"; 		break;
			case "08": this.hashname = "#���"; 		break;
			case "09": this.hashname = "#����"; 		break;
			case "10": this.hashname = "#�̷�"; 		break;
			case "11": this.hashname = "#����"; 		break;
			case "12": this.hashname = "#�"; 		break;
			case "13": this.hashname = "#��������"; 	break;
			case "14": this.hashname = "#����"; 		break;
			case "15": this.hashname = "#����"; 		break;
			case "16": this.hashname = "#������"; 	break;
			case "17": this.hashname = "#�ֺ���"; 	break;
			case "18": this.hashname = "#����"; 		break;
			case "19": this.hashname = "#��ȭ"; 		break;
			case "20": this.hashname = "#����"; 		break;
			case "21": this.hashname = "#����"; 		break;
			case "22": this.hashname = "#����"; 		break;
			case "23": this.hashname = "#����"; 		break;
			case "24": this.hashname = "#����"; 		break;
			case "25": this.hashname = "#����"; 		break;
			case "26": this.hashname = "#����";		break;
			case "27": this.hashname = "#ö��"; 		break;
			case "28": this.hashname = "#����"; 		break;
			case "29": this.hashname = "#����"; 		break;
			case "30": this.hashname = "#����"; 		break;
			case "31": this.hashname = "#IT"; 		break;
			case "32": this.hashname = "#������"; 	break;
			case "33": this.hashname = "#������"; 	break;
			case "34": this.hashname = "#����"; 		break;
			case "35": this.hashname = "#�ð�"; 		break;
			case "36": this.hashname = "#����"; 		break;
			case "37": this.hashname = "#��ü"; 		break;
			case "38": this.hashname = "#�޽�"; 		break;
			case "39": this.hashname = "#����"; 		break;
			case "40": this.hashname = "#��Ģ"; 		break;
		}
	}
	
	
	
	String[] hashtags = 
	{"�ڿ�","����","����","�߸�","�ϻ�","�ǰ�","�о�","���","����","�̷�","����",
	"�","��������","����","����","������","�ֺ���","����","��ȭ","����","����",
	"����","����","����","����","����","ö��","����","����","����","IT",
	"�̷�","��","������","������","���׸���","��","����","����","�ð�","����",
	"��ü","�޽�","����","��Ģ"
	};
	//**Arrays.asList�� ������ ��ü�� ������ �� �ִ�**//
	/*
	List<String> list = Arrays.asList(hashtags);
	public void setHash(int i,String values)
	{
		if(list != null && list.isEmpty() == false)
		{
			list.set(i, values);
		}else
		{
			System.out.println("�ش� ��ȣ�� ���� ���ų� null �Դϴ�.");
		}
	}

	public String getHash(int i)
	{
		String value = "";
		if(list != null && list.isEmpty() == false)
		{
			value = list.get(i);
		}else
		{
			return "�ش� ��ȣ�� ���� ���ų� null �Դϴ�.";
		}
		return value;
	}
	public void HashInfo()
	{
		System.out.println("===Ű���� ���===");
		for(int i =0; i<list.size(); i++)
		{
			System.out.println(i + " : " + list.get(i));
		}
	}
	
	*/
	
	public static void main(String[] args) 
	{
	}

}
