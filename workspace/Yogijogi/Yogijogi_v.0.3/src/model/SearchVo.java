package model;

//�˻������� �����ϱ� ���� Ŭ����
public class SearchVo
{
	private String bkind;     //���� (����:F, ����:S, ����:E)
	private String keyword;   //�˻���
	private String sortcol;   //���� �÷�
	private String sortorder; //����/��������
	private int    curpage;   //���� ������	
	
	public SearchVo()
	{
		bkind     = "";
		keyword   = "";
		sortcol   = "bno";
		sortorder = "desc";
	}
	
	public String getKind() {
		return bkind;
	}
	
	public String getBkindName()
	{
		if(bkind.equals("F"))
		{
			return "����";
		}else if(bkind.equals("S"))
		{
			return "����";
		}else
		{
			return "����";
		}
	}	

	public void setBkind(String bkind) {
		if(bkind == null) this.bkind ="F";
		else this.bkind = bkind;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		if(keyword == null) this.keyword ="";
		else this.keyword = keyword;
	}

	public String getSortcol() {
		return sortcol;
	}

	public void setSortcol(String sortcol) {
		if(sortcol == null) this.sortcol ="bno";
		else this.sortcol = sortcol;
	}

	public String getSortorder() {
		return sortorder;
	}

	public void setSortorder(String sortorder) {
		if(sortorder == null) this.sortorder ="desc";
		else this.sortorder = sortorder;		
	}

	public int getCurpage() {
		return curpage;
	}

	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}
	
	public void setCurpage(String curpage) {
		try
		{
			this.curpage = Integer.parseInt(curpage);
		}catch(Exception e)
		{
			this.curpage = 1;
		}
	}

	public String GetViewLink(String no)
	{
		String link = "";
		link  = "bkind=" + bkind;
		link += "&key="+ keyword;
		link += "&page=" + curpage;
		link += "&oc=" + sortcol;
		link += "&ob=" + sortorder;
		link += "&no=" + no;
		return link;
	}
	
	public String GetPageLink(int pageno)
	{
		String link = "";
		link  = "bkind=" + bkind;
		link += "&key="+ keyword;
		link += "&page=" + pageno;
		link += "&oc=" + sortcol;
		link += "&ob=" + sortorder;
		return link;
	}		
}
