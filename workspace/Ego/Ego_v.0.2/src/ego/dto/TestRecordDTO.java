package ego.dto;
import java.util.ArrayList;

import ego.dbms.*;
import ego.vo.TestRecordVO;
public class TestRecordDTO extends DBManager
{
	/***************테스트기록을 INSERT한다********************/
	public boolean insertTestRecord(TestRecordVO vo)
	{
		if(DBOpen() == false) return false;
		String sql ="";
		sql += "INSERT INTO test_record ";
		sql += "(t_no,u_no,MBTI) ";
		sql += "VALUES ('"+ vo.getNo() +"','"+ vo.getU_no() +"','"+ vo.getMBTI() +"')";
		RunSQL(sql);
		System.out.println("insertsql => " + sql);
		return true;
	}
	
	
	/***************테스트기록을 SELECT한다********************/
	public ArrayList<TestRecordVO> Read(String no)
	{
		ArrayList<TestRecordVO> arylist = null;
		if(DBOpen() == false) return null;
		String sql ="";
		sql += "SELECT t.t_no, t.t_foldername, t.t_title, r.u_no, r.MBTI ";
		sql += "FROM test AS t ";
		sql += "INNER JOIN test_record AS r ";
		sql += "ON t.t_no = r.t_no ";
		sql += "where r.u_no = " + no;
		sql += " group by r.t_no  ";
		sql += " ORDER BY r.t_rno DESC ";
		if (!OpenQuery(sql))
		{
			CloseQuery();
			DBClose();
			return arylist;
		}
		arylist = new ArrayList<TestRecordVO>();
		
		while(GetNext() == true)
		{
			TestRecordVO vo = new TestRecordVO();
			vo.setNo(GetValue("t_no"));
			vo.setMBTI(GetValue("MBTI"));
			vo.setTest_record_number(GetValue("u_no"));
			vo.setFolder_name(GetValue("t_foldername"));
			vo.setTitle_name(GetValue("t_title"));
			arylist.add(vo);
			
		}
		CloseQuery();
		DBClose();	
		return arylist;
	}
	
	
	
	public static void main(String[] args) 
	{

	}

}
