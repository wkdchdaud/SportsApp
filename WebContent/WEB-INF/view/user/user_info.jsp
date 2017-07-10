<%@page import="sports.com.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDTO userDTO = (UserDTO)request.getAttribute("userDTO");
	if(userDTO == null){
		userDTO = new UserDTO();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function doUpdate() {
		location.href='/user/user_update.do?user_no=<%=userDTO.getUser_no() %>';
	}
	
	function doDelete() {
		if(confirm("탈퇴하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
</script>
</head>
<body>

<h1><%=userDTO.getUser_id() %>님의 회원정보</h1>

<table border="1">
	<tr>
		<td>회원번호</td>
		<td><%=userDTO.getUser_no()%></td>
	</tr>
	
	<tr>
		<td>아이디</td>
		<td><%=userDTO.getUser_id()%></td>
	</tr>
	
	<tr>
		<td>이름</td>
		<td><%=userDTO.getUser_name()%></td>
	</tr>
	
	<tr>
		<td>이메일</td>
		<td><%=userDTO.getEmail()%></td>
	</tr>
	
	<tr>
		<td>이메일 확인 여부</td>
		<td><%=userDTO.getEmail_first()%></td>
	</tr>
	
	<tr>
		<td>전화번호</td>
		<td><%=userDTO.getTel()%></td>
	</tr>
	
	<tr>
		<td>권한</td>
		<td>
			<%if(userDTO.getAuth().equals("A")) {%>
				관리자
			<%}else{ %>
				고객
			<%} %>
		</td>
	</tr>
	
	<tr>
		<td>탈퇴여부</td>
		<td><%=userDTO.getDelete_yn()%></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<form action="/user/user_delete.do" method="post" onsubmit="return doDelete();">
				<input type="hidden" value="<%=userDTO.getUser_no() %>" name="user_no"/>
				<input type="button" value="수정" onclick="doUpdate();"/>
				<input type="submit" value="삭제"/>
				<input type="button" value="확인" onclick="history.back()"/>
			</form>
		</td>
	</tr>
</table>
</body>
</html>