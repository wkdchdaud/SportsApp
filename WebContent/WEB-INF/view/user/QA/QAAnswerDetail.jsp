<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="sports.com.util.CmmUtil" %>
<%@ page import="sports.com.dto.QADTO" %>
<%@ page import="java.util.ArrayList" %>		
<%@ page import="java.util.List" %>
<%
QADTO rDTO = (QADTO)request.getAttribute("rDTO");

if (rDTO==null) {
	rDTO = new QADTO();
}

String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
String ss_user_no = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_NO"));

System.out.println("user_no: " + CmmUtil.nvl(rDTO.getReg_user_no()));
System.out.println("ss_user_no: " + ss_user_no);
%>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Q&A 답글 상세(스포츠 학원 사업자)</title>
<script type="text/javascript">

function doList() {
	location.href="/user/QA/QAList.do";
}

</script>	
</head>
<body>

	<table border="1">

		<col width="100px" />
		<col width="200px" />
		<col width="100px" />
		<col width="200px" />
	
		<tr>
			<td align="center">제목</td>
			<td colspan="3"><%=CmmUtil.nvl(rDTO.getTitle())%></td>
		</tr>
	
		<tr>
			<td align="center">작성자</td>
			<td><%=CmmUtil.nvl(rDTO.getUser_name())%></td>
			<td align="center">작성일</td>
			<td><%=CmmUtil.nvl(rDTO.getReg_dt())%></td>
		</tr>	
	
		<tr>
			<td colspan="4" style="width: 550px; height: 400px" valign="top"><%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>") %></td>
		</tr>
		
		<tr>
			<td align="center">첨부파일</td>
			<td colspan="3"><input type="file" name="file_name" style="width:450px" /></td>
		</tr>
	
		<tr>
			<td align="center" colspan="4">
				<input type="button" value="목록" onclick="location.href='javascript:doList();' "/>
			</td>
		</tr>	
		
	</table>

</body>
</html>