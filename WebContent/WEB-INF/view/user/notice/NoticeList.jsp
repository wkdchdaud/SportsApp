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
<title>공지사항 리스트</title>
</head>
<body>
<h2>공지사항</h2>
<hr/>
<table border="1">
<col width="70px">
<col width="300px">
<col width="100px">
<col width="100px">
	<tr>
		<td align="center">글 번호</td>
		<td align="center">글 제목</td>
		<td align="center">작성일</td>
		<td align="center">작성자</td>
	</tr>
	
<% for(NoticeDTO nDTO : nList){%>
	<tr>
		<td align="center"><%=nDTO.getNOTICE_NO() %></td>
		<%if(nDTO.getNOTICE_YN().equals("1")){%>
		<td align="center"><a href="/user/notice/NoticeInfo.do?notice_no=<%=nDTO.getNOTICE_NO() %>"><font color="orange"><b><%=nDTO.getTITLE() %></b></font></a></td>
		<%}else{ %>	
		<td align="center"><a href="/user/notice/NoticeInfo.do?notice_no=<%=nDTO.getNOTICE_NO() %>"><%=nDTO.getTITLE() %></a></td>
		<%} %>
		<td align="center"><%=nDTO.getREG_DT() %></td>
		<td align="center"><%=nDTO.getUSER_NO() %></td>
	</tr>
<%} %>

</table>



</body>
</html>