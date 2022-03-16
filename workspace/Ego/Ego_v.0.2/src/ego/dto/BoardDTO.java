package ego.dto;

import ego.dbms.DBManager;
import ego.vo.BoardVO;

public class BoardDTO extends DBManager
{
	//게시물을 등록한다.
	public boolean Insert(BoardVO vo)
	{
		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return false;
		
		
		//게시물 등록 
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
		
		//등록된 게시물 번호 얻기
		sql = "select last_insert_id() as no ";
		this.OpenQuery(sql);
		this.GetNext();
		String bno = this.GetValue("no");
		this.CloseQuery();	
		vo.setNo(bno);
		
			
		//데이터베이스 연결을 종료한다.
		this.DBClose();		
		return true;
	}

	
	//게시물을 삭제한다.
	public boolean Delete(String no)
	{
		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return false;
		
		String sql = "";
		
		//게시물을 삭제한다.
		sql  = "delete from board ";
		sql += "where b_no = " + no + " ";
		this.RunSQL(sql);
		
		//데이터베이스 연결을 종료한다.
		this.DBClose();		
		return true;		
	}
	//게시물 정보를 변경한다.
	public boolean Update(BoardVO vo)
	{
		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return false;
		
		String sql = "";
		
		//게시물을 업데이트 한다.
		sql  = "update board ";
		sql += "set b_title = '" + vo.getTitle().replace("'","''") + "' , ";
		sql += "b_note = '" + vo.getNote().replace("'","''") + "' ";
		sql += "where b_no = " + vo.getNo();
		this.RunSQL(sql);
		
		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return true;	
	}
	//게시물 정보를 조회한다.
	public BoardVO Read(String no)
	{
		BoardVO vo = null;
		String sql = "";
		
		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return vo;
		
		//게시물의 정보를 얻는다.
		sql  = "select b_no,u_no,b_title,b_kind,b_note,b_date,b_ansnote,b_ansdate,";
		sql += "(select u_nickname from user where u_no = board.u_no) as u_nickname ";
		sql += "from board ";
		sql += "where b_no = '" + no + "' ";
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			this.CloseQuery();
			//데이터베이스 연결을 종료한다.
			this.DBClose();			
			return vo;			
		}
		//게시물 VO를 생성한다.
		vo = new BoardVO();
		
		vo.setNo(no);
		vo.setUno(this.GetValue("u_no"));
		vo.setUnick(this.GetValue("u_nickname"));
		vo.setTitle(this.GetValue("b_title"));
		vo.setKind(this.GetValue("b_kind"));
		vo.setNote(this.GetValue("b_note"));
		vo.setDate(this.GetValue("b_date"));
		this.CloseQuery();
		
		//데이터베이스 연결을 종료한다.
		this.DBClose();			
		return vo;
	}	
}
