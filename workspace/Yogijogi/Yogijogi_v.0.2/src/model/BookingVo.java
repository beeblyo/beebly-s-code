package model;

public class BookingVo 
{
	private String bkno;      //예매 번호
	private String mno;       //회원 번호
	private String bkdate;    //예매 일자
	private String bkkind;    //구분
	private String bkexpsc;   //비싼 좌석 수
	private String bkmiddsc;  //중간 좌석 수
	private String bkchesc;   //저렴한 좌석 수
	private String bkadultc;  //성인 수
	private String bkchildc;  //어린이 수
	private String bktotal;   //총 가격
	private String bkcancle;  //취소 여부
	private String bkcdate;   //취소 일자
	private String bktime;    //시간대
	
	
	public String getBkno()     { return bkno;     }
	public String getMno()      { return mno;      }
	public String getBkdate()   { return bkdate;   }
	public String getBkkind()   { return bkkind;   }
	public String getBkexpsc()  { return bkexpsc;  }
	public String getBkmiddsc() { return bkmiddsc; }
	public String getBkchesc()  { return bkchesc;  }
	public String getBkadultc() { return bkadultc; }
	public String getBkchildc() { return bkchildc; }
	public String getBktotal()  { return bktotal;  }
	public String getBkcancle() { return bkcancle; }
	public String getBkcdate()  { return bkcdate;  }
	public String getBktime()   { return bktime;   }
	
	
	
	public void setBkno(String bkno)          {	this.bkno     = bkno;      }
	public void setMno(String mno)            { this.mno      = mno;       }
	public void setBkdate(String bkdate)      { this.bkdate   = bkdate;    }
	public void setBkkind(String bkkind)      { this.bkkind   = bkkind;    }
	public void setBkexpsc(String bkexpsc)    { this.bkexpsc  = bkexpsc;   }
	public void setBkmiddsc(String bkmiddsc)  { this.bkmiddsc = bkmiddsc;  }
	public void setBkchesc(String bkchesc)    { this.bkchesc  = bkchesc;   }
	public void setBkadultc(String bkadultc)  { this.bkadultc = bkadultc;  }
	public void setBkchildc(String bkchildc)  { this.bkchildc = bkchildc;  }
	public void setBktotal(String bktotal)    { this.bktotal  = bktotal;   }
	public void setBkcancle(String bkcancle)  { this.bkcancle = bkcancle;  }
	public void setBkcdate(String bkcdate)    { this.bkcdate  = bkcdate;   }
	public void setBktime(String bktime)      { this.bktime   = bktime;    }
	
	
	
}
