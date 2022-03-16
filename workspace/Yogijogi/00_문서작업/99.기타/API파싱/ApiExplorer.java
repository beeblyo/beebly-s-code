import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.awt.List;
import java.io.BufferedReader;
import java.io.IOException;

public class ApiExplorer {
    public static void main(String[] args) throws IOException {

		try {
			
	    	String serviceKey = "ROhuaHnR8Ofn9HzWaoby0NNnptNhPdM31cLkOwWbiFWxuPkAXKKuY25Lm2LCDFbfGB02yp0DBQkOSnowWJkfKw%3D%3D";    
	    	String pageNo = "1";
	    	String numOfRows = "100";
	    	
	    	String result = "";
	    	
	        StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_cltur_fstvl_api"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*xml/json 여부*/
	        //urlBuilder.append("&" + URLEncoder.encode("fstvlNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*축제명*/
	        //urlBuilder.append("&" + URLEncoder.encode("opar","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*개최장소*/
	        //urlBuilder.append("&" + URLEncoder.encode("fstvlStartDate","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*축제시작일자*/
	        //urlBuilder.append("&" + URLEncoder.encode("fstvlEndDate","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*축제종료일자*/
	        //urlBuilder.append("&" + URLEncoder.encode("fstvlCo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*축제내용*/
	        //urlBuilder.append("&" + URLEncoder.encode("mnnst","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주관기관*/
	        //urlBuilder.append("&" + URLEncoder.encode("auspcInstt","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주최기관*/
	        //urlBuilder.append("&" + URLEncoder.encode("suprtInstt","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*후원기관*/
	        //urlBuilder.append("&" + URLEncoder.encode("phoneNumber","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*전화번호*/
	        //urlBuilder.append("&" + URLEncoder.encode("homepageUrl","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*홈페이지주소*/
	        //urlBuilder.append("&" + URLEncoder.encode("relateInfo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*관련정보*/
	        //urlBuilder.append("&" + URLEncoder.encode("rdnmadr","UTF-8") + "=" + URLEncoder.encode("전라북도", "UTF-8")); /*소재지도로명주소*/
	        //urlBuilder.append("&" + URLEncoder.encode("lnmadr","UTF-8") + "=" + URLEncoder.encode("전라북도", "UTF-8")); /*소재지지번주소*/
	        //urlBuilder.append("&" + URLEncoder.encode("latitude","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*위도*/
	        //urlBuilder.append("&" + URLEncoder.encode("longitude","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*경도*/
	        //urlBuilder.append("&" + URLEncoder.encode("referenceDate","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*데이터기준일자*/
	        //urlBuilder.append("&" + URLEncoder.encode("instt_code","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*제공기관코드*/
	        //urlBuilder.append("&" + URLEncoder.encode("instt_nm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*제공기관기관명*/

	        /* GET방식으로 전송해서 파라미터 받아오기*/
			URL url = new URL(urlBuilder.toString());
			
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        
	        BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
			}
			
			StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println("결과: " + sb.toString());
	        
	        result = sb.toString();
			
			// 문자열을 JSON으로 파싱합니다. 마지막 배열형태로 저장된 데이터까지 파싱해냅니다.
	        JSONParser parser = new JSONParser();
	        JSONObject obj = (JSONObject) parser.parse(result);
	        
	        // Top레벨 단계인 response 키를 가지고 데이터를 파싱합니다.
	        JSONObject parser_response = (JSONObject) obj.get("response");
	        // response 로 부터 body 찾아옵니다.
	        JSONObject parse_body = (JSONObject) parser_response.get("body");
	        // body 로 부터 items 받아옵니다.
	        JSONArray parse_items = (JSONArray) parse_body.get("items");
	        
	        // 객체형태로
	        // {"returnType":"json","clearDate":"--",.......},... 
	        for (int i=0;i< parse_items.size();i++) {
	            JSONObject item = (JSONObject) parse_items.get(i);
	            
	            Object fstvlNm        = item.get("fstvlNm");
				Object fstvlStartDate = item.get("fstvlStartDate");
				Object fstvlEndDate   = item.get("fstvlEndDate");
				Object homepageUrl    = item.get("homepageUrl");
				Object rdnmadr        = item.get("rdnmadr");
				Object latitude       = item.get("latitude");
				Object longitude      = item.get("longitude");

				if(rdnmadr.toString().split(" ")[0].equals("전라북도"))
				{
					System.out.println("=====================================");
					System.out.println("fstvlNm : " + fstvlNm);
					System.out.println("fstvlStartDate : " + fstvlStartDate);
					System.out.println("fstvlEndDate : " + fstvlEndDate);
					System.out.println("homepageUrl : " + homepageUrl);
					System.out.println("rdnmadr : " + rdnmadr);
					System.out.println("latitude : " + latitude);
					System.out.println("longitude : " + longitude);   
					System.out.println("=====================================");
				}
	        }

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
    }
}