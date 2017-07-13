<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="sports.com.util.CmmUtil"
	import="sports.com.dto.NoticeDTO" import="java.util.ArrayList"
	import="java.util.List"%>

<%
	List<NoticeDTO> nList = (List<NoticeDTO>) request.getAttribute("nList");
	if (nList == null) {
		nList = new ArrayList<NoticeDTO>();
	}
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지사항</title>
<!-- BOOTSTRAP STYLES-->
<link href="/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="/assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="/assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 리스트</title>

<script type="text/javascript">



function hiddenCheckbox(){
	
	var dS = document.getElementsByClassName("deleteSelect");
		
		for(var i =0;i<dS.length;i++){
			dS[i].style.display = "none";
		}
		
		document.getElementById("delete").style.display = "none";
}

function edit(){
	
	var dS = document.getElementsByClassName("deleteSelect");
		
	for(var i =0;i<dS.length;i++){
		if(dS[i].style.display == "none"){
			dS[i].style.display ="";
				
		}else{
			if(dS[i].style.display == ""){
				dS[i].style.display ="none";
				}
			}
		}
	
	
	if(document.getElementById("delete").style.display == ""){
		document.getElementById("delete").style.display = "none";
		return false;
	}
	
	document.getElementById("delete").style.display = ""
	
}


</script>




</head>
<body onload="hiddenCheckbox()">
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/main.do">모두의 스포츠</a>
			</div>
			<div
				style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;"
				id="nowDate">
				2017년 6월 23일 <a href="/login.html"
					class="btn btn-danger square-btn-adjust">Logout</a>
			</div>
		</nav>

		<!-- 사이드 메뉴 바 -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center"><img src="/assets/img/find_user.png"
						class="user-image img-responsive" /></li>

					<!-- 우리가 사용할 메뉴 시작  -->

					<!--  회원관리 -->
					<li><a href="/ui.do"><i class="fa fa-desktop fa-3x"></i>
							회원관리</a></li>

					<!--  권한관리 -->
					<li><a href="/ui1.do"><i class="fa fa-desktop fa-3x"></i>
							권한관리</a></li>

					<!--주문관리-->
					<li><a href="/table.do"><i class="fa fa-table fa-3x"></i>
							주문관리</a></li>

					<!--학원관리-->
					<li><a href="/accountmanagement.do"><i
							class="fa fa-table fa-3x"></i> 학원관리</a></li>

					<!--스포츠용품리스트관리  -->
					<li><a href="/table1.do"><i class="fa fa-table fa-3x"></i>
							스포츠 용품 리스트 관리</a></li>

					<!--매출분석정보-->
					<li><a href="/chart1.do"><i
							class="fa fa-bar-chart-o fa-3x"></i> 매출분석정보</a></li>



					<li><a href="#"><i class="fa fa-sitemap fa-3x"></i> 커뮤니티
							관리<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="/admin/notice/NoticeList.do">공지사항</a></li>
							<li><a href="#">Q&A</a></li>
						</ul></li>
				</ul>

			</div>

		</nav>

		<!-- 사이드 메뉴바 끝 -->

		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>공지사항</h2>

					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">

					<div class="col-md-7">
						<div class="panel panel-default" style="width: 100%">
							<form name="f" method="post" action="/admin/notice/NoticeCheckboxDelete.do">
								<div class="panel-heading">공지사항 목록</div>
								<!--    Context Classes  -->
								<div class="panel panel-default" style="width: 100%">


									<div class="panel-body">

										<table class="table">
											<thead>
												<tr>
													<th style="width: 100px"><font size="2px">글번호</font></th>
													<th style="width: 500px"><font size="2px">제목</font></th>
													<th style="width: 200px"><font size="2px">작성자</font></th>
													<th style="width: 100px"><font size="2px">작성일</font></th>
												</tr>
											</thead>
											<tbody>
												<%
													for (NoticeDTO nDTO : nList) {
														String title = CmmUtil.nvl(nDTO.getTITLE());
														if (title.length() >= 14) {
															title = title.substring(0, 14) + "...";
														}
												%>
												<tr>
													<%
														if (nDTO.getNOTICE_YN().equals("1")) {
													%>
													<td><font color="orange"> <input
															type="checkbox" name="deleteSelect" class="deleteSelect"
															value="<%=nDTO.getNOTICE_NO()%>" /> <b><%=nDTO.getNOTICE_NO()%></b></font></td>
													<%
														} else {
													%>
													<td><input type="checkbox" name="deleteSelect"
														class="deleteSelect" value="<%=nDTO.getNOTICE_NO()%>" />
														<%=nDTO.getNOTICE_NO()%></td>

													<%
														}
															if (nDTO.getNOTICE_YN().equals("1")) {
													%>
													<td><a
														href="/admin/notice/NoticeInfo.do?notice_no=<%=nDTO.getNOTICE_NO()%>"><font
															color="orange"><b><%=title%></b></font></a></td>
													<%
														} else {
													%>
													<td><a
														href="/admin/notice/NoticeInfo.do?notice_no=<%=nDTO.getNOTICE_NO()%>"><%=title%></a></td>
													<%
														}
													%>

													<%
														if (nDTO.getNOTICE_YN().equals("1")) {
													%>
													<td><font color="orange"><b><%=nDTO.getUSER_NO()%></b></font></td>
													<%
														} else {
													%>
													<td><%=nDTO.getUSER_NO()%></td>
													<%
														}
													%>

													<%
														if (nDTO.getNOTICE_YN().equals("1")) {
													%>
													<td><font color="orange"><b><%=nDTO.getREG_DT()%></b></font></td>
													<%
														} else {
													%>
													<td><%=nDTO.getREG_DT()%></td>
													<%
														}
													%>
												</tr>
												<%
													}
												%>
											</tbody>
										</table>
									</div>
								</div>
								<!--  end  Context Classes  -->

								<input type="button"
									onclick="location.href='/admin/notice/NoticeReg.do'"
									value="글쓰기" /> 
									<input type="button" onclick="edit()"
									value="편집" /> 
									<input type="submit" 
									id="delete" value="삭제" />
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
	<!-- JQUERY SCRIPTS -->
	<script src="/assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="/assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="/assets/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<!-- <script src="/assets/js/custom.js"></script> -->

</body>
</html>
