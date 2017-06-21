<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function ck(f) {
		if(f.id.value == ""){
			f.id.focus();
			alert("아이디");
			return false;
		}
		
		if(f.pwd.value == ""){
			f.pwd.focus();
			alert("비밀번호");
			return false;
		}
		
		if(f.pwdck.value == ""){
			f.pwdck.focus();
			alert("비밀번호확인");
			return false;
		}
		
		if(f.pwdck.value != f.pwd.value){
			f.pwd.value="";
			f.pwdck.value="";
			f.pwd.focus();
			alert("비밀번호일치");
			return false;
		}
		
		if(f.name.value == ""){
			f.name.focus();
			alert("이름");
			return false;
		}
		
		if(f.name.value == ""){
			f.name.focus();
			alert("이름");
			return false;
		}
		
		if(f.email.value == ""){
			f.email.focus();
			alert("email");
			return false;
		}
		
		if(f.tel.value == ""){
			f.tel.focus();
			alert("버노");
			return false;
		}
		
		return true;
	}

</script>
</head>
<body>
<form action="/user/join_proc.do" name="f" onsubmit="return ck(this)" method="post">
<table border="1">
	<tr>
		<td align="center">아이디</td>
		<td><input type="text" name="id"/></td>
	</tr>
	
	<tr>
		<td align="center">비밀번호</td>
		<td><input type="password" name="pwd"/></td>
	</tr>
	
	<tr>
		<td align="center">비밀번호 확인</td>
		<td><input type="password" name="pwdck"/></td>
	</tr>
	
	<tr>
		<td align="center">이름</td>
		<td><input type="text" name="name"/></td>
	</tr>
	
	<tr>
		<td align="center">이메일</td>
		<td><input type="text" name="email"/></td>
	</tr>
	
	<tr>
		<td align="center">연락처</td>
		<td><input type="text" name="tel"/></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="가입"/>
			<input type="button" value="취소"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>