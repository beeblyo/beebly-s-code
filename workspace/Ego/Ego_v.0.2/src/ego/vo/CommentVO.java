package ego.vo;

public class CommentVO 
{
	private String cno; 	   //댓글 번호
	private String t_no;       //테스트 번호
	private String c_uno;      //작성자 번호
	private String cnick;      //작성자 닉네임
	private String cl_no;      //대댓글 번호
	private String cnote;      //댓글 내용
	private String cdate;      //댓글 등록일자
	
	
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getT_no() {
		return t_no;
	}
	public void setT_no(String t_no) {
		this.t_no = t_no;
	}
	public String getC_uno() {
		return c_uno;
	}
	public void setC_uno(String c_uno) {
		this.c_uno = c_uno;
	}
	public String getCnick() {
		return cnick;
	}
	public void setCnick(String cnick) {
		this.cnick = cnick;
	}
	public String getCl_no() {
		return cl_no;
	}
	public void setCl_no(String cl_no) {
		this.cl_no = cl_no;
	}
	public String getCnote() {
		return cnote;
	}
	public void setCnote(String cnote) {
		this.cnote = cnote;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	
	
	
}
