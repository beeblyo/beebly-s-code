package ego.vo;

public class KeywordVO 
{
	private String keyword; //�о��ڵ�
	private String name; //�о߸�
		
	public String getKeyword() 			   { return keyword; }
	public String getName()				   { return name;    }
	
	public void setKeyword(String keyword)
	{
		this.keyword = keyword;
		switch (keyword)
		{
			case "001": this.name = "����ִ�"; 	break;
			case "002": this.name = "�����ɽ�"; 	break;
			case "003": this.name = "������"; 	break;
			case "004": this.name = "Ȱ����"; 	break;
			case "005": this.name = "�ȶ���"; 	break;
			case "006": this.name = "�����ִ�";	break;
			case "007": this.name = "������"; 	break;
			case "008": this.name = "����"; 		break;
			case "009": this.name = "�Ϳ���"; 	break;
			case "010": this.name = "������"; 	break;
			case "011": this.name = "������"; 	break;
			case "012": this.name = "���������"; 	break;
			case "013": this.name = "�ູ��"; 	break;
			case "014": this.name = "������"; 	break;
			case "015": this.name = "��ȭ��"; 	break;
			case "016": this.name = "Ű���������"; break;
			case "017": this.name = "��Ƽ����"; 	break;
			case "018": this.name = "��������"; 	break;
			case "019": this.name = "��������"; 	break;
			case "020": this.name = "â������"; 	break;
		}
	}
	
	public void prinInfo()
	{
		System.out.println(keyword + ":" + name);
	}
}