<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="sports.com.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	JSONObject jsonObj = new JSONObject();
	String msg = CmmUtil.nvl((String)request.getAttribute("msg"));
	String json = "{\"msg\" :\"" + msg + "\"}";
	out.print(json);
	return;
%>