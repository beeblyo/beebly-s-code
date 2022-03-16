package ego.vo;

public class KeywordVO 
{
	private String keyword; //분야코드
	private String name; //분야명
		
	public String getKeyword() 			   { return keyword; }
	public String getName()				   { return name;    }
	
	public void setKeyword(String keyword)
	{
		this.keyword = keyword;
		switch (keyword)
		{
			case "001": this.name = "재미있는"; 	break;
			case "002": this.name = "자존심쎈"; 	break;
			case "003": this.name = "게으른"; 	break;
			case "004": this.name = "활발한"; 	break;
			case "005": this.name = "똑똑한"; 	break;
			case "006": this.name = "스릴있는";	break;
			case "007": this.name = "차분한"; 	break;
			case "008": this.name = "방콕"; 		break;
			case "009": this.name = "귀여운"; 	break;
			case "010": this.name = "느긋한"; 	break;
			case "011": this.name = "고집쎈"; 	break;
			case "012": this.name = "사랑스러운"; 	break;
			case "013": this.name = "행복한"; 	break;
			case "014": this.name = "착실한"; 	break;
			case "015": this.name = "온화한"; 	break;
			case "016": this.name = "키보드워리어"; break;
			case "017": this.name = "파티피플"; 	break;
			case "018": this.name = "현실적인"; 	break;
			case "019": this.name = "즉흥적인"; 	break;
			case "020": this.name = "창의적인"; 	break;
		}
	}
	
	public void prinInfo()
	{
		System.out.println(keyword + ":" + name);
	}
}