package ego.dto;
import java.util.ArrayList;

import ego.dbms.*;
import ego.vo.CategoryVO;

public class CategoryDTO extends DBManager
{
	
	/******************카테고리를 등록한다******************************/
	public boolean categoryInsert(CategoryVO vo)
	{
		if(DBOpen() == false) return false;
		String sql  = "";
		sql += "insert into category (cg_name) ";
		sql += "values (";
		sql += "'" + vo.getCategoryName().replace("'","") + "')";
		RunSQL(sql);
		return true;
	}
	
	/******************카테고리를 업데이트한다******************************/
	public boolean categoryUpdate(CategoryVO vo)
	{
		if ( DBOpen() == false ) {return false;}
		String sql = "";
		sql += "UPDATE category ";
		sql += "SET cg_name = '" + vo.getCategoryName().replace("'","") + "' ";
		sql += "WHERE cg_no = " + vo.getCategoryNumber();
		RunSQL(sql);
		return true;
	}
	
	/******************카테고리를 확인한다******************************/
	public ArrayList<CategoryVO> categoryRead()
	{
		ArrayList<CategoryVO> categorysArrayList = null;
		String sql = "";
		
		sql += "select cg_no,cg_name ";
		sql += "from category ";

		if ( DBOpen() == false ) {return categorysArrayList;}
		if (!OpenQuery(sql))
		{
			CloseQuery();
			DBClose();
			return categorysArrayList;
		}

		categorysArrayList = new ArrayList<CategoryVO>();
		while (GetNext())
		{
			
			CategoryVO vo = new CategoryVO();
			vo.setCategoryNumber(GetValue("cg_no"));
			vo.setCategoryName(GetValue("cg_name"));
			categorysArrayList.add(vo);
			System.out.println(GetValue("cg_no"));
			System.out.println(GetValue("cg_name"));
		}
		
		CloseQuery();
		DBClose();
		return categorysArrayList;
		
	}
	
	/******************카테고리를 삭제한다***********************************/
	public void categoryDelete(CategoryVO vo)
	{
		if(DBOpen() == true) 
		{
			String sql  = "";
			sql += "DELETE FROM category WHERE cg_no = " + vo.getCategoryNumber();
			RunSQL(sql);
		}
	}
	
	
	
	/******************카테고리 이름을 조회한다******************************/
	public String categoryIndexName(CategoryVO vo)
	{
		String sql = "";
		if ( DBOpen() == true) 
		{
			sql += "SELECT cg_name ";
			sql += "FROM category ";
			sql += "WHERE cg_no = '" + vo.getCategoryNumber() + "'";
			OpenQuery(sql);
		}
		String sql_CategoryName = "";
		while (GetNext() == true)
		{
			sql_CategoryName = GetValue("cg_name");
		}
		
		return sql_CategoryName;
	}
	
	//******************모든 카테고리를 조회한다******************************//
	public boolean categoryIndex(CategoryVO vo)
	{
		if( DBOpen() == false) {return false;}
		String sql = "";
		sql += "SELECT cg_no ";
		sql += "FROM category ";
		sql += "ORDER BY t_no DESC ";
		sql += "limit (0,5)";
		return true;
	}
	
	
	public static void main(String[] args) 
	{
	
	}

}
