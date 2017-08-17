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
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="/js/user_js.js"></script>
<script type="text/javascript">
	var id_ck = 0;
	function doSubmit(f) {
		if(f.id.value == ""){
			f.id.focus();
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		if(f.id.value != "<%=CmmUtil.nvl(userDTO.getUser_id())%>" && id_ck == 0){
			f.id.focus();
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		
		if(f.pwd_change.checked == true){
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
		
		if(validateEmail(f.email.value)){
			f.email.focus();
			alert("올바른 이메일을 입력해주세요.");
			return false;
		}
		
		if(f.tel.value == ""){
			f.tel.focus();
			alert("번호를 입력해주세요.");
			return false;
		}
		return true;
	}
	
	
	function id_reck() {
		var id = $('#id').val();
		
		if(id == ""){
			alert('아이디을 입력해주세요.');
			$('#id').focus();
			return false;
		}
		
		if(6>id.length || id.length>14){
			alert('올바른 아이디를 입력해주세요.');
			$('#id').focus();
			return false;
		}
		
		if(id == "<%=CmmUtil.nvl(userDTO.getUser_id())%>"){
			alert('아이디가 변경되지 않았습니다.');
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
			var f = document.getElementById("f")
			f.id.readOnly = true;
			
			alert("사용가능한 아이디입니다.");
			id_ck = 1;
		}else{
			alert("사용불가능한 아이디입니다.");
		}
	}
</script>
</head>
<body>
	<form action="/admin/user/user_update_proc.do" method="post" onsubmit="return doSubmit(this);" id="f" name="f">
		<input type="hidden" value="<%=CmmUtil.nvl(userDTO.getUser_no()) %>" name="user_no"/>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" value="<%=CmmUtil.nvl(userDTO.getUser_id())%>" name="id" id="id"/>
					<input type="button" value="중복확인" onclick="id_reck()"/>
				</td>
			</tr>

			<tr>
				<td>비밀번호&nbsp;&nbsp;<input type="checkbox" name="pwd_change" value="o"/></td>
				<td><input type="password" name="pwd" /></td>
			</tr>
			
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pwdck" /></td>
			</tr>
			
			<tr>
				<td colspan="2">
					6~16자 영문 대 소문자, 숫자를 섞어서 사용하세요.
				</td>
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
					<input type="button" value="취소" onclick="location.href='/admin/user/user_info.do?user_no=<%=CmmUtil.nvl(userDTO.getUser_no()) %>'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>