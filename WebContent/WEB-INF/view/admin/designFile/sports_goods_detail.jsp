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
        <p>스포츠 용품</p>
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

        <div class="list_wrap">
          <div class="goods_detail">
            <div class="thumb">
              <img src="./common/images/sample01.png" alt="thumb">
            </div>
            <div class="info">
              <p class="title">한국스포츠 KSD 태권도 품 도복 (아동) TKD POOM Uniform (Child) </p>
              <p class="sub_text">배송비 2,500원 (50,000원 이상 무료배송)</p>
            </div>
          </div>
          <div class="goods_option">
            <p class="blue_text">옵션 선택</p>
            <div class="select_wrap">
              <select class="col-2">
              <option value="색상선택">색상선택</option>
              <option value="빨강">빨강</option>
              </select>
              <select class="col-2">
                <option value="선택">사이즈선택</option>
                <option value="사이즈">사이즈1</option>
              </select>
            </div>

            <p class="blue_text">수량</p>
            <div class="count_input">
              <a class="incr-btn">–</a>
              <input class="quantity" type="text" value="1" readonly="true">
              <a class="incr-btn">+</a>
            </div>
            <div class="price_wrap">총금액<span class="price">33,000</span><span class="won">원</span></div>
          </div>
        </div>

        <div class="list_wrap">
          <h4 class="goods_detail_title">제품 상세정보</h4>
          <div class="detail_contents">
            <img src="./common/images/sample02.png" alt="thumb">
            <dl>
              <dt>제품특징</dt>
              <dd>훈련을 위한 기본 장비로써 가볍고 터칭감이 뛰어나 다양한 훈련에 적합한 제품입니다.
            내구성이 뛰어난 소재로 제작이 되어 더욱 실용적입니다.</dd>
              <dt>상품규격정보</dt>
              <dd>- 재질 : 폴리에스테르 65% + 면 35%<br>
            - 색상 : 검정/노랑/주황/빨강/파랑/밤색/보라</dd>
            </dl>

          </div>
        </div>

        <div class="btn-groub">
          <button class="col-2 blue-btn button">수정</button>
          <button class="col-2 glay-btn button">삭제</button>
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
