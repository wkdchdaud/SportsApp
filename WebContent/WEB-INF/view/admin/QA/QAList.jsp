<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sports.com.util.CmmUtil" %>
<%@ page import="sports.com.dto.QADTO" %>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%>    
<%
session.setAttribute("SESSION_USER_NO", "USER01");

List<QADTO> rList =	(List<QADTO>) request.getAttribute("rList");

if (rList==null) {
	rList = new ArrayList<QADTO>();
}
%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A 리스트</title>
<script type="text/javascript">

function doDetail(no) {
	location.href="/admin/QA/QADetail.do?qa_no=" + no;
}

</script>
</head>
<body>

<h2>Q&A</h2>
<hr/>

	<table width="600px">
	
		<tr>
			<td align="right"><input type="button" onclick="location.href='/admin/QA/QAReg.do'" value="글쓰기"/></td>
		</tr>
		
	</table>
	
<br/>	

	<table border="1" width="600px">
	
		<tr>
			<td width="100" align="center">글번호</td>
			<td width="250" align="center">제목</td>
			<td width="100" align="center">작성자</td>
			<td width="150" align="center">작성일</td>
		</tr>
		
		<%
			for (QADTO rDTO : rList) {

				if (rDTO==null) {
					rDTO = new QADTO();
				}
		%>
		
		<tr>
			<td align="center"><%=CmmUtil.nvl(rDTO.getQa_no()) %></td>
			<td align="center">
				<a href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>');"><%=CmmUtil.nvl(rDTO.getTitle()) %></a>
				<% if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {
					out.println("<b>[SECRET]</b>");
				}
				%>
			</td>
			<td align="center"><%=CmmUtil.nvl(rDTO.getUser_name()) %></td>
			<td align="center"><%=CmmUtil.nvl(rDTO.getReg_dt()) %></td>
		</tr>
		
		<%
		}
		%>
		
	</table>
	
</body>
</html>