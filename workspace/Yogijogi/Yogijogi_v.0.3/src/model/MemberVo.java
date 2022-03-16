package model;

public class MemberVo 
{
	private int    mno;         //ȸ�� ��ȣ
	private String mid;         //ȸ�� ���̵�
	private String mpw;         //ȸ�� ��й�ȣ
	private String mname;       //ȸ�� �̸�
	private String memail;      //ȸ�� �̸���
	private String memailcheck; //ȸ�� �̸��� Ȯ��
	private String mpnum;       //ȸ�� ��ȭ��ȣ
	private String mjdate;      //ȸ������ ����
	private String mretire;     //ȸ�� Ż�𿩺�
	private String mrdate;      //ȸ�� Ż������
	private String mhost;       //ȸ�� ������ ����
	
	
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
		if(memailcheck.equals("0")) return "���";
		else {
			if(mretire.equals("N")) return "ȸ��";
			else                    return "Ż��";
		}
	}
	public String getMhostName()   {
		if(mhost.equals("N")) return "�Ϲ�";
		else                  return "������";
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
