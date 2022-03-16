package api;

public class ApiVo 
{
	private String ano;       //��ȣ
	private String akind;     //����
	private String akindName; //���� �ѱ�
	private String admfee;    //���� (""/"����"/"����"/"�Ϲ�/û�ҳ�/���")
	private String age;       //���ɴ�
	private String content;   //����
	private String ETime;     //���� �ð�
	private String endDay;    //���� �� ��¥
	private String hostName;  //�ְ�
	private String mngTel;    //������ȭ��ȣ
	private String orgNm;     //����
	private String place;     //�������
	private String startDay;  //���� ���� ��¥
	private String subject;   //���� �̸�
	private String url;       //Ȩ������ �ּ�
	private String latitude;  //����
	private String longitude; //�浵
	
	
	/* setter */
	public void setAno(String ano)             { this.ano = ano;}
	public void setAkind(String akind)         {
		this.akind = akind;
		
		if(akind.equals("S"))      this.akindName = "����";
		else if(akind.equals("E")) this.akindName = "����";
		else if(akind.equals("F")) this.akindName = "����";
	}
	public void setAdmfee(String admfee)       { this.admfee = admfee;}
	public void setAge(String age)             { this.age = age;}
	public void setContent(String content)     { this.content = content;}
	public void setETime(String eTime)         { this.ETime = eTime;}
	public void setEndDay(String endDay)       { this.endDay = endDay;}
	public void setHostName(String hostName)   { this.hostName = hostName;}
	public void setMngTel(String mngTel)       { this.mngTel = mngTel;}
	public void setOrgNm(String orgNm)         { this.orgNm = orgNm;}
	public void setPlace(String place)         { this.place = place;}
	public void setStartDay(String startDay)   { this.startDay = startDay;}
	public void setSubject(String subject)     { this.subject = subject;}
	public void setUrl(String url)             { this.url = url;}
	public void setLatitude(String latitude)   {
		if(latitude == null) this.latitude = "35.81699242835504";
		else this.latitude = latitude;
	}
	public void setLongitude(String longitude)   {
		if(longitude == null) this.longitude = "127.14713582638252";
		else this.longitude = longitude;
	}
	
	/* getter */
	public String getAno()       { return ano;}
	public String getAkind()     { return akind;}
	public String getAkindName() { return akindName;}
	public String getAdmfee()    { return admfee;}
	public String getAge()       { return age;}
	public String getContent()   { return content;}
	public String getETime()     { return ETime;}
	public String getEndDay()    { return endDay;}
	public String getHostName()  { return hostName;}
	public String getMngTel()    { return mngTel;}
	public String getOrgNm()     { return orgNm;}
	public String getPlace()     { return place;}
	public String getStartDay()  { return startDay;}
	public String getSubject()   { return subject;}
	public String getUrl()       { return url;}
	public String getLatitude()  { return latitude; }
	public String getLongitude() { return longitude; }

}
