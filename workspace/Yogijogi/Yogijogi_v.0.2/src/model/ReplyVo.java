package model;

public class ReplyVo 
{
	private int rno;       //댓글번호
	private String bno;    //게시물번호
	private String mno;    //회원번호
	private String mname;  //회원 이름
	private String rnote;  //댓글내용
	private String rwdate; //댓글작성일
	private String rdno;   //대댓글번호
	
	public String getMname() 				{return mname;}
	public void setMname(String mname) 		{this.mname = mname;}
	public int getRno() 					{return rno;	}
	public void setRno(int rno) 			{this.rno = rno;}
	public String getBno()					{return bno;}
	public void setBno(String bno) 			{this.bno = bno;}
	public String getMno() 					{return mno;}
	public void setMno(String mno) 			{this.mno = mno;}
	public String getRnote() 				{return rnote;}
	public void setRnote(String rnote) 		{this.rnote = rnote;}
	public String getRwdate() 				{return rwdate;}
	public void setRwdate(String rwdate) 	{this.rwdate = rwdate;}
	public String getRdno() 		 		{return rdno;}
	public void setRdno(String rdno) 		{this.rdno = rdno;}
	
	
}
