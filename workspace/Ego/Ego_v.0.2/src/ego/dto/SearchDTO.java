package ego.dto;
import java.util.ArrayList;
import ego.dbms.DBManager;
import ego.vo.SearchVO;
import ego.vo.CategoryVO;

public class SearchDTO extends DBManager
{
	private ArrayList<SearchVO> vo;
	String sql = "";
	
	public ArrayList<SearchVO> getKeyword()
	{
		return vo;
	}
	
	//******************검색어를 등록한다******************************//
	public boolean searchInsert(SearchVO vo)
	{
		if(DBOpen() == false) return false;
		sql  = "";
		sql += "insert into search_record (cg_name) ";
		sql += "values (";
		sql += "'" + vo.getKeyword() + "')";
		RunSQL(sql);
		return true;
	}
	
	//******************검색어를 업데이트한다******************************//
	public boolean categoryUpdate(SearchDTO vo)
	{
		if ( DBOpen() == false ) {return false;}
		sql = "";
		sql += "UPDATE category ";
		sql += "SET cg_name = '" + vo.getCategoryName().replace("'","") + "' ";
		sql += "WHERE cg_no = " + vo.getCategoryNumber();
		RunSQL(sql);
		return true;
	}
	
	//******************검색어를 삭제한다******************************//
	public void categoryDelete(SearchDTO vo)
	{
		while(DBOpen() == true) 
		{
			sql  = "";
			sql += "DELETE FROM category WHERE cg_no = " + vo.getCategoryNumber();
			RunSQL(sql);
		}
	}
	
	//******************검색어를 조회한다******************************//
	public boolean categoryIndex(SearchDTO vo)
	{
		while( DBOpen() == false) {return false;}
		while (GetNext() == true)
		{
			sql = "";
			sql += "SELECT cg_name ";
			sql += "FROM category ";
			sql += "WHERE cg_no = " + vo.getCategoryNumber();
		}
		OpenQuery(sql);
		return true;
	}
	
	
	public static void main(String[] args) 
	{
		
	}

}
