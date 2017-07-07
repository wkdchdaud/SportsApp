<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page	import="sports.com.util.CmmUtil"
   		 	import="sports.com.dto.NoticeDTO"
		 	import="java.util.ArrayList"		
		 	import="java.util.List" %>
 <%
 	List<NoticeDTO> nList = (List<NoticeDTO>)request.getAttribute("nList");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정</title>
</head>
<body>
<form method='post' action="/admin/notice/NoticeUpdate.do" >
<table border="1">
	
	
	<%
		String notice_no = "";	
	
		for(NoticeDTO nDTO : nList){%>
		<%	String notice_yn = nDTO.getNOTICE_YN();
			notice_no = nDTO.getNOTICE_NO();
		%>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="<%=nDTO.getTITLE() %>" maxlength="50"></td>
		
	</tr>
	<tr>
		<td colspan="3">
		공지글 게시여부
		  예<input type="radio" name="notice_yn" value="1" <%=CmmUtil.checked(notice_yn,"1") %>/>
		 아니오<input type="radio" name="notice_yn" value="2" <%=CmmUtil.checked(notice_yn,"2") %>/>
		</td>
	</tr>
	<tr>
		<%String contents = nDTO.getCONTENTS(); 
			contents = contents.replace("<br>","\r\n");
		%>
		<td colspan="3"><textarea name="contents" maxlength="1500" value="" style="width:300px;height:500px"><%=contents %></textarea></td>
	</tr>
	<tr>
		<td colspan="3"><input type="submit" value="수정"/>
		<input type="button" value="취소" onclick="location.href='/admin/notice/NoticeInfo.do?notice_no=<%=nDTO.getNOTICE_NO() %>'"/></td>
	</tr>
	<%} %>
</table>
<input type="hidden" name="notice_no" value="<%=notice_no %>">
</form>

</body>
</html>