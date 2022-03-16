package model;

public class BoardVo
{
	private int    bno;    //게시물 번호
	private String mno;    //회원 번호
	private String mname;  //회원 이름
	private String bkind;  //구분
	private String btitle; //제목
	private String btopic; //주제
	private String bnote;  //내용
	private String bwdate; //작성일
	private String bhit;   //조회수



	public String getMname() {return mname;}
	public void setMname(String mname) {this.mname = mname;}
	public int getBno() {	return bno;}
	public void setBno(int bno) {this.bno = bno;	}
	public String getMno() {return mno;}
	public void setMno(String mno) {this.mno = mno;}
	public String getBkind() {return bkind;}
	public void setBkind(String bkind) {this.bkind = bkind;}
	public String getBtitle() {return btitle;}
	public String getBtopic() {return btopic;}
	public void setBtitle(String btitle) 
	{
		this.btitle = btitle.split("@@")[1];
		this.btopic = btitle.split("@@")[0];
	}
	public String getBnote() {return bnote;}
	public void setBnote(String bnote) {this.bnote = bnote;}
	public String getBwdate() {return bwdate;}
	public void setBwdate(String bwdate) {this.bwdate = bwdate;}
	public String getBhit() {return bhit;}
	public void setBhit(String bhit) {this.bhit = bhit;}

	public String getKindName()
	{
		if(bkind.equals("F"))
		{
			return "축제";
		}else if(bkind.equals("S"))
		{
			return "공연";
		}else
		{
			//E
			return "전시";
		}
	}
}