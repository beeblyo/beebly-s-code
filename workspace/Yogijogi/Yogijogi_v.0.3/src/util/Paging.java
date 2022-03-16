package util;

import model.*;

//게시판 페이징 클래스
public class Paging 
{
	//페이징을 위한 변수 선언
	private int total   = 0;  //전체 게시물 갯수
	private int maxpage = 0;  //최대 페이지 갯수
	private int curpage = 0;  //현재 페이지 번호
	private int startBlock = 0; //페이징 시작 블럭 번호
	private int endBlock   = 0; //페이징 끝 블럭 번호
	private int limit = 0;      //리미트 값
	
	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getTotal() {
		return total;
	}
	
	public void setTotal(int total,int curpage, int limit) 
	{
		this.total   = total;
		this.curpage = curpage;
		this.limit = limit;

		//최대 페이지 갯수를 계산한다.
		maxpage = total / limit;
		if( total % limit != 0) maxpage++;
		
		//페이징 시작블럭번호와 끝블럭 번호를 계산한다.
		startBlock = ( (curpage - 1)  / limit) * limit + 1;
		endBlock   = startBlock + limit - 1; 	
		
		//endBlock 이 최대 페이지 번호보다 크면 안됨.
		if( endBlock > maxpage)
		{
			//예: maxpage가 22인데, endBlock이 30이면 endBlock을 22로 변경
			endBlock = maxpage;
		}
	}
	
	public int getMaxpage() {
		return maxpage;
	}
	
	public int getCurpage() {
		return curpage;
	}
	
	public int getStartBlock() {
		return startBlock;
	}
	
	public int getEndBlock() {
		return endBlock;
	}	

	
}