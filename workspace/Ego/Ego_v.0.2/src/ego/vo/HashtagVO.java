package ego.vo;
import java.util.*;
public class HashtagVO 
{

/****************************해시태그******************************/
	
	private String hash;     //분야코드
	private String hashname; //분야명
		
	public String getHash() 			{ return hash; 		  }
	public String getHashname()			{ return hashname;    }

	public void setHash(String hash)
	{
	
		this.hash = hash;
		switch (hash)
		{
			case "01": this.hashname = "#자연"; 		break;
			case "02": this.hashname = "#공포"; 		break;
			case "03": this.hashname = "#스릴"; 		break;
			case "04": this.hashname = "#추리"; 		break;
			case "05": this.hashname = "#일상"; 		break;
			case "06": this.hashname = "#건강";		break;
			case "07": this.hashname = "#학업"; 		break;
			case "08": this.hashname = "#취미"; 		break;
			case "09": this.hashname = "#음식"; 		break;
			case "10": this.hashname = "#미래"; 		break;
			case "11": this.hashname = "#랜덤"; 		break;
			case "12": this.hashname = "#운세"; 		break;
			case "13": this.hashname = "#초현실적"; 	break;
			case "14": this.hashname = "#연애"; 		break;
			case "15": this.hashname = "#유머"; 		break;
			case "16": this.hashname = "#닮은꼴"; 	break;
			case "17": this.hashname = "#주변인"; 	break;
			case "18": this.hashname = "#음악"; 		break;
			case "19": this.hashname = "#영화"; 		break;
			case "20": this.hashname = "#게임"; 		break;
			case "21": this.hashname = "#날씨"; 		break;
			case "22": this.hashname = "#색상"; 		break;
			case "23": this.hashname = "#과학"; 		break;
			case "24": this.hashname = "#문학"; 		break;
			case "25": this.hashname = "#여행"; 		break;
			case "26": this.hashname = "#역사";		break;
			case "27": this.hashname = "#철학"; 		break;
			case "28": this.hashname = "#금융"; 		break;
			case "29": this.hashname = "#우주"; 		break;
			case "30": this.hashname = "#지리"; 		break;
			case "31": this.hashname = "#IT"; 		break;
			case "32": this.hashname = "#유명인"; 	break;
			case "33": this.hashname = "#디자인"; 	break;
			case "34": this.hashname = "#습관"; 		break;
			case "35": this.hashname = "#시간"; 		break;
			case "36": this.hashname = "#감정"; 		break;
			case "37": this.hashname = "#신체"; 		break;
			case "38": this.hashname = "#휴식"; 		break;
			case "39": this.hashname = "#직업"; 		break;
			case "40": this.hashname = "#규칙"; 		break;
		}
	}
	
	
	
	String[] hashtags = 
	{"자연","공포","스릴","추리","일상","건강","학업","취미","음식","미래","랜덤",
	"운세","초현실적","연애","유머","닮은꼴","주변인","음악","영화","게임","날씨",
	"색상","과학","문학","여행","역사","철학","금융","우주","지리","IT",
	"이론","댄스","유명인","디자인","인테리어","잠","습관","음주","시간","감정",
	"신체","휴식","직업","규칙"
	};
	//**Arrays.asList는 고정된 객체로 구성할 수 있다**//
	/*
	List<String> list = Arrays.asList(hashtags);
	public void setHash(int i,String values)
	{
		if(list != null && list.isEmpty() == false)
		{
			list.set(i, values);
		}else
		{
			System.out.println("해당 번호에 값이 없거나 null 입니다.");
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
			return "해당 번호에 값이 없거나 null 입니다.";
		}
		return value;
	}
	public void HashInfo()
	{
		System.out.println("===키워드 목록===");
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
