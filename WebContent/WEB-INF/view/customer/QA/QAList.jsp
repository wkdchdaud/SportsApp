<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sports.com.util.CmmUtil" %>
<%@ page import="sports.com.dto.QADTO" %>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%>  
<%@ page import="java.util.Date" %>  
<%@ page import="java.text.SimpleDateFormat" %>
<%
session.setAttribute("SESSION_USER_NO", "USER01");

List<QADTO> rList =	(List<QADTO>) request.getAttribute("rList");

if (rList==null) {
	rList = new ArrayList<QADTO>();
}
%>   
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Q&A 목록(스포츠 학원 사업자)</title>
<%@include file="/inc/head.jsp"%>
<!-- JQUERY SCRIPTS -->
<script src="/assets/js/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

$(function() {
	var cnt = 5;
<% if (rList.size() < 5) {%>
	$("#addview").hide();
<%} %>

$("#addview").click(function() {
	
	var num = 5;
	
	$.ajax({

		url: "/customer/QA/QAReadMore.do",
		method: "post",
		data: {
			'cnt' : cnt
		},
		dataType : "json",
		success : function(data) {
			var contents = "";
			console.log(data)
			$.each(data,function (key,value) {
				var yn = value.answer_yn;
				
				contents += "<tr><td align='left'>";
				if (value.answer_yn == "Y") {
					contents += "<a href='/customer/QA/QAAnswerDetail.do?qa_no="+value.qa_no+"'>";
				} else {
					contents += "<a href='/customer/QA/QADetail.do?qa_no="+value.qa_no+"'>";
				}
				if (value.answer_yn == "Y") {
					contents += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				contents += value.title+"</td>";
				contents += "<td align='left'>"+value.reg_user_no+"</a></td>";
				contents += "<td align='left'>"+value.reg_dt+"</td></tr>";
			});
			
			$('#list_more').append(contents);
			if ((data).length<5) {
				$('#addview').remove();
			}
			
		}
	
	});
	
	cnt += 5;
	
});

})

function doDetail(qa_no) {
	location.href="/customer/QA/QADetail.do?qa_no=" + qa_no;
}

function doAnswerDetail(qa_no, answer_yn) {
	location.href="/customer/QA/QAAnswerDetail.do?qa_no=" + qa_no;
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
					<form name="f" id="f" method="post">
						<div class="panel-heading">Q&A 목록</div>	
					
	<!--    Context Classes  -->
		<div class="panel panel-default" style="width: 100%">
			<div class="panel-body">

	<table class="table">

		<thead>
	
		<tr>
			<th align="center" style="width: 400px"><font size="2px">제목</font></th>
			<th align="center" style="width: 200px"><font size="2px">작성자</font></th>
			<th align="center" style="width: 200px"><font size="2px">작성일</font></th>
		</tr>
		
		</thead>
		
		<tbody id="list_more">
		
		<%
			for (QADTO rDTO : rList) {

				if (rDTO==null) {
					rDTO = new QADTO();
				}
		%>
		
		<tr>
			<td align="left">
			<% if (CmmUtil.nvl(rDTO.getAnswer_yn()).equals("Y")) {%>
			
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<a href="javascript:doAnswerDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>');"><%=CmmUtil.nvl(rDTO.getTitle()) %></a>
				
				<% if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {
					out.println("<b>[SECRET]</b>");
				}%>
				
				<%
				String reg_dt = CmmUtil.nvl(rDTO.getReg_dt());
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date to = transFormat.parse(reg_dt);
				
				long now = System.currentTimeMillis();
				long inputDate = to.getTime();
				String mark = "";
				 
				if (now - inputDate < (1000*60*60*24*3)) {
					out.println("<b>[NEW]</b>");
				}
				%>
				
			<%} else {%>
			
				<a href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>');"><%=CmmUtil.nvl(rDTO.getTitle()) %></a>
				
				<% if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {
					out.println("<b>[SECRET]</b>");
				}%>
				
				<%
				String reg_dt = CmmUtil.nvl(rDTO.getReg_dt());
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date to = transFormat.parse(reg_dt);
				
				long now = System.currentTimeMillis();
				long inputDate = to.getTime();
				String mark = "";
				 
				if (now - inputDate < (1000*60*60*24*3)) {
					out.println("<b>[NEW]</b>");
				}
				%>
				
			<%} %>	
			</td>
			<td align="left"><%=CmmUtil.nvl(rDTO.getUser_name()) %></td>
			<td align="left"><%=CmmUtil.nvl(rDTO.getReg_dt().substring(0, 10)) %></td>
		</tr>
		
		<%
		}
		%>
		
		</tbody>
		
	</table>
	
	<!-- 더보기 -->
	<center><input type="button" style="width: 150px" class="btn btn-success" value="더보기" id="addview" /></center>
	
		</div>
	</div>
	<!--  end  Context Classes  -->
	
	<input type="button" onclick="location.href='/customer/QA/QAReg.do'" value="글쓰기" />

</form>

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
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="/assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="/assets/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="/assets/js/custom.js"></script>
	
</body>
</html>