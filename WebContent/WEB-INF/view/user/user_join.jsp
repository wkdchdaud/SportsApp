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
			alert("���̵�");
			return false;
		}
		
		if(f.pwd.value == ""){
			f.pwd.focus();
			alert("��й�ȣ");
			return false;
		}
		
		if(f.pwdck.value == ""){
			f.pwdck.focus();
			alert("��й�ȣȮ��");
			return false;
		}
		
		if(f.pwdck.value != f.pwd.value){
			f.pwd.value="";
			f.pwdck.value="";
			f.pwd.focus();
			alert("��й�ȣ��ġ");
			return false;
		}
		
		if(f.name.value == ""){
			f.name.focus();
			alert("�̸�");
			return false;
		}
		
		if(f.name.value == ""){
			f.name.focus();
			alert("�̸�");
			return false;
		}
		
		if(f.email.value == ""){
			f.email.focus();
			alert("email");
			return false;
		}
		
		if(f.tel.value == ""){
			f.tel.focus();
			alert("����");
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
		<td align="center">���̵�</td>
		<td><input type="text" name="id"/></td>
	</tr>
	
	<tr>
		<td align="center">��й�ȣ</td>
		<td><input type="password" name="pwd"/></td>
	</tr>
	
	<tr>
		<td align="center">��й�ȣ Ȯ��</td>
		<td><input type="password" name="pwdck"/></td>
	</tr>
	
	<tr>
		<td align="center">�̸�</td>
		<td><input type="text" name="name"/></td>
	</tr>
	
	<tr>
		<td align="center">�̸���</td>
		<td><input type="text" name="email"/></td>
	</tr>
	
	<tr>
		<td align="center">����ó</td>
		<td><input type="text" name="tel"/></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="����"/>
			<input type="button" value="���"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>