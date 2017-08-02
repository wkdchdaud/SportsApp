<%@page import="sports.com.util.AES256Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
String user_no = CmmUtil.nvl((String)session.getAttribute("user_no"));

int edit = 1;

if (user_no.equals("")) {
	
	edit = 3;
	
} else if (user_no.equals(CmmUtil.nvl(rDTO.getReg_user_no()))) {
	
	edit = 2;
	
}

System.out.println("user_no: " + CmmUtil.nvl(rDTO.getReg_user_no()));
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Q&A 상세(스포츠 학원 사업자)</title>
<%@include file="/inc/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function doEdit() {
	
	if ("<%=edit%>"==2) {
		
		location.href="/customer/QA/QAEdit.do?qa_no=<%=CmmUtil.nvl(rDTO.getQa_no())%>";
		
	} else if ("<%=edit%>"==3) {
		
		alert("로그인을 하시기 바랍니다.");
		
	} else {
		
		alert("본인이 작성한 게시글만 수정 가능합니다.");
		
	}
	
}

function doDelete() {
	
	if ("<%=edit%>"==2) {
		
		if (confirm("작성한 게시글을 삭제하시겠습니까?")) {
			location.href="/customer/QA/QADelete.do?q_no=<%=CmmUtil.nvl(rDTO.getQ_no())%>";
		}
		
	} else if ("<%=edit%>"==3) {
		
		alert("로그인을 하시기 바랍니다.");
		
	} else {
		
		alert("본인이 작성한 게시글만 삭제 가능합니다.");
		
	}
	
}

function doList() {
	location.href="/customer/QA/QAList.do";
}

</script>	
</head>
<body>

	<div id="wrapper">
		<!-- 사이드 네비바 및 헤더 부분 시작 -->
		<%@include file="/inc/side_nav.jsp"%>
		<!-- 사이드 네비바 및 헤더 부분 끝  -->
	
	<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Q&A</h2>
					</div>
				</div>
				
	<!-- /. ROW  -->
		<hr />
		<div class="row">
			<div class="col-md-7">
				<div class="panel panel-default" style="width: 100%">
					<div class="panel-heading">Q&A 상세</div>
					
	<!--    Context Classes  -->
	<form name="f" id="f" method="post">
	
		<div class="panel panel-default" style="width: 100%">
			<div class="panel-body">
	
	<table class="table">
	
		<tbody>	
	
		<tr>
			<td align="left">제목</td>
			<td><%=CmmUtil.nvl(rDTO.getTitle())%></td>
		</tr>
	
		<tr>
			<td align="left" colspan="2">작성자&nbsp;&nbsp;<%=AES256Util.strDecode(CmmUtil.nvl(rDTO.getUser_name()))%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일&nbsp;&nbsp;<%=CmmUtil.nvl(rDTO.getReg_dt())%></td>
		</tr>	
	
		<tr>
			<td colspan="2" style="height: 400px" valign="top"><%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br>") %></td>
		</tr>
		
		<tr>
			<td align="left">첨부파일</td>
			<td><input type="file" name="file_name" /></td>
		</tr>
		
		</tbody>
		
	</table>
	
			</div>
		</div>
		
	<% if (user_no.equals(CmmUtil.nvl(rDTO.getReg_user_no()))) {%>
	
		<input type="button" value="수정" onclick="location.href='javascript:doEdit();' " />
		<input type="button" value="삭제" onclick="location.href='javascript:doDelete();' " />
		
	<%} %>
	
		<input type="button" value="목록" onclick="location.href='javascript:doList();' " />

</form>

							<!--  end  Context Classes  -->
						</div>
					</div>
				</div>
			</div>
			
			<!-- /. ROW  -->
		</div>
		
		<!-- /. PAGE INNER  -->
	</div>
	
	<!-- /. PAGE WRAPPER  -->
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="/assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="/assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="/assets/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="/assets/js/custom.js"></script>
		
</body>
</html>