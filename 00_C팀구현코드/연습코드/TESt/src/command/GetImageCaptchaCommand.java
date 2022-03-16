package command;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import common.PathNRedirect;

public class GetImageCaptchaCommand implements Command {

    @Override
    public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {

        // ���̹� ĸ�� API

        // 1) ĸ�� Ű �߱� ��û�ϱ�
        // 2) ĸ�� �̹��� ��û�ϱ�
        String clientId = "_P4PQXKZDyHqYNTNS5H2"; //���ø����̼� Ŭ���̾�Ʈ ���̵�";
        String clientSecret = "I_4OWOph3H"; //���ø����̼� Ŭ���̾�Ʈ ��ũ����";

        // 1) ĸ�� Ű �߱� ��û�ϱ�
        String code = "0"; // Ű �߱޽� 0,  ĸ�� �̹��� �񱳽� 1�� ����
        String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL, requestHeaders);
        // System.out.println(responseBody);  // {"key":"bgbl5MwSZRnQOllo"}
        // responseBody�� {"key":"bgbl5MwSZRnQOllo"}�� ���� ������ JSON ������

        // json-simple-1.1.1.jar�� �̿��ؼ� responseBody���� "bgbl5MwSZRnQOllo"�� ����.
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
            obj = (JSONObject)parser.parse(responseBody);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        // �Է°� ��(InputKeyCheckCommand)���� ĸ�� Ű�� �ʿ�� �ϹǷ�,
        // session�� �÷� �д�.
        // session�� request���� �˾Ƴ���.
        HttpSession session = request.getSession();
        session.setAttribute("key", (String)obj.get("key")); // #key session�� ����



        // 2) ĸ�� �̹��� ��û�ϱ�
        String key = (String)obj.get("key"); // https://openapi.naver.com/v1/captcha/nkey ȣ��� ���� Ű��
        // �̹��� ���� ���п�(�ƹ� Ű�� �ѱ�) String key = "aldfakjlkajgj;fljg;sl";
        String apiURL2 = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;

        // requestHeaders�� 1) ĸ�� Ű �߱� ��û���� �̹� ���������Ƿ� �� ������ �ʿ䰡 ����.
        /*
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        */

        // responseBody2
        // 1) ����: �̹��� ĸ���� �����Ǿ����ϴ�.
        // 2) ����: {"result":false,"errorMessage":"Invalid key.","errorCode":"CT001"}
        // String responseBody2 = get2(apiURL2, requestHeaders);

        // �������� ���� ĸ�� �̹��� ������ �����ǹǷ� ������ ���ϸ��� �˾ƾ� �Ѵ�.
        // responseBody2 -> filename
        String filename = get2(request, apiURL2, requestHeaders);

        // System.out.println(filename);

        PathNRedirect pathNRedirect = new PathNRedirect();
        pathNRedirect.setPath("login/loginPage.jsp");
        pathNRedirect.setRedirect(false);  // request�� directory, filename ����Ǿ� �����Ƿ� forward

        return pathNRedirect;

    }

    // 1) ĸ�� Ű �߱� ��û�� get() �޼ҵ�
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


    // 1) ĸ�� Ű �߱� ��û�� connect() �޼ҵ�
    // 2) ĸ�� �̹��� ��û�� connect() �޼ҵ�
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

    // 1) ĸ�� Ű �߱� ��û�� readBody() �޼ҵ�
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

    // 2) ĸ�� �̹��� ��û�� get2() �޼ҵ�
    private static String get2(HttpServletRequest request, String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // ���� ȣ��
                // getImage()�� request�� �����Ϸ��� get2() �޼ҵ尡 HttpServletRequest request�� �޾ƿ;� �Ѵ�.
                // ����: get2(String apiUrl, Map<String, String> requestHeaders) {
                // ����: get2(HttpServletRequest request, String apiUrl, Map<String, String> requestHeaders) {
                return getImage(request, con.getInputStream());
            } else { // ���� �߻�
                return error(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API ��û�� ���� ����", e);
        } finally {
            con.disconnect();
        }
    }

    // 2) ĸ�� �̹��� ��û�� getImage() �޼ҵ�
    private static String getImage(HttpServletRequest request, InputStream is){
        int read;
        byte[] bytes = new byte[1024];
        // ������ �̸����� ���� ����(X)
        // ���� �ð�: timestamp���� ���� ����(O)
        String filename = Long.valueOf(new Date().getTime()).toString();

        // ĸ�� �̹����� ����� storage ���丮�� ��θ� �˾Ƴ���.
        String directory = "storage";

        // HttpServletRequest request�� �־�� realPath�� ���� �� �ִ�.
        // ���� execute() �޼ҵ忡�Լ� HttpServletRequest request�� �޾� �´�.
        // ����: getImage(InputStream is) { ... }
        // ����: getImage(HttpServletRequest request, InputStream is)       
        String realPath = request.getServletContext().getRealPath(directory);

        // storage ���丮�� �� ����� ������ ����� �ִ� �ڵ�
        File dir = new File(realPath);  // File dir���� storage ���丮 ������ ����ȴ�.
        if ( !dir.exists() ) {  // dir(storage ���丮)�� ������
            dir.mkdirs();  // �ش� ���丮(storage ���丮)�� �����϶�.
        }

        // storage ���丮 ��θ� �����ϵ��� File f�� �����Ѵ�.
        // ����: File f = new File(filename + ".jpg");
        // ����: File f = new File(realPath, filename + ".jpg");
        File f = new File(realPath, filename + ".jpg");

        try(OutputStream outputStream = new FileOutputStream(f)){
            f.createNewFile();
            while ((read = is.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }


            // directory(�����)�� filename�� JSP(�α���ȭ��)���� Ȯ���� �� �ֵ���
            // request�� ������ �д�.
            // GetImageCaptchaCommand�� execute() �޼ҵ�� PathNRedirect�� ��ȯ�ϴµ�,
            // �� �� ��ȯ����� forward�̴�. (request�� ������ ������ ���ؼ�)
            request.setAttribute("filename", filename + ".jpg");
            request.setAttribute("directory", directory);


            // return "�̹��� ĸ���� �����Ǿ����ϴ�.";
            return filename;

        } catch (IOException e) {
            throw new RuntimeException("�̹��� ĸ�� ���� ������ ���� �߽��ϴ�.",e);
        }
    }

    // 2) ĸ�� �̹��� ��û�� error() �޼ҵ�
    private static String error(InputStream body) {
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