<%@page import="sports.com.util.AES256Util"%>
<%@page import="sports.com.util.CmmUtil"%>
<%@page import="sports.com.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDTO uDTO = (UserDTO)request.getAttribute("uDTO");
	if(uDTO == null){
		uDTO = new UserDTO();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>아이디 : <%=AES256Util.strDecode(CmmUtil.nvl(uDTO.getUser_id())) %></h1>
<a href="/user/user_login.do">로그인</a><br/>
<a href="/user/pw_found.do">비밀번호 찾기</a>
</body>
</html>