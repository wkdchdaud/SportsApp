<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="sports.com.util.CmmUtil" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 등록</title>
</head>
<body>
<form method='post' action="/admin/notice/NoticeInsert.do"> 
<table border="1">
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="" maxlength="50"></td>
	</tr>
	<tr>
		<td colspan="2">
		공지글 게시여부
		  예<input type="radio" name="notice_yn" value="1"/>
		 아니오<input type="radio" name="notice_yn" value="2" checked/>
		</td>
	</tr>
	<tr>
		<td colspan="2"><textarea name="contents" maxlength="1500" value="" style="width:300px;height:500px"></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="등록"/>
		<input type="button" value="취소" onclick="location.href='/admin/notice/NoticeList.do'"/></td>
	</tr>
</table>

</form>

</body>
</html>