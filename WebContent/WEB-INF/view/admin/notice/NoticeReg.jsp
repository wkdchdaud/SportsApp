
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="sports.com.util.CmmUtil"
	import="sports.com.dto.NoticeDTO" import="java.util.ArrayList"
	import="java.util.List"%>

<%
	List<NoticeDTO> nList = (List<NoticeDTO>) request.getAttribute("nList");
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
	function doSubmit(f) {

		if (f.title.value == "") {

			alert("제목을 입력하시기 바랍니다.");
			f.title.focus();
			return false;

		}

		if (f.contents.value == "") {

			alert("내용을 입력하시기 바랍니다.");
			f.contents.focus();
			return false;

		}

		if (calBytes(f.title.value) > 100) {

			alert("제목은 최대 100Bytes까지만 입력 가능합니다.");
			f.title.focus();
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

		for (i = 0; i < strCnt; i++) {

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
		<!-- /. NAV TOP  -->
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
							<li><a href="/admin/notice/NoticeList.do">공지사항 </a></li>
							<li><a href="#">Q&A</a></li>
						</ul></li>
				</ul>

			</div>

		</nav>
		<!-- /. NAV SIDE  -->
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
							<div class="panel-heading">공지사항 등록</div>
							<!--    Context Classes  -->
							<form method='post' action="/admin/notice/NoticeInsert.do" onsubmit="return doSubmit(this);">
								<div class="panel panel-default" style="width: 100%">


									<div class="panel-body">

										<table class="table">

											<tbody>
												<tr>
													<td>제목</td>
													<td><input type="text" name="title" value=""
														maxlength="50"></td>
												</tr>
												<tr>
													<td colspan="2">중요 공지글 게시여부&nbsp;&nbsp;&nbsp; 예&nbsp;<input
														type="radio" name="notice_yn" value="1" />&nbsp;&nbsp;
														아니오&nbsp;<input type="radio" name="notice_yn" value="2"
														checked />
													</td>
												</tr>
												<tr>
													<td colspan="2"><textarea name="contents"
															maxlength="1500" 
															style="width: 510px; height: 500px" wrap="physical" ></textarea></td>
												</tr>
											</tbody>

										</table>
									</div>
								</div>
								<input type="submit" value="등록" /> <input type="button"
									value="취소"
									onclick="location.href='/admin/notice/NoticeList.do'" />
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
	</div>
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

