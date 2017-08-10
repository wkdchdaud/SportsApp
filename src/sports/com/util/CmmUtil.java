package sports.com.util;

import java.text.DecimalFormat;

public class CmmUtil {
	
	public static String nvl(String str, String chg_str) {
		String res;
		
		if (str == null) {
			res = chg_str;
		} else if (str.equals("")) {
			res = chg_str;
		} else {
			res = str;
		}
		return res;
	}
	
	public static String nvl(String str) {
		return nvl(str,"");
	}
	
	public static String checked(String str, String com_str) {
		if (str.equals(com_str)) {
			return " checked";
		} else {
			return "";
		}
	}
	
	public static String checked(String[] str, String com_str) {
		for (int i=0;i<str.length;i++) {
			if (str[i].equals(com_str))
				return " checked";
		}
		return "";
	}
	
	public static String select(String str,String com_str) {
		if (str.equals(com_str)) {
			return " selected";
		} else {
			return "";
		}
	}

	public static String getNan() {
		String nansu = "";
		int[] rd1 = new int[3];
		int[] rd2 = new int[3];
		
		int cnt1=0,cnt2=0;
		for(int i=0;i<rd1.length;i++){
			rd1[i] = (int)(Math.random()*10);
			rd2[i] = (int)(Math.random()*26);
		}
		
		while(cnt1<=2 && cnt2<=2){
			if(Math.random()*100 > Math.random()*100){
				nansu += rd1[cnt1];
				cnt1++;
			}else{
				char a = (char) ('a' + rd2[cnt2]);
				nansu += a;
				cnt2++;
			}
		}
		
		while(cnt1<=2 || cnt2<=2){
			if(cnt1==3){
				char a = (char) ('a' + rd2[cnt2]);
				nansu += a;
				cnt2++;
			}else{
				nansu += rd1[cnt1];
				cnt1++;
			}
		}
		System.out.println("난수난수"+nansu);
		return nansu;
	}
	
	public static String viewComma(String str) {

		Double dStr = Double.parseDouble(str);
		DecimalFormat df = new DecimalFormat("#,##0");

		return df.format(dStr);
	}
}