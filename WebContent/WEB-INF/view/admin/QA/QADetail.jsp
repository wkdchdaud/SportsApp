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

int edit = 1;

if (ss_user_no.equals("")) {
	
	edit = 3;
	
} else if (ss_user_no.equals(CmmUtil.nvl(rDTO.getReg_user_no()))) {
	
	edit = 2;
	
}

System.out.println("user_no: " + CmmUtil.nvl(rDTO.getReg_user_no()));
System.out.println("ss_user_no: " + ss_user_no);
%>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Q&A 상세(스포츠 용품업자)</title>
<script type="text/javascript">

function doEdit() {
	
	if ("<%=edit%>"==2) {
		
		location.href="/admin/QA/QAEdit.do?qa_no=<%=CmmUtil.nvl(rDTO.getQa_no())%>";
		
	} else if ("<%=edit%>"==3) {
		
		alert("로그인을 하시기 바랍니다.");
		
	} else {
		
		alert("본인이 작성한 게시글만 수정 가능합니다.");
		
	}
	
}

function doDelete() {
	
	if ("<%=edit%>"==2) {
		
		if (confirm("작성한 게시글을 삭제하시겠습니까?")) {
			location.href="/admin/QA/QADelete.do?qa_no=<%=CmmUtil.nvl(rDTO.getQa_no())%>";
		}
		
	} else if ("<%=edit%>"==3) {
		
		alert("로그인을 하시기 바랍니다.");
		
	} else {
		
		alert("본인이 작성한 게시글만 삭제 가능합니다.");
		
	}
	
}

function doList() {
	location.href="/admin/QA/QAList.do";
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
				<input type="button" value="답글" onclick="location.href='/admin/QA/QAAnswerReg.do?qa_no=<%=CmmUtil.nvl(rDTO.getQa_no())%>&answer_yn=<%=CmmUtil.nvl(rDTO.getAnswer_yn())%>' "/>
				<input type="button" value="삭제" onclick="location.href='javascript:doDelete();' "/>
				<input type="button" value="목록" onclick="location.href='javascript:doList();' "/>
			</td>
		</tr>	
		
	</table>

</body>
</html>