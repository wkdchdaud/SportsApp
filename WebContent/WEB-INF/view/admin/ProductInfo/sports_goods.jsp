<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sports.com.util.CmmUtil" %>
<%@ page import="sports.com.dto.ProductInfoDTO" %>
<%@ page import="sports.com.dto.Prod_test_jcmDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
List<Prod_test_jcmDTO> rList = (List<Prod_test_jcmDTO>) request.getAttribute("DLWKDUS");
/*  */
if (rList==null) {
   rList = new ArrayList<Prod_test_jcmDTO>();
}
%> 
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 부트스트랩 -->
    	<!-- BOOTSTRAP STYLES-->
    <link href="/assets/css/bootstrap.css" rel="stylesheet" />
    <title>모두의 스포츠</title>
    <!-- Styles : CSS & SASS Sorcemap -->
    <link rel="stylesheet" href="/common/css/style.css">
    <link rel="stylesheet" href="/common/css/ProductList.css">
    <!-- JavaScirpt Sorcemap -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="/common/js/jquery-ui.js"></script>
    <!--[if lte IE 9]>
    <script src="/common/js/placeholders.min.js"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
     
     <script type="text/javascript">
		//화면 온로드후 실행
		$(function(){
		
		//전역변수로 cnt 값 6 설정
		var cnt = 6;
			
		var price = '';	//셀렉트박스값을 가져옴 all, lowprice, highrprice
		var name= '';	//인풋 검색 서취값 가져옴
		var catname = $("#catname").val(); //카테고리 선택 요소 가져옴 
		
		//더보기 버튼 구현 시작 
		$("#btn_more").add("#as").click(function(){
/* 			alert("더보기 시작113S");
			alert(cnt);
 */				
 				$.ajax({
				url : "/admin/ProductInfo/readMore.do",
				method : "post",
				data : {
					'cnt' : cnt,
					'price': price,
					'name' : name,
					'catname' : catname
				},
				
				dataType : "json",
				success : function(data){
					var contents = "";
					console.log(data)
					$.each(data,function (key,value){
						contents += "<li>";
						contents += "<div class='register'>";                                                   
						contents += "<a href='#'>";
						contents += "<div class='thumb'>";
						contents += "<img src='/common/images/sample01.png' alt='thumb'>";
						contents += "</div>";
						contents += " <div class='info'>";
						contents += "<a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1="+ value.prod_no  +" '> <p class='title'>" + value.prod_name + "</p></a>";
						contents += "<p class='price'>"+ value.price +" 원</p>";
						contents += "</div>";
						contents += "</a>";
						contents += "</div>";
						contents += "</li>";
					});
					$('#menu_list').append(contents)
					if ((data).length<6) {
						$('#btn_more').remove();
					}
					
				}
			});
			cnt += 6;
		});
		
		//상품검색시 
		$("#Search").keyup(function(){
			price=null;
			name=null;
			cnt = 6;
			price = $("#SearchSelect").val();
			name= $('#Search').val();
			if(name==''){
				name= 'all_select';
			}
			
			if(price=='all'){ //만약 셀렉트value 값이 all이면
				$('#menu_list').html(null);
			  	$("#as").html("<center><button class='btn btn-primary btn-lg' id='btn_more' style='width: 300px'>더보기</button></center>");
			
					$.ajax({//아작스 실행
						url : "/admin/ProductInfo/allSearch.do",
						method : "post",
						data : {
							'price' : price,
							'name' : name,	
							'cnt' : cnt,
							'catname' : catname
						},
						dataType : "json",
						success : function(data){//성공하면 함수실행data 키벨류값
			 
							console.log(data);
							var contents = "";
							var cnt=6;

								$.each(data, function(key,value){
									contents += "<li>";
									contents += "<div class='register'>";                                                   
									contents += "<a href='#'>";
									contents += "<div class='thumb'>";
									contents += "<img src='/common/images/sample01.png' alt='thumb'>";
									contents += "</div>";
									contents += " <div class='info'>";
									contents += "<a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1="+ value.prod_no  +" '> <p class='title'>" + value.prod_name + "</p></a>";
									contents += "<p class='price'>"+ value.price +" 원</p>";
									contents += "</div>";
									contents += "</a>";
									contents += "</div>";
									contents += "</li>";
									cnt++;
							});
								
							$('#menu_list').html(contents);
							if ((data).length<6) {
								$('#btn_more').remove();
							}
						}
					});//ok
				
				}		
				else if(price=='lowprice'){
			  //만약 select박스 벨류값이 lowprice라면
				$('#menu_list').html(null);
			  	$("#as").html("<center><button class='btn btn-primary btn-lg' id='btn_more' style='width: 300px'>더보기</button></center>");
				$.ajax({//아작스 실행
					url : "/admin/ProductInfo/lowpriceSearch.do",
					method : "post",
					data : {
						'price' : price,
						'name' : name,
						'cnt' : cnt,
						'catname' : catname
					},
					dataType : "json",
					success : function(data){//성공하면 함수실행data 키벨류값
						console.log(data);
						var contents = "";
						var cnt=6;
							$.each(data, function(key,value){
								contents += "<li>";
								contents += "<div class='register'>";                                                   
								contents += "<a href='#'>";
								contents += "<div class='thumb'>";
								contents += "<img src='/common/images/sample01.png' alt='thumb'>";
								contents += "</div>";
								contents += " <div class='info'>";
								contents += "<a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1="+ value.prod_no  +" '> <p class='title'>" + value.prod_name + "</p></a>";
								contents += "<p class='price'>"+ value.price +" 원</p>";
								contents += "</div>";
								contents += "</a>";
								contents += "</div>";
								contents += "</li>";
								cnt++;
						});
						$('#menu_list').html(contents);
						if ((data).length<6) {
							$('#btn_more').remove();
						}
					}
				});//ok
			}
			else if(price=='highprice'){
				$('#menu_list').html(null);
			  	$("#as").html("<center><button class='btn btn-primary btn-lg' id='btn_more' style='width: 300px'>더보기</button></center>");
					$.ajax({//아작스 실행
					
						url : "/admin/ProductInfo/highpriceSearch.do",
						method : "post",
						data : {
							'price' : price,
							'name' : name,
							'cnt' : cnt,
							'catname' : catname
						},
						dataType : "json",
						success : function(data){//성공하면 함수실행data 키벨류값
							console.log(data);
							var contents = "";
							var cnt=6;
							$.each(data, function(key,value){
								contents += "<li>";
								contents += "<div class='register'>";                                                   
								contents += "<a href='#'>";
								contents += "<div class='thumb'>";
								contents += "<img src='/common/images/sample01.png' alt='thumb'>";
								contents += "</div>";
								contents += " <div class='info'>";
								contents += "<a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1="+ value.prod_no  +" '> <p class='title'>" + value.prod_name + "</p></a>";
								contents += "<p class='price'>"+ value.price +" 원</p>";
								contents += "</div>";
								contents += "</a>";
								contents += "</div>";
								contents += "</li>";
								cnt++;
								
							});
							$('#menu_list').html(contents);
							if ((data).length<6) {
								$('#btn_more').remove();
							}
							
							
							
						}
					});
			}
		});
		
		
		//-----------------------------------------------------------------------------------------------------------------------------
		//select 값 high, all , lowprice 바뀜에 따라 실행하는 아작스 시작
		$("#SearchSelect").change(function(){ //셀렉트 값이 바뀌면 실행됨
			price=null;
			name=null;
			cnt=6;
			price = $("#SearchSelect").val();
			name= $('#Search').val();
			if(name==''){
				name= 'all_select';
			}
		
			if(price=='all'){ //만약 셀렉트value 값이 all이면
				$('#menu_list').html(null);
			  	$("#as").html("<center><button class='btn btn-primary btn-lg' id='btn_more' style='width: 300px'>더보기</button></center>");
					$.ajax({//아작스 실행
						url : "/admin/ProductInfo/allSearch.do",
						method : "post",
						data : {
							'price' : price,
							'name' : name,
							'cnt' : cnt,
							'catname' : catname
						},
						dataType : "json",
						success : function(data){//성공하면 함수실행data 키벨류값
			 
							console.log(data);
							var contents = "";
							var cnt=6;
								$.each(data, function(key,value){
									contents += "<li>";
									contents += "<div class='register'>";                                                   
									contents += "<a href='#'>";
									contents += "<div class='thumb'>";
									contents += "<img src='/common/images/sample01.png' alt='thumb'>";
									contents += "</div>";
									contents += " <div class='info'>";
									contents += "<a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1="+ value.prod_no  +" '> <p class='title'>" + value.prod_name + "</p></a>";
									contents += "<p class='price'>"+ value.price +" 원</p>";
									contents += "</div>";
									contents += "</a>";
									contents += "</div>";
									contents += "</li>";
									cnt++;
							});
								
							$('#menu_list').html(contents);
							if ((data).length<6) {
								$('#btn_more').remove();
							}
						}
					});//ok
				
				}		
				else if(price=='lowprice'){
			  //만약 select박스 벨류값이 lowprice라면
				$('#menu_list').html(null);
			  	$("#as").html("<center><button class='btn btn-primary btn-lg' id='btn_more' style='width: 300px'>더보기</button></center>");
				$.ajax({//아작스 실행
					url : "/admin/ProductInfo/lowpriceSearch.do",
					method : "post",
					data : {
						'price' : price,
						'name' : name,
						'cnt' : cnt,
						'catname' : catname
					},
					dataType : "json",
					success : function(data){//성공하면 함수실행data 키벨류값
						console.log(data);
						var contents = "";
						var cnt=6;
							$.each(data, function(key,value){
								contents += "<li>";
								contents += "<div class='register'>";                                                   
								contents += "<a href='#'>";
								contents += "<div class='thumb'>";
								contents += "<img src='/common/images/sample01.png' alt='thumb'>";
								contents += "</div>";
								contents += " <div class='info'>";
								contents += "<a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1="+ value.prod_no  +" '> <p class='title'>" + value.prod_name + "</p></a>";
								contents += "<p class='price'>"+ value.price +" 원</p>";
								contents += "</div>";
								contents += "</a>";
								contents += "</div>";
								contents += "</li>";
								cnt++;
						});
						$('#menu_list').html(contents);
						if ((data).length<6) {
							$('#btn_more').remove();
						}
					}
				});//ok


			}
			else if(price=='highprice'){
				$('#menu_list').html(null);
			  	$("#as").html("<center><button class='btn btn-primary btn-lg' id='btn_more' style='width: 300px'>더보기</button></center>");

					$.ajax({//아작스 실행
					
						url : "/admin/ProductInfo/highpriceSearch.do",
						method : "post",
						data : {
							'price' : price,
							'name' : name,
							'cnt' : cnt,
							'catname' : catname
						},
						dataType : "json",
						success : function(data){//성공하면 함수실행data 키벨류값
							console.log(data);
							var contents = "";
							var cnt=6;
							$.each(data, function(key,value){
								contents += "<li>";
								contents += "<div class='register'>";                                                   
								contents += "<a href='#'>";
								contents += "<div class='thumb'>";
								contents += "<img src='/common/images/sample01.png' alt='thumb'>";
								contents += "</div>";
								contents += " <div class='info'>";
								contents += "<a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1="+ value.prod_no  +" '> <p class='title'>" + value.prod_name + "</p></a>";
								contents += "<p class='price'>"+ value.price +" 원</p>";
								contents += "</div>";
								contents += "</a>";
								contents += "</div>";
								contents += "</li>";
								cnt++;
								
							});
							$('#menu_list').html(contents);
							
							if ((data).length<6) {
								$('#btn_more').remove();
							}
						}
					});
			}
		});
		//select 값 high, all , lowprice 바뀜에 따라 실행하는 아작스 끝
		
	});
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
                <p>스포츠 용품 리스트</p>
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
            <div class="wrap search-wrap">
                <div class="search array">
                    <select id="SearchSelect" style="width: 20%" class="array-btn">
                    <option value='all'>전체</option>
                    <option value='lowprice'>낮은가격</option>
                    <option value='highprice'>높은가격</option>
                    </select>
                    
                    <div style="padding-left : 15%;">
                    <input name='keyWord' id='Search' type="text" placeholder="검색하세요">
                    </div>
<!--                     <button class="blue btn">검색</button>
 -->            </div>
                <div class="list_wrap">
                    <ul class="sports_list">
                    	<li><a href="/admin/ProductInfo/List.do">전체</a></li>
                    	<li><a href="/admin/ProductInfo/List_value.do?par=헬스">헬스</a></li>
                    	<li><a href="/admin/ProductInfo/List_value.do?par=축구">축구</a></li>
                    	<li><a href="/admin/ProductInfo/List_value.do?par=농구">농구</a></li>
                        <li><a href="/admin/ProductInfo/List_value.do?par=야구">야구</a></li>
                    	<li><a href="/admin/ProductInfo/List_value.do?par=보호용품">보호용품</a></li>
                    	<li><a href="/admin/ProductInfo/List_value.do?par=무술용품">무술용품</a></li>
                    	<li><a href="/admin/ProductInfo/List_value.do?par=수련용품">수련용품</a></li>
                    	<li><a href="/admin/ProductInfo/List_value.do?par=권투">권투</a></li>
                    	<li><a href="/admin/ProductInfo/List_value.do?par=검도">검도</a></li>
                    	<li><a href="/admin/ProductInfo/List_value.do?par=배구">배구</a></li>
                    	<li><a href="/admin/ProductInfo/List_value.do?par=족구">족구</a></li>
                        <li><a href="/admin/ProductInfo/List_value.do?par=배드민턴">배드민턴</a></li>
                        <li><a href="/admin/ProductInfo/List_value.do?par=테니스">테니스</a></li>
                        <li><a href="/admin/ProductInfo/List_value.do?par=탁구">탁구</a></li>
                        <li><a href="/admin/ProductInfo/List_value.do?par=수영">수영</a></li>
                        <li><a href="/admin/ProductInfo/List_value.do?par=요가/필라테스">요가/필라테스</a></li>
                        <li><a href="/admin/ProductInfo/List_value.do?par=자전거">자전거</a></li>
                        <li><a href="/admin/ProductInfo/List_value.do?par=스포츠액세서리">스포츠 액세서리</a></li>
                        <li><a href="/admin/ProductInfo/List_value.do?par=기타">기타</a></li>
                    </ul>
                </div>
                <div class="goods_list_wrap">
                    <ul id="menu_list" class="goods_list">
                      	<%for(Prod_test_jcmDTO pdto : rList) {%>
                        <li>
                            <div class="register">
                                <a href="#">
                                    <div class="thumb">
                                        <img src="/common/images/sample01.png" alt="thumb">
                                        <input type="hidden" id="catname" name="catname" value="<%=pdto.getProd_category()%>" />
                                    </div>
                                    <div class="info">
                                      
                                        <a href="/admin/ProductInfo/ProductInfoDetail.do?prod_no1=<%=CmmUtil.nvl(pdto.getProd_no()) %>"> <p class="title"><%=pdto.getProd_name() %></p></a>
                                        <p class="price"><%=CmmUtil.viewComma(pdto.getPrice())%>원</p>
                                    </div>
                                </a>
                            </div>
                        </li>
                     <%} %>
                     
                    </ul>
                     <div id="as">
        			 <center><button class="btn btn-primary btn-lg" id="btn_more" style="width: 300px; margin-top: 5px">더보기</button></center>
        			 </div>
                    <button class="register-btn thumb-btn" onclick="location.href='/admin/ProductInfo/ProductInfoReg.do' ">등록</button>
                    <button class="edit-btn thumb-btn2">편집</button>
                   
                </div>
            </div>
        </div>
        <footer class="footer">
            <a href="#"><img src="/common/images/ic_kakao.png" alt="카카오톡" class="kakao"></a>
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