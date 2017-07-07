<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sports.com.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<UserDTO> rList = (List<UserDTO>)request.getAttribute("rList");
	if(rList == null){
		rList = new ArrayList<UserDTO>();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<thead>
		<tr>
			<td>회원번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>연락처</td>
		</tr>
	</thead>
	<tbody>
		<%
			Iterator<UserDTO> it = rList.iterator();
			while(it.hasNext()){
				UserDTO uDTO = it.next();
				if(uDTO == null){
					uDTO = new UserDTO();
				}
		%>
		<tr>
			<td><%=uDTO.getUser_no() %></td>
			<td><a href="/user/user_info.do?user_no=<%=uDTO.getUser_no()%>"><%=uDTO.getUser_id() %></a></td>
			<td><%=uDTO.getUser_name() %></td>
			<td><%=uDTO.getEmail() %></td>
			<td><%=uDTO.getTel() %></td>
		</tr>
		<% }%>
	
	</tbody>
</table>
</body>
</html>