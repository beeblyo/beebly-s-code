package api;

public class ApiVo 
{
	private String ano;       //번호
	private String akind;     //구분
	private String akindName; //구분 한글
	private String admfee;    //가격 (""/"없음"/"무료"/"일반/청소년/어린이")
	private String age;       //연령대
	private String content;   //설명
	private String ETime;     //전시 시간
	private String endDay;    //전시 끝 날짜
	private String hostName;  //주관
	private String mngTel;    //문의전화번호
	private String orgNm;     //주최
	private String place;     //공연장소
	private String startDay;  //전시 시작 날짜
	private String subject;   //전시 이름
	private String url;       //홈페이지 주소
	private String latitude;  //위도
	private String longitude; //경도
	
	
	/* setter */
	public void setAno(String ano)             { this.ano = ano;}
	public void setAkind(String akind)         {
		this.akind = akind;
		
		if(akind.equals("S"))      this.akindName = "공연";
		else if(akind.equals("E")) this.akindName = "전시";
		else if(akind.equals("F")) this.akindName = "축제";
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
