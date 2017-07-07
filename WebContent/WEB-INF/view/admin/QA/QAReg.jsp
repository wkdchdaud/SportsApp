<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sports.com.util.CmmUtil" %>
<%
String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_NO"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A 등록</title>
<script type="text/javascript">

function doSubmit(f) {
	
	if (f.title.value == "") {
		
		alert("제목을 입력하시기 바랍니다.");
		f.title.focus();
		return false;
		
	}
	
	if (calBytes(f.title.value) > 100) {
		
		alert("제목은 최대 100Bytes까지만 입력 가능합니다.");
		f.title.focus();
		return false;
		
	}	
	
	var secretCheck = false;
	
	for (var i=0; i<f.secretYn.length; i++) {
		
		if (f.secretYn[i].checked) {
			secretCheck = true;
		}
		
	}
	
	if (secretCheck==false) {
		
		alert("비밀글 여부를 선택하시기 바랍니다.");
		f.secretYn[0].focus();
		return false;
		
	}	
	
	if (f.contents.value == "") {
		
		alert("내용을 입력하시기 바랍니다.");
		f.contents.focus();
		return false;
		
	}	
	
	if (calBytes(f.contents.value) > 4000) {
		
		alert("내용은 최대 4000Bytes까지만 입력 가능합니다.");
		f.contents.focus();
		return false;
		
	}		
	
}

function calBytes(str) {
	
	var tcount = 0;
	var tmpStr = new String(str);
	var strCnt = tmpStr.length;

	var onechar;
	
	for (i=0;i<strCnt;i++) {
		
		onechar = tmpStr.charAt(i);
		
		if (escape(onechar).length > 4) {
			
			tcount += 2;
			
		} else {
			
			tcount += 1;
			
		}
		
	}
	
	return tcount;
	
}

</script>
</head>
<body>

<form name="f" method="post" action="/admin/QA/QAInsert.do" enctype="multipart/form-data" onsubmit="return doSubmit(this);">
	
	<table border="1">
	
		<col width="100px" />
		<col width="500px" />
		
		<tr>
			<td align="center">제목</td>
			<td><input type="text" name="title" maxlength="100" style="width:450px" /></td>
		</tr>
		
		<tr>
			<td align="center">비밀글 여부</td>
			<td>
				예 <input type="radio" name="secret_yn" value="1" />
				아니오 <input type="radio" name="secret_yn" value="2" />
			</td>
		</tr>
		
		<tr>
			<td colspan="2"><textarea name="contents" style="width:550px; height:400px"></textarea></td>
		</tr>
			
		<tr>
			<td align="center">첨부파일</td>
			<td><input type="file" name="file_name" style="width:450px" /></td>
		</tr>
		
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value="등록" />
				<input type="reset" value="초기화" />
				<input type="button" value="취소" onclick="location.href='/admin/QA/QAList.do' "/>
			</td>
		</tr>
				
	</table>
	
</form>

</body>
</html>