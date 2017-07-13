<%@page import="sports.com.util.CmmUtil"%>
<%@page import="sports.com.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserDTO userDTO = (UserDTO) request.getAttribute("userDTO");
	if (userDTO == null) {
		userDTO = new UserDTO();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function doSubmit(f) {
		
		
	}
</script>
</head>
<body>
	<form action="/user/user_update_proc.do" method="post" onsubmit="return doSubmit(this);">
		<input type="hidden" value="<%=CmmUtil.nvl(userDTO.getUser_no()) %>" name="user_no"/>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" value="<%=CmmUtil.nvl(userDTO.getUser_id())%>" name="user_id" /></td>
			</tr>

			<tr>
				<td>비밀번호&nbsp;&nbsp;<input type="checkbox" name="pwd_change" value="o"/></td>
				<td><input type="password" name="password" /></td>
			</tr>

			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="passwordck" /></td>
			</tr>

			<tr>
				<td>이름</td>
				<td>
					<input type="text" value="<%=CmmUtil.nvl(userDTO.getUser_name())%>" name="name" /></td>
			</tr>

			<tr>
				<td>이메일</td>
				<td>
					<input type="text" value="<%=CmmUtil.nvl(userDTO.getEmail())%>" name="email" /></td>
			</tr>

			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" value="<%=CmmUtil.nvl(userDTO.getTel())%>" name="tel" /></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정" /> 
					<input type="button" value="취소" onclick="location.href='/user/user_info.do?user_no=<%=CmmUtil.nvl(userDTO.getUser_no()) %>'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>