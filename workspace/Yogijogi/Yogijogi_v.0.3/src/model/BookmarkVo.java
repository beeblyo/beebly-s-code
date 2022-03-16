package model;

public class BookmarkVo 
{
	private String mno;	      //회원 번호
	private String cno;	      //문화글 번호
	private String bmno;      //즐겨찾기 번호
	private String bmdate;	  //즐겨찾기 날짜
	private String uno;       //유저번호
	private String csubject;  //제목
	private String cplace;    //장소
	private String cstartDay; //시작일
	private String cendDay;   //끝일
	private String ckind;     //구분
	
	public String getMno()       { return mno;       }
	public String getCno()       { return cno;       }
	public String getBmno()      { return bmno;      }
	public String getBmdate()    { return bmdate;    }
	public String getUno()       { return uno;       }
	public String getCsubject()  { return csubject;  }
	public String getCplace()    { return cplace;    }
	public String getCstartDay() { return cstartDay; }
	public String getCendDay()   { return cendDay;   }
	public String getCkind()     { return ckind;     }
	
	public void setMno(String mno)       { this.mno    = mno;    }
	public void setCno(String cno)       { this.cno    = cno;    }
	public void setBmno(String bmno)     { this.bmno   = bmno;   }
	public void setBmdate(String bmdate) { this.bmdate = bmdate; }
	public void setUno(String uno)       { this.uno    = uno;    }
	public void setCsubject(String csubject)   { this.csubject  =  csubject;  }
	public void setCplace(String cplace)       { this.cplace    =  cplace;    }
	public void setCstartDay(String cstartDay) { this.cstartDay =  cstartDay; }
	public void setCendDay(String cendDay)     { this.cendDay   =  cendDay;   }
	public void setCkind(String ckind)         { this.ckind     =   ckind;    }

	public void PrintInfo()
	{
		System.out.println("========================================");
		System.out.println("회원 번호 mno : " + getMno());
		System.out.println("문화글 번호 cno : " + getCno());
		System.out.println("유저 번호 uno : " + getUno());
		System.out.println("즐겨찾기 번호 bmno : " + getBmno());
		System.out.println("즐겨찾기 날짜 bmdate : " + getBmdate());
		System.out.println("========================================");
	}

}
