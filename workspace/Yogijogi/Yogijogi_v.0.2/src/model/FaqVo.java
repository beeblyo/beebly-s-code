package model;

public class FaqVo 
{
	int fno;
	String ftitle;
	String fnote;

	public FaqVo()
	{
		this.ftitle = "";
		this.fnote = "";
	}

	public int getFno() {return fno;}
	public void setFno(int fno) {this.fno = fno;}
	public String getFtitle() {return ftitle;}
	public void setFtitle(String ftitle) {this.ftitle = ftitle;}
	public String getFnote() {return fnote;}
	public void setFnote(String fnote) {this.fnote = fnote;}
	
	
	
}
