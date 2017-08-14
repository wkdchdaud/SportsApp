<!-- for Customer -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sports.com.util.CmmUtil" %>
<%
String user_no = CmmUtil.nvl((String)session.getAttribute("user_no"));
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Q&A 등록(스포츠 학원 사업자)</title>
<%@include file="/inc/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function doSubmit(f) {
	
	if (f.title.value == "") {
		
		alert("제목을 입력하시기 바랍니다.");
		f.title.focus();
		return false;
		
	}
	
	if (calBytes(f.title.value) > 100) {
		
		alert("제목은 최대 100Bytes까지만 입력 가능합니다.");
		f.title.focus();
		return false;
		
	}	
	
	var secretCheck = false;
	
	for (var i=0; i<f.secret_yn.length; i++) {
		
		if (f.secret_yn[i].checked) {
			secretCheck = true;
		}
		
	}
	
	if (secretCheck==false) {
		
		alert("비밀글 여부를 선택하시기 바랍니다.");
		f.secret_yn[0].focus();
		return false;
		
	}	
	
	if (f.contents.value == "") {
		
		alert("내용을 입력하시기 바랍니다.");
		f.contents.focus();
		return false;
		
	}	
	
	if (calBytes(f.contents.value) > 4000) {
		
		alert("내용은 최대 4000Bytes까지만 입력 가능합니다.");
		f.contents.focus();
		return false;
		
	}		
	
}

function calBytes(str) {
	
	var tcount = 0;
	var tmpStr = new String(str);
	var strCnt = tmpStr.length;

	var onechar;
	
	for (i=0;i<strCnt;i++) {
		
		onechar = tmpStr.charAt(i);
		
		if (escape(onechar).length > 4) {
			
			tcount += 2;
			
		} else {
			
			tcount += 1;
			
		}
		
	}
	
	return tcount;
	
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
					<div class="panel-heading">Q&A 등록</div>
					
	<!--    Context Classes  -->
	<form name="f" method="post" action="/customer/QA/QAInsert.do" enctype="multipart/form-data" onsubmit="return doSubmit(this);">
	
		<div class="panel panel-default" style="width: 100%">
			<div class="panel-body">
	
	<table class="table">
	
		<tbody>
		
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" maxlength="50" /></td>
		</tr>
		
		<tr>
			<td>비밀글 여부</td>
			<td>
				예 <input type="radio" name="secret_yn" value="1" />
				&nbsp;&nbsp;
				아니오 <input type="radio" name="secret_yn" value="2" />
			</td>
		</tr>
		
		<tr>
			<td align="center" colspan="2"><textarea name="contents" style="width:300px; height:400px" maxlength="2000" wrap="physical"></textarea></td>
		</tr>
			
		<tr>
			<td>첨부파일</td>
			<td><input type="file" name="file_name" /></td>
		</tr>
		
		</tbody>
				
	</table>
	
			</div>
		</div>
		
	<input type="submit" value="등록" />
	<input type="button" value="목록" onclick="location.href='/customer/QA/QAList.do' "/>
	
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