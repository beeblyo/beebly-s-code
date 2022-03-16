package ego.vo;

import java.util.ArrayList;

public class UserVO 
{
	private String no;       //회원 번호
	private String id;       //회원 아이디
	private String email;    //회원 이메일
	private String nickname; //회원 닉네임
	private String pw;       //회원 비밀번호
	private String gender;   //회원 성별 
	private String bdate;    //회원 생년월일
	private String mbti;     //회원 MBTI
	private String retire;   //회원 탈퇴여부
	private String host;     //회원 권한
	
	private String keyword;  //관심분야 텍스트
	private ArrayList<KeywordVO> kList = null;
	
	public UserVO()
	{
		host = "N";
	}
	
	public String getNo()         			{  return no;		}
	public String getId()       			{  return id;		}
	public String getEmail()      			{  return email;	}
	public String getNickname()   			{  return nickname; }
	public String getPw()         			{  return pw;		}
	public String getGender()     			{  return gender;	}
	public String getBdate()      			{  return bdate;    }
	public String getMbti()       			{  return mbti;	    }
	public String getRetire()     			{  return retire;	}
	public String getHost()       			{  return host;	    }
	public String getKeyword()       		{  return keyword;  }
	
	public String getGenderName()
	{
		if(gender.equals("M"))
		{
			return "남";
		}else
		{
			return "여";
		}
	}
	
	public String getHostName()
	{
		if(host.equals("Y"))
		{
			return "관리자";
		}else
		{
			return "회원";
		}
	}
	
	public void setNo(String no)            		 {	this.no       = no;	      	         }
	public void setId(String id)           			 {	this.id       = id;		  	         }
	public void setEmail(String email)      		 {	this.email    = email;    	         }
	public void setNickname(String nickname)		 {	this.nickname = nickname; 	         }
	public void setPw(String pw)            		 {	this.pw       = pw;	      	         }
	public void setGender(String gender)    		 {	this.gender   = gender;	  	         }
	public void setBdate(String bdate)      		 {	this.bdate    = bdate.split(" ")[0]; }
	public void setMbti(String mbti)        		 {	this.mbti     = mbti;	  	         }
	public void setRetire(String retire)    		 {	this.retire   = retire;	  	         }
	public void setHost(String host)        		 {	this.host     = host;	  	         }
	
	public void setKeyword(String keyword)
	{
		this.keyword  = keyword;
		String[] keywordlist = keyword.split(",");
		setKeywordList(keywordlist);
	}
	
	/* =============== 키워트 세팅하기 =============== */
	public void setKeywordList(String[] codes)
	{
		keyword = "";
		KeywordVO keywordVO = null;
		kList = new ArrayList<KeywordVO>();
		for(int i=0; i<codes.length; i++)
		{
			keywordVO = new KeywordVO();
			keywordVO.setKeyword(codes[i]);
			System.out.println(keywordVO.getKeyword() + ":" + keywordVO.getName());
			
			kList.add(keywordVO);
			System.out.println(kList.get(i).toString());
			
			keyword += keywordVO.getKeyword();
			if(i < codes.length -1)
			{
				keyword += ",";
			}
		}
	}
	
	/* =============== 키워트 출력하기 =============== */
	public ArrayList<KeywordVO> getKeywordList()
	{
		return kList;
	}
	
	public String getEmailAll()
	{
		return id + "@" + email;
	}
	
	public void PrintInfo()
	{
		System.out.println("회원번호 :" + no);
		System.out.println("이메일 :" + id + "@" + email);
		System.out.println("닉네임 :" + nickname);
		System.out.println("성별 :" + getGenderName());
		System.out.println("생년월일 :" + bdate);
		System.out.println("mbti :" + mbti);
		System.out.println("키워드 :" + keyword);
		System.out.println("권한 :" + getHostName());
	}
}
