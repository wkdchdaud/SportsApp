package sports.com.controller.admin;


import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import sports.com.dto.DeliveryDTO;
import sports.com.util.CmmUtil;

@Controller
public class DeliveryController {
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="admin/delivery/delivery_detail", method=RequestMethod.GET)
	public String deliveryDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		
        String url = "http://tracking.sweettracker.net/tracking"; //서비스URL
        String key = "X12Wsgl4c8NuVRBikX2T4g"; //신청해서 받은 키
        String code = "04";
        String invoice = "610154387133";
        
        String furl = String.format("%s/?t_key=%s&t_code=%s&t_invoice=%s", url, key, code, invoice);
        System.out.println(furl);
        URL obj = new URL(furl);
        HttpURLConnection httpConn  = (HttpURLConnection) obj.openConnection();

        // 전송방식 GET 지정
        httpConn .setRequestMethod("GET");

        // 요청헤더 추가
        httpConn .setRequestProperty("User-Agent", "Mozilla/5.0");
        httpConn .setRequestProperty("Accept", "application/json");
        
        int responseCode = httpConn.getResponseCode();
        
        // 응답코드 확인(정상호출시 200)
        System.out.println("Response Code : " + responseCode);
        
        BufferedReader in = new BufferedReader(
                new InputStreamReader(httpConn.getInputStream()));
        String inputLine;
        StringBuffer response2 = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response2.append(inputLine);
        }
        in.close();
        String val = response2.toString();
        //결과 확인
        System.out.println(response2.toString());
        
		
        
        String decoded_result = new String(val.getBytes("UTF-8"), "UTF-8");
        System.out.println(" 값 : " + decoded_result);
		
        model.addAttribute("decoded_result",decoded_result);
        model.addAttribute("code",code);
        
        return "/admin/delivery/delivery_detail";
	}

	

}

