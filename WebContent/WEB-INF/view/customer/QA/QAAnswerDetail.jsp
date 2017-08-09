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

System.out.println("user_no: " + CmmUtil.nvl(rDTO.getReg_user_no()));
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Q&A 답글 상세(스포츠 학원 사업자)</title>
<%@include file="/inc/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

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
					<div class="panel-heading">Q&A 답글 상세</div>
					
	<!--    Context Classes  -->
	<form name="f" id="f" method="post">
	
		<div class="panel panel-default" style="width: 100%">
			<div class="panel-body">
	
	<table class="table">
	
		<tbody>		
	
		<tr>
			<td align="left"><h3><%=CmmUtil.nvl(rDTO.getTitle())%></h3></td>
		</tr>
	
		<tr>
			<td align="left" colspan="2">관리자&nbsp;&nbsp;&nbsp;<%=CmmUtil.nvl(rDTO.getReg_dt())%></td>
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