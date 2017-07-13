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
<title>Q&A ��(������ ��ǰ����)</title>
<script type="text/javascript">

function doEdit() {
	
	if ("<%=edit%>"==2) {
		
		location.href="/admin/QA/QAEdit.do?qa_no=<%=CmmUtil.nvl(rDTO.getQa_no())%>";
		
	} else if ("<%=edit%>"==3) {
		
		alert("�α����� �Ͻñ� �ٶ��ϴ�.");
		
	} else {
		
		alert("������ �ۼ��� �Խñ۸� ���� �����մϴ�.");
		
	}
	
}

function doDelete() {
	
	if ("<%=edit%>"==2) {
		
		if (confirm("�ۼ��� �Խñ��� �����Ͻðڽ��ϱ�?")) {
			location.href="/admin/QA/QADelete.do?qa_no=<%=CmmUtil.nvl(rDTO.getQa_no())%>";
		}
		
	} else if ("<%=edit%>"==3) {
		
		alert("�α����� �Ͻñ� �ٶ��ϴ�.");
		
	} else {
		
		alert("������ �ۼ��� �Խñ۸� ���� �����մϴ�.");
		
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
			<td align="center">����</td>
			<td colspan="3"><%=CmmUtil.nvl(rDTO.getTitle())%></td>
		</tr>
	
		<tr>
			<td align="center">�ۼ���</td>
			<td><%=CmmUtil.nvl(rDTO.getUser_name())%></td>
			<td align="center">�ۼ���</td>
			<td><%=CmmUtil.nvl(rDTO.getReg_dt())%></td>
		</tr>	
	
		<tr>
			<td colspan="4" style="width: 550px; height: 400px" valign="top"><%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>") %></td>
		</tr>
		
		<tr>
			<td align="center">÷������</td>
			<td colspan="3"><input type="file" name="file_name" style="width:450px" /></td>
		</tr>
	
		<tr>
			<td align="center" colspan="4">
				<input type="button" value="���" onclick="location.href='/admin/QA/QAAnswerReg.do?qa_no=<%=CmmUtil.nvl(rDTO.getQa_no())%>&answer_yn=<%=CmmUtil.nvl(rDTO.getAnswer_yn())%>' "/>
				<input type="button" value="����" onclick="location.href='javascript:doDelete();' "/>
				<input type="button" value="���" onclick="location.href='javascript:doList();' "/>
			</td>
		</tr>	
		
	</table>

</body>
</html>