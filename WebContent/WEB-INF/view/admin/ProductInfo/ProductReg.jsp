<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="sports.com.util.CmmUtil" %>
<%@ page import="sports.com.dto.ProductInfoDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %> 
 
<!DOCTYPE html>
<html lang="ko">

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
   		function SetComma(str) { 
   		        
   		      var regMustNumberComma = /^[\t|0-9|,]+$/; 
   		       str = str.replace(/,/g,''); 
   		        
   		       var retValue = ""; 
   		        
   		       for( i = 1; i <= str.length; i++ ) { 
   		          if(i>1 && (i%3)== 1){ 
   		             retValue = str.charAt(str.length - i) + "," + retValue; 
   		              
   		          }else{ 
   		             retValue = str.charAt(str.length - i) + retValue; 
   		              
   		          } 
   		       } 
   		        
   		       if( regMustNumberComma.test(retValue) == false ) 
   		       {
   		    	   alert("숫자만  입력하실 수 있습니다.");
   		       return "";
   		       } 
   		        
   		       return retValue; 
   		    } 

     function optionpopup(){ 
    	
    	  var popURL ="/admin/ProductInfo/ProductInfoOptionReg.do";
    	  var popOption = "width=650, height=360, resizable=no, status=yes;";
    	   			window.open(popURL,"",popOption);
    	  $("#place").attr("placeholder","등록/수정을 이미 클릭 했었습니다.");

     }
    	 
     
    	 
    	 </script>
     
     <script type="text/javascript">
		function doAction(gubun) {
			
		var f = document.getElementById("form1");
		
		//카테고리 선택해라 
		if($("#select").val()=='NA'){
			alert("카테고리를 선택해주세요");
			return false;
		}
		
		if (gubun == "U") {
			f.method = "POST";
			f.action = "/admin/ProductInfo/ProductInfoInsert.do";
			f.submit();
			
		}else if(gubun == "L"){
			f.method = "GET"
			f.action ="/admin/ProductInfo/List.do";
			
		}
		
		
	}
	</script>
	


</head>


<body>
  <section id="wrapper" class="wrapper">
    <header class="header">
      <div class="wrap">
        <div class="left_menu">
          <img src="/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button">
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
				<li><a href="#">공지사항 관리</a></li>
				<li><a href="#">Q&amp;A 관리</a></li>
			</ul>
		</li>
	</ul>
</nav>
       
      

    <div class="container detail">
      <div class="wrap search-wrap btn-wrap">
      
        <form name="form1" id="form1">
        <div class="select_wrap">
          <select class="col-2" id="select">
          <option value="NA">카테고리를 선택해주세요.</option>
          <option value="헬스">헬스</option>
          <option value="축구">축구</option>
          <option value="농구">농구</option>
          <option value="야구">야구</option>
          <option value="보호용품">보호용품</option>
          <option value="무술용품">무술용품</option>
          <option value="수련용품">수련용품</option>
          <option value="권투">권투</option>
          <option value="검도">검도</option>
          <option value="배구">배구</option>
          <option value="족구">족구</option>
          <option value="배드민턴">배드민턴</option>
          <option value="테니스">테니스</option>
          <option value="탁구">탁구</option>
          <option value="수영">수영</option>
          <option value="요가/필라테스">요가/필라테스</option>
          <option value="자전거">자전거</option>
          <option value="스포츠액세서리">스포츠액세서리</option>
          <option value="기타">기타</option>
          </select>
        </div>

        <div class="list_wrap">
          <ul class="register_list">
            <li>
              <p class="blue_text">제품사진</p>
              <div class="input_btn_wrap">
                <input type="text"><button class="line-btn">파일첨부</button>
              </div>

            </li>
            <li>
              <p class="blue_text">제품명</p>
              <input type="text" name="prod_name">
            </li>
            <li>
              <p class="blue_text">제품 가격</p>
              <input onkeyup="this.value=SetComma(this.value)" type="text" name="prod_price"/> 
            </li>
            <li>
              <p class="blue_text">제품 상세</p>
              <textarea name="prod_contents"></textarea>
              <div class="input_btn_wrap">
                <input type="text"><button class="line-btn">파일첨부</button>
              </div>
            </li>
            <li>
              <p class="blue_text">옵션</p>
              <div class="input_btn_wrap">
                <input type="text" id="place" placeholder="옵션을 추가해주세요"><!-- <button class="line-btn" onclick="location.href='/admin/ProductInfo/ProductInfoOptionReg.do';return false;">등록/수정</button> -->
                <input type="button" class="line-btn" onclick="optionpopup();" value="등록/수정"/>
                
              </div>

            </li>
          </ul>

        </div>
        <div class="btn-groub">
          <button class="col-2 blue-btn button" onclick= "doAction('U')">등록</button>
          <button class="col-2 glay-btn button" onclick= "doAction('L')">목록</button>
        </div>
     
             </form>
    
      
      </div>
    </div>
   
    <footer class="footer">
    <a href="#">
      <img src="/common/images/ic_kakao.png" alt="카카오톡" class="kakao">
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
  <script src="/common/js/classie.js"></script>
  <script src="/common/js/common.js"></script>
</body>

</html>
    