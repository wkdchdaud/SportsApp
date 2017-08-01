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
      <div class="wrap search-wrap btn-wrap">
        <div class="search type">
          <select class="search_type">
						<option value="이름">이름</option>
						<option value="아이디">아이디</option>
					</select>
          <input type="text" placeholder="동입력">
          <button class="blue btn">검색</button>
        </div>

        <div class="list_wrap">
          <ul class="list-groub">
            <li class="notice">
              <input type="checkbox" class="checkbox">
              <a href="#">
                <p class="title"><span class="blue_text">[공지]</span>QnA게시판 이용시 주의사항<img src="./common/images/ic_new.png" alt="new" class="ic_new"></p>
                <p class="sub_text">관리자<span>2017-04-14</span></p>
              </a>
            </li>
            <li>
              <input type="checkbox" class="checkbox">
              <a href="#">
                <p class="title">QnA게시판 이용시 주의사항</p>
                <p class="sub_text">강지원<span>2017-04-14</span></p>
                <img src="./common/images/ic_lock.png" class="ic_lock" alt="lock">
              </a>
            </li>
            <li class="list-reply">
              <input type="checkbox" class="checkbox">
              <a href="#">
                <p class="title"><img src="./common/images/ic_reply.png" alt="답글" class="ic_reply">QnA게시판 이용시 주의사항</p>
                <p class="sub_text">강지원<span>2017-04-14</span></p>
              </a>
            </li>
          </ul>
          <label class="all_select"><input type="checkbox">모두 선택하기</label>
          <button class="add_btn">더보기</button>
        </div>
        <div class="btn-groub">
          <button class="col-2 blue-btn button">편집하기</button>
          <button class="col-2 glay-btn button">작성하기</button>
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
