package api;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.InputSource;

import java.io.*;

public class ApiExplorer {
	
    public static void main(String[] args){
    	
    	try {
			Exhibit();
			Show();
			Festival();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
    	
    	ApiDao Dao = new ApiDao();
    	ArrayList<ApiVo> alist = Dao.selectAllApi("E");
    	for(ApiVo item : alist) {
    		System.out.println(item.getAno());
    	}
    }
    
    public static void Festival() throws IOException  {
    	StringBuilder urlBuilder = new StringBuilder("http://openapi.jeonju.go.kr/rest/event/getEventList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=ROhuaHnR8Ofn9HzWaoby0NNnptNhPdM31cLkOwWbiFWxuPkAXKKuY25Lm2LCDFbfGB02yp0DBQkOSnowWJkfKw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode("축제", "UTF-8"));  /*공연행사명*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
      //xml -> json
        ApiDao dao = new ApiDao();
        ApiVo vo = null;
        try{
	        DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder         =  factory.newDocumentBuilder();
	        
	        Document document =  builder.parse(new InputSource(new StringReader(sb.toString())));
	        NodeList nodelist =  document.getElementsByTagName("list"); //key안의 value를 가져온다.
	        
	        //nodelist�쓽 �겕湲곕�� 援ы븯�젮硫� getLength()�씪�뒗 硫붿냼�뱶媛� �엳�쓬
	        Node textNode   =  nodelist.item(0).getChildNodes().item(0);
	        
	        //element�쓽 text �뼸湲�
	        System.out.println(textNode.getNodeValue());
	        
	        for (int i = 0; i < nodelist.getLength(); i++) {
                NodeList child = nodelist.item(i).getChildNodes();
                int childLength = child.getLength();
            	System.out.println("============================");
            	vo = new ApiVo();
                for (int j = 0; j < childLength; j++) {
                    Node node = child.item(j);
                    if(j == 2 || j == 7 || j == 11) continue;
                    if (node.getNodeType() == Node.ELEMENT_NODE) {
                        //System.out.println("Element Node Node Name = " + node.getNodeName());
                        //System.out.println("Element Node Text Content = " + node.getTextContent());
                    	System.out.println(node.getNodeName() + " => " + node.getTextContent());
                    }
                    if (node.getNodeType() == Node.TEXT_NODE) {
                        System.out.println("Text Node Node Name = " + node.getNodeName());
                        System.out.println("Text Node Text Content = " + node.getTextContent());
                    }
                    
                    if(j == 0) {
                    	vo.setAdmfee(node.getTextContent());
                    } else if (j == 1) {
                    	vo.setAge(node.getTextContent());
                    } else if (j == 3) {
                    	vo.setContent(node.getTextContent());
                    } else if (j == 4) {
                    	vo.setETime(node.getTextContent());
                    } else if (j == 5) {
                    	vo.setEndDay(node.getTextContent());
                    } else if (j == 6) {
                    	vo.setHostName(node.getTextContent());
                    } else if (j == 8) {
                    	vo.setMngTel(node.getTextContent());
                    } else if (j == 9) {
                    	vo.setOrgNm(node.getTextContent());
                    } else if (j == 10) {
                    	vo.setPlace(node.getTextContent());
                    } else if (j == 12) {
                    	vo.setStartDay(node.getTextContent());
                    } else if (j == 13) {
                    	vo.setSubject(node.getTextContent());
                    } else if (j == 14) {
                    	vo.setUrl(node.getTextContent());
                    }
                    vo.setAkind("F");
                }
                dao.insertApi(vo);
            	System.out.println("============================");
            }
	        
        
       }catch(Exception e){
    	   e.printStackTrace();
       }
    }
    
    public static void Show() throws IOException  {
    	StringBuilder urlBuilder = new StringBuilder("http://openapi.jeonju.go.kr/rest/event/getEventList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=ROhuaHnR8Ofn9HzWaoby0NNnptNhPdM31cLkOwWbiFWxuPkAXKKuY25Lm2LCDFbfGB02yp0DBQkOSnowWJkfKw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode("공연", "UTF-8"));  /*공연행사명*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
      //xml -> json
        ApiDao dao = new ApiDao();
        ApiVo vo = null;
        try{
	        DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder         =  factory.newDocumentBuilder();
	        
	        Document document =  builder.parse(new InputSource(new StringReader(sb.toString())));
	        NodeList nodelist =  document.getElementsByTagName("list"); //key안의 value를 가져온다.
	        
	        //nodelist�쓽 �겕湲곕�� 援ы븯�젮硫� getLength()�씪�뒗 硫붿냼�뱶媛� �엳�쓬
	        Node textNode   =  nodelist.item(0).getChildNodes().item(0);
	        
	        //element�쓽 text �뼸湲�
	        System.out.println(textNode.getNodeValue());
	        
	        for (int i = 0; i < nodelist.getLength(); i++) {
                NodeList child = nodelist.item(i).getChildNodes();
                int childLength = child.getLength();
            	System.out.println("============================");
            	vo = new ApiVo();
                for (int j = 0; j < childLength; j++) {
                    Node node = child.item(j);
                    if(j == 2 || j == 7 || j == 11) continue;
                    if (node.getNodeType() == Node.ELEMENT_NODE) {
                        //System.out.println("Element Node Node Name = " + node.getNodeName());
                        //System.out.println("Element Node Text Content = " + node.getTextContent());
                    	System.out.println(node.getNodeName() + " => " + node.getTextContent());
                    }
                    if (node.getNodeType() == Node.TEXT_NODE) {
                        System.out.println("Text Node Node Name = " + node.getNodeName());
                        System.out.println("Text Node Text Content = " + node.getTextContent());
                    }
                    
                    if(j == 0) {
                    	vo.setAdmfee(node.getTextContent());
                    } else if (j == 1) {
                    	vo.setAge(node.getTextContent());
                    } else if (j == 3) {
                    	vo.setContent(node.getTextContent());
                    } else if (j == 4) {
                    	vo.setETime(node.getTextContent());
                    } else if (j == 5) {
                    	vo.setEndDay(node.getTextContent());
                    } else if (j == 6) {
                    	vo.setHostName(node.getTextContent());
                    } else if (j == 8) {
                    	vo.setMngTel(node.getTextContent());
                    } else if (j == 9) {
                    	vo.setOrgNm(node.getTextContent());
                    } else if (j == 10) {
                    	vo.setPlace(node.getTextContent());
                    } else if (j == 12) {
                    	vo.setStartDay(node.getTextContent());
                    } else if (j == 13) {
                    	vo.setSubject(node.getTextContent());
                    } else if (j == 14) {
                    	vo.setUrl(node.getTextContent());
                    }
                    vo.setAkind("S");
                }
                dao.insertApi(vo);
            	System.out.println("============================");
            }
	        
        
       }catch(Exception e){
    	   e.printStackTrace();
       }
    }
    
    public static void Exhibit() throws IOException  {
    	String key = "ROhuaHnR8Ofn9HzWaoby0NNnptNhPdM31cLkOwWbiFWxuPkAXKKuY25Lm2LCDFbfGB02yp0DBQkOSnowWJkfKw%3D%3D"; //�씤利앺궎
    	int page   = 1; //페이지
    	
        StringBuilder urlBuilder = new StringBuilder("http://openapi.jeonju.go.kr/rest/event/getEventList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + key); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(""+page, "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode("전시", "UTF-8")); /*공연행사명*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
      //xml -> json
        ApiDao dao = new ApiDao();
        ApiVo vo = null;
        try{
	        DocumentBuilderFactory factory  =  DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder         =  factory.newDocumentBuilder();
	        
	        Document document =  builder.parse(new InputSource(new StringReader(sb.toString())));
	        NodeList nodelist =  document.getElementsByTagName("list"); //key안의 value를 가져온다.
	        
	        //nodelist�쓽 �겕湲곕�� 援ы븯�젮硫� getLength()�씪�뒗 硫붿냼�뱶媛� �엳�쓬
	        Node textNode   =  nodelist.item(0).getChildNodes().item(0);
	        
	        //element�쓽 text �뼸湲�
	        System.out.println(textNode.getNodeValue());
	        
	        for (int i = 0; i < nodelist.getLength(); i++) {
                NodeList child = nodelist.item(i).getChildNodes();
                int childLength = child.getLength();
            	System.out.println("============================");
            	vo = new ApiVo();
                for (int j = 0; j < childLength; j++) {
                    Node node = child.item(j);
                    if(j == 2 || j == 7 || j == 11) continue;
                    if (node.getNodeType() == Node.ELEMENT_NODE) {
                        //System.out.println("Element Node Node Name = " + node.getNodeName());
                        //System.out.println("Element Node Text Content = " + node.getTextContent());
                    	System.out.println(node.getNodeName() + " => " + node.getTextContent());
                    }
                    if (node.getNodeType() == Node.TEXT_NODE) {
                        System.out.println("Text Node Node Name = " + node.getNodeName());
                        System.out.println("Text Node Text Content = " + node.getTextContent());
                    }
                    
                    if(j == 0) {
                    	vo.setAdmfee(node.getTextContent());
                    } else if (j == 1) {
                    	vo.setAge(node.getTextContent());
                    } else if (j == 3) {
                    	vo.setContent(node.getTextContent());
                    } else if (j == 4) {
                    	vo.setETime(node.getTextContent());
                    } else if (j == 5) {
                    	vo.setEndDay(node.getTextContent());
                    } else if (j == 6) {
                    	vo.setHostName(node.getTextContent());
                    } else if (j == 8) {
                    	vo.setMngTel(node.getTextContent());
                    } else if (j == 9) {
                    	vo.setOrgNm(node.getTextContent());
                    } else if (j == 10) {
                    	vo.setPlace(node.getTextContent());
                    } else if (j == 12) {
                    	vo.setStartDay(node.getTextContent());
                    } else if (j == 13) {
                    	vo.setSubject(node.getTextContent());
                    } else if (j == 14) {
                    	vo.setUrl(node.getTextContent());
                    }
                    vo.setAkind("E");
                }
                dao.insertApi(vo);
            	System.out.println("============================");
            }
	        
        
       }catch(Exception e){
    	   e.printStackTrace();
       }

    }
}