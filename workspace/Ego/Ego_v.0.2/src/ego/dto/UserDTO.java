package ego.dto;
import java.util.ArrayList;

import ego.dbms.DBManager;
import ego.util.util;
import ego.vo.*;

public class UserDTO extends DBManager
{
	public final static int ID_ERROR      = 0;
	public final static int DUPLICATE     = 1;
	public final static int NOT_DUPLICATE = 2;
	
	//ȸ�� ���̵� �ߺ� �˻�
	//���ϰ� : ERROR - ����, DUPLICATE - �ߺ�, NOT_DUPLICATE - �ߺ��ƴ� 
	public int IsDuplicate(String id)
	{
		//�����ͺ��̽��� �����Ѵ�.
		if(this.DBOpen() == false) 
		{
			return ID_ERROR;			
		}
		
		//�ߺ��˻� SQL�� �����Ѵ�.
		String sql = "";
		sql  = "select u_id ";
		sql += "from user ";
		sql += "where u_id = '" + id +"' ";
		this.OpenQuery(sql);
		if(this.GetNext() == true)
		{
			//ID�� �ߺ���
			this.CloseQuery();
			this.DBClose();
			return DUPLICATE;
		}			
		this.CloseQuery();
		//�����ͺ��̽� ������ �����Ѵ�.
		this.DBClose();
		return NOT_DUPLICATE;
	}
	
	//ȸ�� ���� ó��
	//���ϰ� : true-��ϿϷ�, flag-����
	public boolean Insert(UserVO vo)
	{	
		//�����ͺ��̽��� �����Ѵ�.
		if(this.DBOpen() == false) return false;
		
		//���ð� �Ҵ�
		String mbti = "";
		String keyword = "";
		if(vo.getMbti() != null) mbti = vo.getMbti();
		if(vo.getKeyword() != null) keyword = vo.getKeyword();
		
		//user ���̺��� Insert�ϴ� ������ �����.
		String sql = "";
		sql  = "";
		sql += "insert into user (u_id,u_email,u_password,u_nickname,u_gender,u_birthdate,u_retire,u_host,u_mbti,u_keyword) ";
		sql += "values (";
		sql += "'" + vo.getId() + "',";
		sql += "'" + vo.getEmail() + "',";
		sql += "md5('" + vo.getPw() + "'),";
		sql += "'" + vo.getNickname() + "',";
		sql += "'" + vo.getGender() + "',";
		sql += "'" + vo.getBdate() + "',";
		sql += "'" + vo.getRetire() + "',";		
		sql += "'" + vo.getHost() + "',";
		sql += "'" + mbti + "',";
		sql += "'" + keyword + "')";
		this.RunSQL(sql);		
		
		
		//��ϵ� ���̵��� ��ȣ�� ��´�.
		sql = "select last_insert_id() as u_no ";
		this.OpenQuery(sql);
		this.GetNext();
		String uno = this.GetValue("u_no");
		vo.setNo(uno);
		this.CloseQuery();		
		
		//Ű����
	//	ArrayList<KeywordVO> ary = vo.getKword();
	
		
		//�����ͺ��̽� ������ �����Ѵ�.
		this.DBClose();
		return true;
	}
	
	//ȸ�������� �����´�.
	public UserVO Read(String no)
	{
		UserVO vo = null;
		String sql = "";
		
		if(this.DBOpen() == false) return vo;
		
		sql  = "select * from user ";
		sql += "where u_no = '" + no + "' ";
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			this.CloseQuery();
			//�����ͺ��̽� ������ �����Ѵ�.
			this.DBClose();			
			return vo;			
		}
		vo = new UserVO();
		vo.setId(GetValue("u_id"));
		vo.setNo(GetValue("u_no"));
		vo.setBdate(GetValue("u_birthdate"));
		vo.setEmail(GetValue("u_email"));
		vo.setGender(GetValue("u_gender"));
		vo.setNickname(this.GetValue("u_nickname"));
		vo.setMbti(this.GetValue("u_mbti"));
		this.CloseQuery();
		
		this.DBClose();			
		return vo;
	}
	
	public ArrayList<UserVO> testRead()
	{
		return testRead("15");
	}
	
	public ArrayList<UserVO> testRead(String limit)
	{
		return testRead(limit,"N");
	}
	
	public ArrayList<UserVO> testRead(String limit, String retire)
	{
		return testRead(limit,retire,"");
	}
	
	public ArrayList<UserVO> testRead(String limit, String retire, String no)
	{
		return testRead(limit,"0",retire,no);
	}
	
	//ȸ�������� �����´�.
	public ArrayList<UserVO> testRead(String limit,String limit_start, String retire, String no)
	{
		ArrayList<UserVO> vos = null;
		String sql = "";

		sql  = "select u_no,u_id,u_email,u_nickname,u_gender,u_birthdate,u_mbti,u_keyword,u_retire ";
		sql += "from user ";
		if(!retire.equals("")) sql += "where u_retire = '" + retire + "' ";
		if(!no.equals("")) sql += "and u_no = " + no ;
		sql += "order by u_no desc ";
		if(!limit.equals("")) sql += "limit " + limit_start + "," + limit;
		
		if( DBOpen() == false) return vos;
		if (!OpenQuery(sql))
		{
			CloseQuery();
			DBClose();
			return vos;
		}
		
		vos = new ArrayList<UserVO>();
		while (GetNext())
		{
			UserVO vo = new UserVO();
			vo.setNo(GetValue("u_no"));
			vo.setId(GetValue("u_id"));
			vo.setEmail(GetValue("u_email"));
			vo.setNickname(GetValue("u_nickname"));
			vo.setGender(GetValue("u_gender"));
			vo.setBdate(GetValue("u_birthdate"));
			vo.setMbti(GetValue("u_mbti"));
			vo.setKeyword(GetValue("u_keyword"));
			vo.setRetire(GetValue("u_retire"));
			
			vos.add(vo);
			vo.PrintInfo();
		}
		
		CloseQuery();
		DBClose();	
		return vos;
	}
	
	//ȸ�������� �����Ѵ�.
	public boolean update(UserVO vo)
	{
		String sql = "";
		
		if(this.DBOpen() == false) return false;
		
		sql  = "select * from user ";
		sql += "where u_no = '" + vo.getNo() + "' ";
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			this.CloseQuery();
			//�����ͺ��̽� ������ �����Ѵ�.
			this.DBClose();			
			return false;			
		}
		
		vo.setNickname(vo.getNickname());
		if(!(vo.getPw() == null || vo.getPw() == "")) vo.setPw(vo.getPw());
		vo.setMbti(vo.getMbti());
		vo.setKeyword(vo.getKeyword());
		this.CloseQuery();
		
		sql  = "";
		sql += "update user set ";
		sql += "u_nickname = '" + vo.getNickname() + "', ";
		if(!(vo.getPw() == null || vo.getPw().equals(""))) sql += "u_password = md5('" + vo.getPw() + "'), ";
		sql += "u_mbti = '" + vo.getMbti() + "', ";
		sql += "u_keyword = '" + vo.getKeyword() + "' ";
		sql += "where u_id = '" + vo.getId() + "' ";
		if(RunSQL(sql) == false) return false;
		
		this.DBClose();			
		return true;
	}
	
	//ȸ�������� �����´�.
	public UserVO pwCheck(String id, String pw)
	{
		UserVO vo = null;
		String sql = "";
		
		if(this.DBOpen() == false) return vo;
		
		sql  = "select * from user ";
		sql += "where u_id = '" + id + "' ";
		sql += "and u_password = md5('" + pw + "') ";
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			this.CloseQuery();
			//�����ͺ��̽� ������ �����Ѵ�.
			this.DBClose();
			return vo;
		}
		vo = new UserVO();
		vo.setNo(this.GetValue("u_no"));
		vo.setId(id);
		vo.setEmail(this.GetValue("u_email"));
		vo.setNickname(this.GetValue("u_nickname"));
		vo.setGender(this.GetValue("u_gender"));
		vo.setBdate(this.GetValue("u_birthdate"));
		this.CloseQuery();
		
		this.DBClose();			
		return vo;
	}
	
	//�α��� ó���Ѵ�.
	//���ϰ� : null - �α��� ����, UserVO - �α��� ����
	public UserVO Login(String id,String pw)
	{
		UserVO vo = null;
		
		//�����ͺ��̽��� �����Ѵ�.
		//�����ͺ��̽��� �����Ѵ�.
		if(this.DBOpen() == false) return vo;
		
		//id/pw�� �̿��Ͽ� �α��� ������ �����´�.	
		String sql = "";
		sql  = "select u_no,u_nickname,u_email,u_gender,u_birthdate,u_mbti,u_keyword,u_retire,u_host ";
		sql += "from user ";
		sql += "where u_id = '" + id + "' ";
		sql += "and u_password = md5('" + pw + "') ";
		sql += "and u_retire = 'N' ";
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			this.CloseQuery();
			//�����ͺ��̽� ������ �����Ѵ�.
			this.DBClose();
			return vo;
		}
		//�α��� ����� VO�� �����Ѵ�.
		vo = new UserVO();
		vo.setNo(this.GetValue("u_no"));
		vo.setId(id);
		vo.setEmail(this.GetValue("u_email"));
		vo.setNickname(this.GetValue("u_nickname"));
		vo.setGender(this.GetValue("u_gender"));
		vo.setBdate(this.GetValue("u_birthdate"));
		vo.setMbti(this.GetValue("u_mbti"));
		vo.setKeyword(this.GetValue("u_keyword"));
		vo.setRetire(this.GetValue("u_retire"));
		vo.setHost(this.GetValue("u_host"));
		vo.PrintInfo();
		this.CloseQuery();
		
		//�����ͺ��̽� ������ �����Ѵ�.
		this.DBClose();
		return vo;		
	}
}