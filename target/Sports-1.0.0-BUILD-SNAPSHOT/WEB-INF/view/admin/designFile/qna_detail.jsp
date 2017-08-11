<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>모두의 스포츠</title>
    <!-- Styles : CSS & SASS Sorcemap -->
    <link rel="stylesheet" href="./common/css/style.css">
    <!-- JavaScirpt Sorcemap -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="./common/js/jquery-ui.js"></script>
    <script src="./common/js/modernizr.custom.js"></script>
    <!--[if lte IE 9]>
    <script src="./common/js/placeholders.min.js"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>


<body>
  <section id="wrapper" class="wrapper">
    <header class="header">
	<div class="wrap">
		<div class="left_menu">
			<img src="./common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button">
		</div>
		<div class="logo">
			<a href="#"><h2 class="title">모두의 스포츠</h2></a>
		</div>
	</div>

	<div class="page_title">
		<p>Q&amp;A</p>
	</div>
</header>

    <nav id="c-menu--slide-left" class="c-menu c-menu--slide-left">

	<div class="profile">
		<p><img src="./common/images/menu/user.png" class="photo">로그인을 해주세요</p>
		<button class="c-menu__close"><img src="./common/images/menu/cancel.png" alt="닫기"></button>
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
				<li><a href="#"><img src="./common/images/menu/001.png" class="icon"><p>매출분석 정보</p></a></li>
				<li><a href="#"><img src="./common/images/menu/002.png" class="icon"><p>연관성 분석 정보</p></a></li>
				<li><a href="#"><img src="./common/images/menu/003.png" class="icon"><p>장바구니 분석 정보</p></a></li>
			</ul>
		</li>
		<li>
			<a href="#">스포츠 용품 리스트 관리</a>
			<ul class="col-2 more">
				<li><a href="#"><img src="./common/images/menu/ic_01.png" class="icon">전체상품</a></li>
				<li><a href="#"><img src="./common/images/menu/ic_02.png" class="icon">태권도</a></li>
				<li><a href="#"><img src="./common/images/menu/ic_03.png" class="icon">합기도</a></li>
				<li><a href="#"><img src="./common/images/menu/ic_04.png" class="icon">검도</a></li>
				<li><a href="#"><img src="./common/images/menu/ic_05.png" class="icon">복싱, MMA</a></li>
				<li><a href="#"><img src="./common/images/menu/ic_06.png" class="icon">스포츠의류</a></li>
				<li><a href="#"><img src="./common/images/menu/ic_07.png" class="icon">스포츠용품(구기)</a></li>
				<li><a href="#"><img src="./common/images/menu/ic_08.png" class="icon">네트&amp;골대</a></li>
				<li><a href="#"><img src="./common/images/menu/ic_09.png" class="icon">휘트니스</a></li>
				<li><a href="#"><img src="./common/images/menu/ic_10.png" class="icon">학교체육용품</a></li>
				<li><a href="#"><img src="./common/images/menu/ic_11.png" class="icon">체육대회용품</a></li>
				<li><a href="#"><img src="./common/images/menu/ic_12.png" class="icon">측정용품&amp;호각</a></li>
				<li><a href="#"><img src="./common/images/menu/ic_13.png" class="icon">펌프</a></li>
        <li><a href="#"><img src="./common/images/menu/ic_13.png" class="icon">정리용품</a></li>
			</ul>
		</li>
		<li>
			<a href="#">고객센터 관리</a>
			<ul class="col-2">
				<li><a href="#">공지사항 관리</a></li>
				<li><a href="#">Q&amp;A 관리</a></li>
			</ul>
		</li>
	</ul>
</nav>


    <div class="container detail">
      <div class="wrap btn-wrap">
        <div class="list_wrap qna_detail">
          <div class="top">
            <p class="title">QnA 게시판 이용시에 지켜야할 주의사항입니다.</p>
            <p class="sub_text">관리자<span>2017-04-14  14:15</span></p>
          </div>
          <div class="content">
            1. QnA 게시판은 실명제로 운영됩니다.<br>
            2. 답글은 주말, 공휴일 제외 24시간 이내로 확인하실 수 있습니다.<br>
            3. 목적에 맞지 않는 글은 작성자의 동의 없이 삭제될 수 있습니다.
          </div>
        </div>
        <div class="btn-groub">
          <button class="col-3 deep-btn button">수정</button>
          <button class="col-3 blue-btn button">삭제</button>
          <button class="col-3 glay-btn button">목록</button>
        </div>
      </div>

    </div>
    <footer class="footer">
    <a href="#">
      <img src="./common/images/ic_kakao.png" alt="카카오톡" class="kakao">
    </a>
    <div class="company_info">
      <p>대표이사 : 장명훈 ㅣ 대표번호 : 010-9057-6156</p>
      <p>사업자등록번호 : 567-36-00142</p>
      <p>통신판매업신고 : 2017-인천서구-0309호</p>
      <p>인천시 서구 보도진로 18번길 12(가좌동) 진성테크2층</p>
      <p>Copyright © <strong>모두의 스포츠</strong> All rights reserved. </p>
    </div>
</footer>

  </section>
  <div id="c-mask" class="c-mask"></div>
  <script src="./common/js/classie.js"></script>
  <script src="./common/js/common.js"></script>
</body>

</html>