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
<script src="/js/user_js.js"></script>
<script type="text/javascript">
	function doSubmit(f) {
		if(f.pwd.value == ""){
			alert('새 비밀번호를 입력해주세요.');
			f.pwd.focus();
			return false;
		}
		
		if(f.pwd_ck.value == ""){
			alert('비밀번호확인을 입력해주세요.');
			f.pwd_ck.focus();
			return false;
		}
		
		if(f.pwd.value != f.pwd_ck.value){
			alert('비밀번호가 서로 틀립니다.');
			f.pwd.focus();
			return false;
		}
		
		if(pass_ck(f.pwd.value)){
			alert('비밀번호가 조건에 적합하지 않습니다.');
			f.pwd.focus();
			return false;
		}
		return true;
	}
	
</script>
</head>
<body>
<form action="/user/pw_change_proc.do" onsubmit="return doSubmit(this)" name="f" method="post">
<input type="hidden" name="user_no" value="<%=CmmUtil.nvl(uDTO.getUser_no()) %>"/>
<table border="1">
	<tr>
		<td>새 비밀번호</td>
		<td>
			<input type="password" name="pwd" />
		</td>
	</tr>
	
	<tr>
		<td>비밀번호 확인</td>
		<td>
			<input type="password" name="pwd_ck" />
		</td>
	</tr>
	
	<tr>
		<td colspan="2">6~16자 영문 대 소문자, 숫자를 섞어서 사용하세요.</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="변경하기"/>
			<input type="button" value="로그인" onclick="location.href='/user/user_login.do'"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>