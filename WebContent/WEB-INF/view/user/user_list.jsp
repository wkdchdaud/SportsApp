<%@page import="sports.com.util.AES256Util"%>
<%@page import="sports.com.util.CmmUtil"%>
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
<form name="f" action="/user/user_list.do" method="post">
	<select name="s_type" >
		<option value="no">선택하세요</option>
		<option value="id">아이디</option>
		<option value="name">이름</option>
		<option value="email">이메일</option>
		<option value="tel">연락처</option>
	</select>
	<input type="text" name="s_text"/>
	<input type="submit" value="검색"/>
</form>
<hr/>
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
			<td><%=CmmUtil.nvl(uDTO.getUser_no()) %></td>
			<td><a href="/user/user_info.do?user_no=<%=CmmUtil.nvl(uDTO.getUser_no())%>"><%=AES256Util.strDecode(CmmUtil.nvl(uDTO.getUser_id())) %></a></td>
			<td><%=AES256Util.strDecode(CmmUtil.nvl(uDTO.getUser_name())) %></td>
			<td><%=AES256Util.strDecode(CmmUtil.nvl(uDTO.getEmail())) %></td>
			<td><%=AES256Util.strDecode(CmmUtil.nvl(uDTO.getTel())) %></td>
		</tr>
		<% }%>
	
	</tbody>
</table>
</body>
</html>