<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="sports.com.util.CmmUtil" 
		 import="sports.com.dto.NoticeDTO"
		 import="java.util.ArrayList"		
		 import="java.util.List"
		 %>     

<%
	List<NoticeDTO> nList =(List<NoticeDTO>)request.getAttribute("nList");
%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세</title>
</head>
<body>

<table border="1">

<%for (NoticeDTO nDTO : nList ){ %>	
<col width="50px">
<col width="200px">

	<tr>
		<td>제목</td>
		<td><%= nDTO.getTITLE() %></td>
	</tr>
	
	<tr>
		<td colspan="2" align="right">작성자 : <%= nDTO.getREG_USER_NO() %> 작성일자 : <%=nDTO.getREG_DT() %></td>
	</tr>
	
	<tr>
		
		<td colspan="2" style="height:400px"><%= nDTO.getCONTENTS() %></td>
	</tr>

	<tr>
		<td colspan="2" align="center"><input type="button" onclick="location.href='/admin/notice/NoticeList.do'" value="돌아가기"/>
						<input type="button" onclick="location.href='/admin/notice/NoticeDelete.do?notice_no=<%= nDTO.getNOTICE_NO() %>'" value="삭제"/>
						<input type="button" onclick="location.href='/admin/notice/NoticeEditInfo.do?notice_no=<%= nDTO.getNOTICE_NO() %>'" value="수정"/>
		</td>
	</tr>
<%} %>		
</table>

</body>
</html>