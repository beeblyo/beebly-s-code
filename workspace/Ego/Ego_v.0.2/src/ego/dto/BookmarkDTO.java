package ego.dto;

import java.util.ArrayList;

import ego.dbms.DBManager;
import ego.vo.BookmarkVO;

public class BookmarkDTO extends DBManager
{
	String sql= "";
	//******************북마크를 등록한다******************************//
	public boolean bookmarkInsert(String t_no, String u_no)
	{
		if(DBOpen() == false) return false;
		
		sql  = "";
		sql += "select t_no ";
		sql += "from bookmark ";
		sql += "where t_no = " + t_no + " ";
		sql += "and u_no = " + u_no;
		OpenQuery(sql);
		if(GetNext())
		{
			return false;
		}
		
		sql  = "";
		sql += "insert into bookmark (t_no,u_no) ";
		sql += "values (" + t_no +",'" + u_no + "')";
		RunSQL(sql);
		return true;
	}
	
	
	
	//******************북마크를 삭제한다******************************//
	public void bookmarkDelete(String t_no, String u_no)
	{
		if(DBOpen() == true) 
		{
			sql  = "";
			sql += "DELETE FROM bookmark WHERE t_no = " + t_no;
			sql += " and u_no = " + u_no;
			RunSQL(sql);
		}
	}
	
	public boolean isBookmark(String u_no)
	{
		if ( DBOpen() == false ) {return false;}

		sql = "";
		sql += "SELECT bm_no, b.t_no, b.u_no, bm_date, t.t_foldername, t.t_title ";
		sql += "FROM bookmark as b ";
		sql += "inner join test as t ";
		sql += "on t.t_no = b.t_no ";
		sql += "WHERE b.u_no = " + u_no;
		if (!OpenQuery(sql))
		{
			CloseQuery();
			DBClose();
			return false;
		}
		
		CloseQuery();
		DBClose();
		return true;
	}
	
	//******************북마크를 조회한다******************************//
	public ArrayList<BookmarkVO> bookmarkIndex(String u_no)
	{
		ArrayList<BookmarkVO> list = null;
		if ( DBOpen() == false ) {return list;}

		sql = "";
		sql += "SELECT bm_no, b.t_no, b.u_no, bm_date, t.t_foldername, t.t_title ";
		sql += "FROM bookmark as b ";
		sql += "inner join test as t ";
		sql += "on t.t_no = b.t_no ";
		sql += "WHERE b.u_no = " + u_no;
		if (!OpenQuery(sql))
		{
			CloseQuery();
			DBClose();
			return list;
		}

		list = new ArrayList<BookmarkVO>();
		while (GetNext())
		{
			
			BookmarkVO vo = new BookmarkVO();
			vo.setBm_Number(GetValue("bm_no"));
			vo.setTest_Number(GetValue("t_no"));
			vo.setTitle(GetValue("t_title"));
			vo.setFolder(GetValue("t_foldername"));
			vo.setUser_Number(GetValue("u_no"));
			vo.setBm_Date(GetValue("bm_date"));
			list.add(vo);
		}

		CloseQuery();
		DBClose();
		return list;
	}
	
	public static void main(String[] args) 
	{
		
	}

}
