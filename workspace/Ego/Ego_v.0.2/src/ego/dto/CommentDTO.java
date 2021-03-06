package ego.dto;

import java.util.ArrayList;
import ego.dbms.*;
import ego.vo.*;



public class CommentDTO extends DBManager
{	
	
	private ArrayList<CommentVO> list;
	
	//******************댓글을 등록한다******************************//
	public boolean Insert(CommentVO vo)
	{
		if(DBOpen() == false) return false;
		
		String sql = "";
		
		sql  ="insert into comment (t_no,u_no,c_note) ";
		sql +="values(";
		sql +="'" + vo.getT_no() + "',";
		sql +="'" + vo.getC_uno() + "',";
		sql +="'" + vo.getCnote().replace("'", "''") + "')";
		this.RunSQL(sql);
		
		//등록된 댓글의 번호를 얻는다.
		sql = "select last_insert_id() as no ";
		this.OpenQuery(sql);
		this.GetNext();
		String cno = this.GetValue("no");
		this.CloseQuery();	
		vo.setCno(cno);
		
		this.DBClose();
		return true;
	}
	
	//******************댓글을 삭제한다******************************//
	public boolean Delete(String cno)
	{
		if(this.DBOpen() == false) return false; 
		
		String sql  = "";
		
		sql  = "delte from comment ";
		sql += "where c_no = " + cno;
		RunSQL(sql);
	

		this.DBClose();		
		return true;
	}
	
	//댓글 업데이트 
	public boolean Update(CommentVO vo)
	{
		if(this.DBOpen() == false) return false; 
		
		String sql = "";
		
		sql  ="update comment ";
		sql +="set c_note = '" + vo.getCnote().replace("'","''") + "' ";
		sql +="where c_no = " + vo.getCno();
		this.RunSQL(sql);
		
		this.DBClose();
		return true;
	}
	
	//댓글 목록 조회
	//rno : 댓글번호
	public boolean GetList(String no, String rno)
	{
		String sql = "";
		
		this.list = null;
		
		if(this.DBOpen() == false) return false; 
		
		sql = "select c_no,t_no,u_no,c_note,date(c_date) as cdate, ";
		sql += "(select u_nickname from user where u_no = comment.u_no) as cunick "; 
		sql += "from comment where t_no = '" + no  + "' and cl_no = '" + rno + "' ";
		sql += "order by c_no desc ";
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			
			String cno = this.GetValue("c_no");
			String cuno = this.GetValue("u_no");
			String cnote = this.GetValue("c_note");
			String cnick = this.GetValue("cunick");
			String cdate = this.GetValue("cdate");
			
			if( this.list == null)
			{
				this.list = new ArrayList<CommentVO>();
			}
			CommentVO vo = new CommentVO();
			
			vo.setCno(cno);
			vo.setT_no(no);
			vo.setC_uno(cuno);
			vo.setCnote(cnote);
			vo.setCnick(cnick);
			vo.setCdate(cdate);
			list.add(vo);
		}
		this.CloseQuery();
		
		this.DBClose();
		return true;
	}
	
	public int GetListTotal()
	{
		if(this.list == null) return 0;
		else return list.size();
	}
	
	public CommentVO GetItem(int index)
	{
		if(this.list == null) return null;
		else return list.get(index);
	}
	public ArrayList<CommentVO> GetListArray()
	{
		return this.list;
	}
}
