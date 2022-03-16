package Test;
import java.util.*;

public class TestData {

	
	public static void main(String[] args) 
	{
		//<div>class스타일 opacity : 0; 을 준다
		String data = 
		"이성 사이에 진정한 친구는 있다, 없다?:이성 사이에 친구가 어딨어? 절대 없어<div class='answer_type'>F N</div>:친구 있지, 절대 이성으로만 안 보일뿐<div class='answer_type'>F</div>:" + 
		"좋아하는 사람이 생겨 연락하고자 한다 당신은 어떻게?:바로 먼저 연락한다<div class='answer_type'>N</div>:언제 연락할지, 어떻게 말할지 심사숙고하여 연락한다<div class='answer_type'>I L</div>:" + 
		"당신의 고백 스타일은?:호감이 보이면 바로 고백한다<div class='answer_type'>F I</div>:상대방이 고백할 때까지 기다린다<div class='answer_type'>F</div>:" + 
		"호감가는 고백 멘트를 고른다면?:박력 그 자체, \"야 나랑 사귀자\"<div class='answer_type'>F</div>:센스있는 \"우리 내일은 연인으로 만날까요\"<div class='answer_type'>I</div>";
		
		
		String[] firstAry = data.split(":");
		
		/*******************질문************************/
		for(int i = 0; i<firstAry.length; i+=3)
		{
			System.out.println(firstAry[i]);
		}
		System.out.println("======================>");
		
		/*******************답변1************************/
		for(int i = 1; i<firstAry.length; i+=3)
		{
			System.out.println(firstAry[i]);
		}
		System.out.println("======================");
		
		/*******************답변2************************/
		for(int i = 2; i<firstAry.length; i+=3)
		{
			System.out.println(firstAry[i]);
		}
		
		System.out.println("======================");
		
		
		
		/*******************결과값(점수)얻는 과정************************/
		//(1)특정 답변을 선택을 경우, 답변의 결과=타입값을 확인하고 result_value 객체에 값=점수1을 넣는다
		String s = firstAry[1];
		System.out.println(s);
		TestResultValueVO result_value = new TestResultValueVO();
		
		if (s.contains("I"))
		{
			result_value.setI(1);
		}if ( s.contains("N"))
		{
			result_value.setN(1);
		}if (s.contains("F"))
		{
			result_value.setF(1);
		}if (s.contains("L"))
		{
			result_value.setL(1);
		}
			
	
		
		/*
		System.out.println("I => " + result_value.getI());
		System.out.println("N => " + result_value.getN());
		System.out.println("F => " + result_value.getF());
		System.out.println("L => " + result_value.getL());
		*/
	
		
		
		
		Integer a = (int)(Math.random()*100) +1 ;
		Integer b = (int)(Math.random()*100) +1 ;
		Integer c = (int)(Math.random()*100) +1 ;
		Integer d = (int)(Math.random()*100) +1 ;
		Integer[] resultValueAry = new Integer[] {a,b,c,d};
		System.out.println( " a = > " + a);
		System.out.println( " b = > " + b);
		System.out.println( " c = > " + c);
		System.out.println( " d = > " + d);
		
		/**************테스트 결과값 배열에서 최대값 구하기***********************/
		//Integer[] resultValueAry = new Integer[]
		//{result_value.getI(),result_value.getN(),result_value.getF(),result_value.getL()};
		
		Integer max = resultValueAry[0];
		
		for(int i= 0 ; i<resultValueAry.length ; i++) 
		{
			if(resultValueAry[i]>max) 
			{
				max = resultValueAry[i];
			}
		}
		System.out.println("max => " + max);
		
		/*********************첫번째 최대값 위치 검사*************************/
		boolean val = contains(resultValueAry, max);
		
		int firstMaxindex = Arrays.binarySearch(resultValueAry, max);
		if(firstMaxindex == -5) { firstMaxindex = 0; }
		if(firstMaxindex == -2) { firstMaxindex = 1; }
		if(firstMaxindex == -3) { firstMaxindex = 2; }
		if(firstMaxindex == -4) { firstMaxindex = 3; }
		
		System.out.println("firstMaxindex => " + firstMaxindex + " 값은 => " + resultValueAry[firstMaxindex]);
		/*********************두번째 최댓값 만들기*************************/
		
		Integer max2 = -1;
		for(int i= 0 ; i<resultValueAry.length ; i++) 
		{
			if( i == firstMaxindex)
			{
				System.out.println("첫번째 최대값은 =>" + resultValueAry[i]);
				continue;
			}
			if(resultValueAry[i] > max2)
			{
				max2 = resultValueAry[i];
			}
			
		}System.out.println("두번째 최대값은 => " + max2);
		
		
		/*********************두번째 최댓값 위치검사*************************/
		boolean val2 = contains(resultValueAry, max2);
		
		//int secondMaxindex = Arrays.binarySearch(resultValueAry, max2);
		int secondMaxindex = Arrays.asList(resultValueAry).indexOf(max2);
		
		//if(secondMaxindex == -4) { secondMaxindex = 0; }
		//if(secondMaxindex == -2) { secondMaxindex = 3; }
		//if(secondMaxindex == -3) { secondMaxindex = 0; }

		System.out.println("secondMaxindex => " + secondMaxindex + " 값은 => " + resultValueAry[secondMaxindex]);
		/*******************두가지 최대값으로 결과값 도출하기**********************/
		
		String result_yourtype = "";
		if (firstMaxindex == 0) { result_yourtype = "I";}
		if (firstMaxindex == 1) { result_yourtype = "N";}
		if (firstMaxindex == 2) { result_yourtype = "F";}
		if (firstMaxindex == 3) { result_yourtype = "L";}
		
		System.out.println("result_yourtype_first => " + result_yourtype);

		if (secondMaxindex == 0) { result_yourtype = result_yourtype + "I";}
		if (secondMaxindex == 1) { result_yourtype = result_yourtype + "N";}
		if (secondMaxindex == 2) { result_yourtype = result_yourtype + "F";}
		if (secondMaxindex == 3) { result_yourtype = result_yourtype + "L";}	
		
		System.out.println("result_yourtype_full => " + result_yourtype);
		
		/*******************결과값으로 결과 내용 얻기**********************/
		
		if(result_yourtype.contentEquals("IN") || result_yourtype.contentEquals("NI")) 
		{ }//IN타입
		if(result_yourtype.contentEquals("IF") || result_yourtype.contentEquals("FI")) 
		{ }//IF타입
		if(result_yourtype.contentEquals("IL") || result_yourtype.contentEquals("LI")) 
		{ }//IL타입
		if(result_yourtype.contentEquals("NF") || result_yourtype.contentEquals("FN")) 
		{ }//NF타입
		if(result_yourtype.contentEquals("NL") || result_yourtype.contentEquals("LN")) 
		{ }//NL타입
		if(result_yourtype.contentEquals("FL") || result_yourtype.contentEquals("LF")) 
		{ }//FL타입
		if(result_yourtype.contentEquals("II")) 
		{ }//II타입
		if(result_yourtype.contentEquals("NN")) 
		{ }//NN타입
		if(result_yourtype.contentEquals("FF")) 
		{ }//FF타입
		if(result_yourtype.contentEquals("LL")) 
		{ }//LL타입
		
		
		
		
		
		
		
		
		
    }
    
	
	
	
	public static boolean contains(final Integer[] ary, final Integer key) 
    {
        boolean t = Arrays.asList(ary).contains(key);
        return t;
    }

}
