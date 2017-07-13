<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="/js/user_js.js"></script>
<script type="text/javascript">
	function ck(f) {
		if(f.id.value == ""){
			f.id.focus();
			alert("아이디를 입력해주세요");
			return false;
		}
		
		if(f.pwd.value == ""){
			f.pwd.focus();
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		if(f.pwdck.value == ""){
			f.pwdck.focus();
			alert("비밀번호 확인을 입력해주세요.");
			return false;
		}
		
		if(f.pwdck.value != f.pwd.value){
			f.pwd.focus();
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		if(pass_ck(f.pwdck.value)){
			f.pwd.focus();
			alert("비밀번호가 조건에 적합하지 않습니다.")
			return false;
		}
		
		if(f.name.value == ""){
			f.name.focus();
			alert("이름을 입력해주세요.");
			return false;
		}
		
		if(f.email.value == ""){
			f.email.focus();
			alert("이메일을 입력해주세요.");
			return false;
		}
		
		if(validateEmail(email)){
			f.email.focus();
			alert("올바른 이메일을 입력해주세요.");
			return false;
		}
		
		if(f.tel.value == ""){
			f.tel.focus();
			alert("번호가 올바르지 않습니다.");
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
	function id_reck() {
		var id = $('#id').val();
		
		if(id == ""){
			alert('아이디을 입력해주세요.');
			$('#id').focus();
			return false;
		}
		
		var params = "id="+id;
		
		$.ajax({
			type : "POST",
			url : "/user/id_check.do",
			data : params,
			datatype : "JSON",
			success : function(obj) {
				data = JSON.parse(obj);
				ck(data.msg)
			},complete : function(data) {// 응답이 종료되면 실행, 잘 사용하지않는다
				console.log(data);
			},
			error : function(xhr, status, error) {
				alert("ERROR!!!");
			}
		})
	}
	
	function ck(msg) {
		if(msg == "Y"){
			var f = document.getElementById("f");
			f.id.readOnly = true;
			alert('사용가능한 아이디입니다.');
		}else{
			alert('사용불가능한 아이디입니다.');
		}
	}
</script>
</head>
<body>
<form action="/user/join_proc.do" name="f" onsubmit="return ck(this)" method="post" id="f">
<table border="1">
	<tr>
		<td align="center">아이디</td>
		<td>
			<input type="text" name="id" onkeydown="nop_han(this);" style="ime-mode:disabled;" id="id"/>
			<input type="button" value="중복확인" onclick="id_reck()"/>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			6~14 영문 대 소문자, 숫자를 사용해주세요.
		</td>
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
		<td colspan="2">
			6~16자 영문 대 소문자, 숫자를 섞어서 사용하세요.
		</td>
	</tr>
	
	<tr>
		<td align="center">이름</td>
		<td><input type="text" name="name" maxlength="10"/></td>
	</tr>
	
	<tr>
		<td align="center">이메일</td>
		<td><input type="text" name="email" maxlength="50"/></td>
	</tr>
	
	<tr>
		<td align="center">연락처</td>
		<td><input type="text" name="tel" onkeydown="return only_num(event)" maxlength="14"/></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="가입"/>
			<input type="button" value="취소" onclick="location.href='/user/user_login.do'"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>