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

int cnt = 1;
%>        
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A 목록</title>
<script type="text/javascript">

function doDetail(qa_no) {
	location.href="/admin/QA/QADetail.do?qa_no=" + qa_no ;
}

function doAnswerDetail(qa_no, answer_yn) {
	location.href="/admin/QA/QAAnswerDetail.do?qa_no=" + qa_no;
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
			<th width="250" align="center">제목</th>
			<th width="100" align="center">작성자</th>
			<th width="150" align="center">작성일</th>
		</tr>
		
		<%
			for (QADTO rDTO : rList) {

				if (rDTO==null) {
					rDTO = new QADTO();
				}
		%>
		
		<tr>
			<td align="center">
			<% if (CmmUtil.nvl(rDTO.getAnswer_yn()).equals("Y")) {%>
			
				<a href="javascript:doAnswerDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>');"><%=CmmUtil.nvl(rDTO.getTitle()) %></a>
				<% if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {
					out.println("<b>[SECRET]</b>");
				}%>
				
			<%} else {%>
			
				<a href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>');"><%=CmmUtil.nvl(rDTO.getTitle()) %></a>
				<% if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {
					out.println("<b>[SECRET]</b>");
				}%>
				
			<%} %>	
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