package command;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import common.PathNRedirect;

public class InputKeyCheckCommand implements Command {

    @Override
    public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {

        String clientId = "_P4PQXKZDyHqYNTNS5H2";  //���ø����̼� Ŭ���̾�Ʈ ���̵�";
        String clientSecret = "I_4OWOph3H";  //���ø����̼� Ŭ���̾�Ʈ ��ũ����";

        String code = "1"; // Ű �߱޽� 0,  ĸ�� �̹��� �񱳽� 1�� ����

        // session���� key �������� �߱� ���� ĸ�� �߱� Ű�� �� �� �ִ�.
        HttpSession session = request.getSession();
        String key = (String)session.getAttribute("key");  // ĸ�� Ű �߱޽� ���� Ű��
        String value = request.getParameter("input_key");  // ����ڰ� �Է��� ĸ�� �̹��� ���ڰ�
        String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code + "&key=" + key + "&value=" + value;

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL, requestHeaders);

        System.out.println(responseBody);
        // responseBody
        // ����: {"result":true,"responseTime":21.39}
        // ����: {"result":false,"responseTime":5.76}

        // result�� responseBody���� ������.
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
            obj = (JSONObject)parser.parse(responseBody);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        boolean result = (boolean)obj.get("result");


        // loginResult.jsp�� result��(true, false)�� ������ ���ؼ�
        // request�� result�� ������ �д�. �׸��� forward �Ѵ�.
        request.setAttribute("result", result);

        PathNRedirect pathNRedirect = new PathNRedirect();
        pathNRedirect.setPath("login/loginResult.jsp");
        pathNRedirect.setRedirect(false);  // forward

        return pathNRedirect;

    }

    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // ���� ȣ��
                return readBody(con.getInputStream());
            } else { // ���� �߻�
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API ��û�� ���� ����", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL�� �߸��Ǿ����ϴ�. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("������ �����߽��ϴ�. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API ������ �дµ� �����߽��ϴ�.", e);
        }
    }

}