<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String result = (String) request.getAttribute("decoded_result");
		String code = (String) request.getAttribute("code");
		String company = "";
		
		if(code.equals("01")){
			company = "우체국택배";
		}else if(code.equals("02")){
			company = "이노지스";
		}else if(code.equals("04")){
			company = "CJ대한통운";
		}else if(code.equals("05")){
			company = "한진택배";
		}else if(code.equals("08")){
			company = "현대택배";
		}else if(code.equals("37")){
			company = "범한판토스";
		}else if(code.equals("31")){
			company = "스카이로지스";
		}else if(code.equals("06")){
			company = "로젠택배";
		}
			
	%>


	<%
	
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(result);
		
		out.print("obj : "+ obj);
		
		JSONObject jsonObj = (JSONObject) obj;
		
		out.print("jsonObj : "+ jsonObj);
		
		String invoiceNo = (String) jsonObj.get("invoiceNo");//송장번호
		String itemName = (String) jsonObj.get("itemName");//상품명
		String completeYN = (String) jsonObj.get("completeYN");//배송완료여부
		String recipient = (String) jsonObj.get("recipient");//받는 사람
		String receiverAddr = (String) jsonObj.get("receiverAddr");//주소
		
		
		JSONArray trackingDetails = (JSONArray) jsonObj.get("trackingDetails");
		out.print("trackingDetails : "+ trackingDetails);

		
	
		
	
	%>
<center>
<h2>배송정보</h2>
<table border="1">
	<tr>
		<td>받으시는분</td>
		<td><%=recipient %></td>
	</tr>
	<tr>
		<td>상품명</td>
		<td><%=itemName %></td>
	</tr>
	<tr>
		<td>택배사</td>
		<td><%=company %></td>
	</tr>
	<tr>
		<td>운송장번호</td>
		<td><%=invoiceNo%></td>
	</tr>
	
</table>
</center>

<br/><br/>
<hr/>

<center>
<h2>배송 상세현황</h2>
<table border="1">
	<tr>
		<td>일자</td>
		<td>터미널명</td>
		<td>상품배송상태</td>
		<td>지점 번호</td>
		<td>담당자 번호</td>
		<td>택배사원</td>
	</tr>
	<% for (int i = 0; i < trackingDetails.size(); i++){
	      JSONObject order = (JSONObject)trackingDetails.get(i); %>
	 <tr>
	 	<td><%=order.get("timeString") %></td> 
	 	<td><%=order.get("where")  %></td>   
	 	<td><%=order.get("kind")  %></td>	
	 	<td><%=order.get("telno")  %></td>
	 	<td><%=order.get("telno2") %></td>
	 	<td><%=order.get("manName") %></td>
	 </tr> 
	<%} %>      
</table>
</center>
</body>
</html>