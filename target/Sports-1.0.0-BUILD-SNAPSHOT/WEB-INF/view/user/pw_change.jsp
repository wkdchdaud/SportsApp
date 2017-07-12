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
<script type="text/javascript">
	function name(f) {
		if(f.password.value == ""){
			alert('새 비밀번호를 입력해주세요.');
			f.password.focus();
			return false;
		}
		
		if(f.password_ck.value == ""){
			alert('비밀번호확인을 입력해주세요.');
			f.password_ck.focus();
			return false;
		}
		
		if(f.password.value != f.password_ck.value){
			alert('비밀번호가 서로 틀립니다.');
			f.password.focus();
			return false;
		}
	}

</script>
</head>
<body>
<form action="/user/pw_change_proc.do" onsubmit="return submit_ck(this)" name="f" method="post">
<input type="hidden" name="user_no" value="<%=uDTO.getUser_no() %>"/>
<table border="1">
	<tr>
		<td>새 비밀번호</td>
		<td>
			<input type="password" name="password" />
		</td>
	</tr>
	
	<tr>
		<td>비밀번호 확인</td>
		<td>
			<input type="password" name="password_ck" />
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="변경하기"/>
			<input type="button" value="로그인"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>