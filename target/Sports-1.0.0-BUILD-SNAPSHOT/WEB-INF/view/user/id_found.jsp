<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	var cnt = 0;

	function sendEmail() {
		var name = $('#name').val();
		var email = $('#email').val();
		
		if(name == ""){
			alert('이름을 입력해주세요');
			$('#name').focus();
			return false;
		}
		if(email == ""){
			alert('이메일을 입력해주세요');
			$('#email').focus();
			return false;
		}
		
		var params = "name="+name+"&email="+email;
		if(cnt==0){
		$.ajax({
			type : "POST",
			url : "/user/email_ID.do",
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
	}
	
	function ck(msg) {
		if(msg == "T"){
			var f = document.getElementById("f");
			f.name.readOnly = true;
			f.email.readOnly = true;
			alert('인증번호를 발송하였습니다.');
			cnt++;
		}else{
			alert('입력 정보가 올바르지 않습니다.');
		}
	}
	
</script>

<script type="text/javascript">
	function clSubmit(f) {
		if(cnt == 0){
			alert('인증번호를 발급받으세요.');
			return false;
		}else if(f.email_ck.value == ""){
			f.email_ck.focus();
			alert('인증번호를 입력하세요.');
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form name="f" action="/user/id_result.do" onsubmit="return clSubmit(this)" id="f" method="post">
	<table border="1">
		<tr>
			<td align="center">이름</td>
			<td><input type="text" name="name" id="name"/></td>
		</tr>
		
		<tr>
			<td align="center">이메일</td>
			<td>
				<input type="text" name="email" id="email"/>
				<input type="button" value="인증번호" onclick="sendEmail()"/>
			</td>
		</tr>
		
		<tr>
			<td>인증번호</td>
			<td><input type="text" name="email_ck" maxlength="6"/></td>
		</tr>
		
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value="아이디 찾기"/>
				<input type="button" value="로그인" onclick="location.href='/user/user_login.do'"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>