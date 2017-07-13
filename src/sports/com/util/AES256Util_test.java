package sports.com.util;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


public class AES256Util_test {
	public static void main(String[] args) {
		String clientId = "8BOkMway7WSuS9zzGs8K";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "uRmXgQ3e7V";// 애플리케이션 클라이언트 시크릿값";
		String code_key = "";
		String tempname = "";
		
		try {
            String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
            String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            JSONParser parser = new JSONParser();
            JSONObject jsonOb = (JSONObject) parser.parse(response.toString());
            code_key = (String)jsonOb.get("key");
        } catch (Exception e) {
            System.out.println(e);
        }
		
		try {
			String key = code_key; // https://openapi.naver.com/v1/captcha/nkey
										// 호출로 받은 키값
			String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				InputStream is = con.getInputStream();
				int read = 0;
				byte[] bytes = new byte[1024];
				// 랜덤한 이름으로 파일 생성
				tempname = Long.valueOf(new Date().getTime()).toString();
				File f = new File("C:\\captcha\\" + tempname + ".jpg");
				f.createNewFile();
				OutputStream outputStream = new FileOutputStream(f);
				while ((read = is.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
				is.close();
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				System.out.println("else : " + response.toString());
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		System.out.println(code_key);
		System.out.println(tempname);
	}
}