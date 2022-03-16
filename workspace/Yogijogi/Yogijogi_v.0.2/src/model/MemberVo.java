package model;

public class MemberVo 
{
	private int    mno;         //회원 번호
	private String mid;         //회원 아이디
	private String mpw;         //회원 비밀번호
	private String mname;       //회원 이름
	private String memail;      //회원 이메일
	private String memailcheck; //회원 이메일 확인
	private String mpnum;       //회원 전화번호
	private String mjdate;      //회원가입 일자
	private String mretire;     //회원 탈퇴여부
	private String mrdate;      //회원 탈퇴일자
	private String mhost;       //회원 관리자 여부
	
	public int    getMno()          {return mno;}
	public String getMid()          {return mid;}
	public String getMpw()          {return mpw;}
	public String getMname()        {return mname;}
	public String getMemail()       {return memail;}
	public String getMemailchack()  {return memailcheck;}
	public String getMpnum()        {return mpnum;}
	public String getMjdate()       {return mjdate;}
	public String getMretire()      {return mretire;}
	public String getMrdate()       {return mrdate;}
	public String getMhost()        {return mhost;}
	public String getMretireName() {
		if(memailcheck.equals("0")) return "대기";
		else {
			if(mretire.equals("N")) return "회원";
			else                    return "탈퇴";
		}
	}
	public String getMhostName()   {
		if(mhost.equals("N")) return "일반";
		else                  return "관리자";
	}
	

	public void setMno(int mno)                     {this.mno = mno;}
	public void setMid(String mid)                  {this.mid = mid;}
	public void setMpw(String mpw)                  {this.mpw = mpw;}
	public void setMname(String mname)              {this.mname = mname;}
	public void setMemail(String memail)            {this.memail = memail;}
	public void setMemailchack(String memailcheck)  {this.memailcheck = memailcheck;}
	public void setMpnum(String mpnum) 	            {this.mpnum = mpnum;}
	public void setMjdate(String mjdate)            {this.mjdate = mjdate;}
	public void setMretire(String mretire)          {this.mretire = mretire;}
	public void setMrdate(String mrdate)            {this.mrdate = mrdate;}
	public void setMhost(String mhost)              {this.mhost = mhost;}

}
