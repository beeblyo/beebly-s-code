package ego.dto;

import ego.dbms.DBManager;
import ego.vo.BoardVO;

public class BoardDTO extends DBManager
{
	//�Խù��� ����Ѵ�.
	public boolean Insert(BoardVO vo)
	{
		//�����ͺ��̽��� �����Ѵ�.
		if(this.DBOpen() == false) return false;
		
		
		//�Խù� ��� 
		String sql = "";
		sql += "insert into board (u_no,b_title,b_kind,b_note) ";
		sql += "values (";
		sql += "'" + vo.getUno() + "',";
		sql += "'" + vo.getTitle().replace("'","''") + "',";
		sql += "'" + vo.getKind() + "',";
		sql += "'" + vo.getNote().replace("'","''") + "')";	
		
		this.RunSQL(sql);	
		
		//,b_ansnote
		//sql += "'" + vo.getAnsnote().replace("'","''") + "')";	
		
		//��ϵ� �Խù� ��ȣ ���
		sql = "select last_insert_id() as no ";
		this.OpenQuery(sql);
		this.GetNext();
		String bno = this.GetValue("no");
		this.CloseQuery();	
		vo.setNo(bno);
		
			
		//�����ͺ��̽� ������ �����Ѵ�.
		this.DBClose();		
		return true;
	}

	
	//�Խù��� �����Ѵ�.
	public boolean Delete(String no)
	{
		//�����ͺ��̽��� �����Ѵ�.
		if(this.DBOpen() == false) return false;
		
		String sql = "";
		
		//�Խù��� �����Ѵ�.
		sql  = "delete from board ";
		sql += "where b_no = " + no + " ";
		this.RunSQL(sql);
		
		//�����ͺ��̽� ������ �����Ѵ�.
		this.DBClose();		
		return true;		
	}
	//�Խù� ������ �����Ѵ�.
	public boolean Update(BoardVO vo)
	{
		//�����ͺ��̽��� �����Ѵ�.
		if(this.DBOpen() == false) return false;
		
		String sql = "";
		
		//�Խù��� ������Ʈ �Ѵ�.
		sql  = "update board ";
		sql += "set b_title = '" + vo.getTitle().replace("'","''") + "' , ";
		sql += "b_note = '" + vo.getNote().replace("'","''") + "' ";
		sql += "where b_no = " + vo.getNo();
		this.RunSQL(sql);
		
		//�����ͺ��̽� ������ �����Ѵ�.
		this.DBClose();
		return true;	
	}
	//�Խù� ������ ��ȸ�Ѵ�.
	public BoardVO Read(String no)
	{
		BoardVO vo = null;
		String sql = "";
		
		//�����ͺ��̽��� �����Ѵ�.
		if(this.DBOpen() == false) return vo;
		
		//�Խù��� ������ ��´�.
		sql  = "select b_no,u_no,b_title,b_kind,b_note,b_date,b_ansnote,b_ansdate,";
		sql += "(select u_nickname from user where u_no = board.u_no) as u_nickname ";
		sql += "from board ";
		sql += "where b_no = '" + no + "' ";
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			this.CloseQuery();
			//�����ͺ��̽� ������ �����Ѵ�.
			this.DBClose();			
			return vo;			
		}
		//�Խù� VO�� �����Ѵ�.
		vo = new BoardVO();
		
		vo.setNo(no);
		vo.setUno(this.GetValue("u_no"));
		vo.setUnick(this.GetValue("u_nickname"));
		vo.setTitle(this.GetValue("b_title"));
		vo.setKind(this.GetValue("b_kind"));
		vo.setNote(this.GetValue("b_note"));
		vo.setDate(this.GetValue("b_date"));
		this.CloseQuery();
		
		//�����ͺ��̽� ������ �����Ѵ�.
		this.DBClose();			
		return vo;
	}	
}
