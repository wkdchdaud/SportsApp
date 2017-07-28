<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% String decoded_result = (String) request.getAttribute("decoded_result"); %>

<%=decoded_result %>
<br/><br/>

<%
JSONParser parser = new JSONParser();
Object obj = parser.parse( decoded_result );
JSONObject jsonObj = (JSONObject) obj;

String[] level = (String[]) jsonObj.get("level");

%>

<%=level %>
</body>
</html>