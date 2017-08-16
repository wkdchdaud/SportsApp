<!-- for Administrator -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sports.com.util.CmmUtil" %>
<%
String user_no = CmmUtil.nvl((String)session.getAttribute("user_no"));
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>모두의 스포츠</title>
<!-- Styles : CSS & SASS Sorcemap -->
<link rel="stylesheet" href="/common/css/style.css">
<!-- JavaScirpt Sorcemap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>
<script src="/common/js/modernizr.custom.js"></script>
<!--[if lte IE 9]>
<script src="/common/js/placeholders.min.js"></script>
<![endif]-->
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

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

	<section id="wrapper" class="wrapper">
  
	<form name="f" method="post" action="/admin/QA/QAInsert.do" enctype="multipart/form-data" onsubmit="return doSubmit(this);">
  
	    <header class="header">
			<div class="wrap">
				<div class="left_menu"><img src="/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button"></div>
				<div class="logo"><a href="/main.do"><h2 class="title">모두의 스포츠</h2></a></div>
			</div>
			<div class="page_title" style=" float: left; width: 33%;"><span class="sub_text" id="delete" onclick="javascript:deleteConfirm(this.form);">삭제하기</span>&nbsp;</div>
			<div class="page_title" style=" float: left; width: 33%;"><p>Q&amp;A</p></div>
			<div class="page_title" style=" float: left; width: 33%;"></div>
		</header>
	
	    <nav id="c-menu--slide-left" class="c-menu c-menu--slide-left">
			<div class="profile">
				<p><img src="/common/images/menu/user.png" class="photo">로그인을 해주세요</p>
				<button class="c-menu__close"><img src="/common/images/menu/cancel.png" alt="닫기"></button>
				<div class="login_wrap"><a href="#">로그인</a><a href="#">회원가입</a></div>
			</div>
			<ul class="menu_list">
				<li><a href="#">주문관리</a></li>
				<li>
					<a href="#">학원관리</a>
					<ul class="col-2">
						<li><a href="#">학원 밀집도 정보</a></li>
						<li><a href="#">거래처 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">매출 분석 정보</a>
					<ul class="col-3">
						<li><a href="#"><img src="/common/images/menu/001.png" class="icon"><p>매출분석 정보</p></a></li>
						<li><a href="#"><img src="/common/images/menu/002.png" class="icon"><p>연관성 분석 정보</p></a></li>
						<li><a href="#"><img src="/common/images/menu/003.png" class="icon"><p>장바구니 분석 정보</p></a></li>
					</ul>
				</li>
				<li>
					<a href="#">스포츠 용품 리스트 관리</a>
					<ul class="col-2 more">
						<li><a href="#"><img src="/common/images/menu/ic_01.png" class="icon">전체상품</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_02.png" class="icon">태권도</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_03.png" class="icon">합기도</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_04.png" class="icon">검도</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_05.png" class="icon">복싱, MMA</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_06.png" class="icon">스포츠의류</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_07.png" class="icon">스포츠용품(구기)</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_08.png" class="icon">네트&amp;골대</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_09.png" class="icon">휘트니스</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_10.png" class="icon">학교체육용품</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_11.png" class="icon">체육대회용품</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_12.png" class="icon">측정용품&amp;호각</a></li>
						<li><a href="#"><img src="/common/images/menu/ic_13.png" class="icon">펌프</a></li>
		        		<li><a href="#"><img src="/common/images/menu/ic_13.png" class="icon">정리용품</a></li>
					</ul>
				</li>
				<li>
					<a href="#">고객센터 관리</a>
					<ul class="col-2">
						<li><a href="/admin/notice/NoticeList.do">공지사항 관리</a></li>
						<li><a href="/admin/QA/QAList.do">Q&amp;A 관리</a></li>
					</ul>
				</li>
			</ul>
		</nav>

		<div class="container detail">
			<div class="wrap search-wrap btn-wrap">
			
				<div class="list_wrap">
					<ul class="register_list">
						<li>
							<p class="blue_text">제목</p>
							<div class="input_btn_wrap"><input type="text" name="title"></div>				
						</li>
						
						
						
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
	<input type="button" value="목록" onclick="location.href='/admin/QA/QAList.do' " />
	
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