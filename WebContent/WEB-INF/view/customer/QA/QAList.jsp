<!-- for Customer -->

<%@ page import="java.util.Calendar"%>
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
List<QADTO> rList =	(List<QADTO>) request.getAttribute("rList");

if (rList==null) {
	rList = new ArrayList<QADTO>();
}

String user_no = CmmUtil.nvl((String)session.getAttribute("user_no"));

int access = 1;

if (user_no.equals("")) {
	access = 2;
}
%>   
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

$(function() {
	
	var cnt = 6;
	var search ="";

//검색
$('#searchbox').keyup(function() {
		
	cnt = 6;
	search = $('#searchbox').val();
		
	$.ajax({
			
		url : "/customer/QA/QASearchList.do",
		method : "post",
		data : {'search' : search},
		datatype :	"json",
		success : function(data) {
				
			var contents ="";
			console.log(data)
				
			$.each(data,function (key,value) {
					
				var nw = value.new_yn;
				var lock = value.secret_yn;				
					
				contents += "<li>";
				
				if (value.answer_yn == "Y") {
					contents += "<a href='/customer/QA/QAAnswerDetail.do?qa_no="+value.qa_no+"'>";
				} else {
					contents += "<a href='/customer/QA/QADetail.do?qa_no="+value.qa_no+"'>";
				}
				
				contents += "<p class='title'>";
				
				if (value.answer_yn == "Y") {
					contents += "<img src='/common/images/ic_reply.png' alt='답글' class='ic_reply'>";
				}
				
				contents += "<span>"+value.title+"</span>";
				
				if (nw == 'Y') {	
					contents += "<img src='/common/images/ic_new.png' alt='new' class='ic_new'>";
				}
				
				if (lock == '1') {
					contents += "<img src='/common/images/ic_lock.png' class='ic_lock' alt='lock'>";
				}
				
				contents += "</p>";
				contents += "</a>"
				contents += "<p class='sub_text'>"+value.user_name+"<span>"+value.reg_dt+"</span></p>";
				contents += "</li>";
					
			});
				
			$('#list_more').html(null);
			$('#list_more').append(contents);
			
			if ((data).length < 6) {
				$("#addview").hide();
			}
				
			if (data.length >= 6) {
				$("#searchadd").html("<button class='add_btn' value='더보기' id='addview'>더보기</button>");
			}
				
		}
			
	});	//ajax closed
		
});	//"searchbox" function closed
	
<% if (rList.size() < 6) {%>
	$("#addview").hide();
<%} %>

$("#addview").add("#searchadd").click(function() {
	
	$.ajax({

		url : "/customer/QA/QAReadMore.do",
		method : "post",
		data : {'cnt' : cnt, 'search' : search},
		dataType : "json",
		success : function(data) {
			
			var contents = "";
			console.log(data)
			
			$.each(data,function (key,value) {
				
				var nw = value.new_yn;
				var lock = value.secret_yn;
				
				contents += "<li>";
				
				if (value.answer_yn == "Y") {
					contents += "<a href='/customer/QA/QAAnswerDetail.do?qa_no="+value.qa_no+"'>";
				} else {
					contents += "<a href='/customer/QA/QADetail.do?qa_no="+value.qa_no+"'>";
				}
				
				contents += "<p class='title'>"
				
				if (value.answer_yn == "Y") {
					contents += "<img src='/common/images/ic_reply.png' alt='답글' class='ic_reply'>";
				}
				
				contents += "<span>"+value.title+"</span>";
				
				if (nw == 'Y') {	
					contents += "<img src='/common/images/ic_new.png' alt='new' class='ic_new'>";
				}
				
				if (lock == '1') {
					contents += "<img src='/common/images/ic_lock.png' class='ic_lock' alt='lock'>";
				}
				
				contents += "</p>"
				contents += "</a>"
				contents += "<p class='sub_text'>"+value.user_name+"<span>"+value.reg_dt+"</span></p>";
				contents += "</li>"
				
			});
			
			$('#list_more').append(contents);
			
			if ((data).length<6) {
				$('#addview').remove();
			}
			
		}
	
	});	//ajax closed
	
	cnt += 6;
	
});	//"addview" function closed

});	//jQuery function closed

//질문 상세 이동
function doDetail(qa_no, secret_yn, reg_user_no) {
	
	var user_no = "<%=user_no %>";
	
	if (reg_user_no != user_no && secret_yn == 1) {
		
		alert('비밀글입니다.');
		return;
		
	}
	
	location.href="/customer/QA/QADetail.do?qa_no=" + qa_no;
}

//답글 상세 이동
function doAnswerDetail(qa_no, secret_yn, reg_user_no) {
	
	var user_no = "<%=user_no %>";
	
	if (reg_user_no != user_no && secret_yn == 1) {
		
		alert('비밀글입니다.');
		return;
		
	}
	
	location.href="/customer/QA/QAAnswerDetail.do?qa_no=" + qa_no;
	
}

//글쓰기 로그인
function doReg() {
	
	if ("<%=access%>"==2) {
		
		alert("로그인을 하시기 바랍니다.");
	
	} else {
		
		location.href="/customer/QA/QAReg.do";
		
	}
	
}

</script>

</head>

<body>

	<section id="wrapper" class="wrapper">
	
	    <header class="header">
			<div class="wrap">
				<div class="left_menu"><img src="/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button"></div>
				<div class="logo"><a href="/main.do"><h2 class="title">모두의 스포츠</h2></a></div>
			</div>
			<div class="page_title"><p>Q&amp;A</p></div>
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
			
				<div class="search type"><input type="text" placeholder="제목 입력" id="searchbox" style="width:200px" /></div>
	
				<div class="list_wrap">
					<ul class="list-groub" id="list_more">
						<%
							for (QADTO rDTO : rList) {
		
							if (rDTO==null) {
								rDTO = new QADTO();
							}
						%>
			            <li>
							<% if (CmmUtil.nvl(rDTO.getAnswer_yn()).equals("Y")) {%>
							
								<a href="javascript:doAnswerDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>');">
								
								<p class="title">
								
								<img src="/common/images/ic_reply.png" alt="답글" class="ic_reply">
				
								<span><%=CmmUtil.nvl(rDTO.getTitle()) %></span>
								
								<% if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {%>
									<img src="/common/images/ic_lock.png" class="ic_lock" alt="lock">
								<%} %>
					
								<% if (CmmUtil.nvl(rDTO.getNew_yn()).equals("Y")) {%>
									<img src="/common/images/ic_new.png" alt="new" class="ic_new">
								<%} %>
								
								</p>
								
								</a>
								
							<%} else {%>
								
								<a href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>');">
								
								<p class="title">
								
								<span><%=CmmUtil.nvl(rDTO.getTitle()) %></span>
								
								<% if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {%>
									<img src="/common/images/ic_lock.png" class="ic_lock" alt="lock">
								<%} %>
								
								<% if (CmmUtil.nvl(rDTO.getNew_yn()).equals("Y")) {%>
									<img src="/common/images/ic_new.png" alt="new" class="ic_new">
								<%} %>
								
								</p>
								
								</a>
								
							<%} %>
								
							<p class="sub_text"><%=CmmUtil.nvl(rDTO.getAnswer_yn()).equals("Y")?"관리자":CmmUtil.nvl(rDTO.getUser_name()) %><span><%=CmmUtil.nvl(rDTO.getReg_dt().substring(0, 10)) %></span></p>
			            </li>
						<%
						}
						%>
		          	</ul>
					<div id="searchadd"><button class="add_btn" value="더보기" id="addview">더보기</button></div>
		        </div>
			            			
		        <div class="btn-groub">
					<button class="col-3 glay-btn button" onclick="javascript:doReg();return false;"></button>
					<button class="col-3 glay-btn button" onclick="javascript:doReg();return false;">작성하기</button>
					<button class="col-3 glay-btn button" onclick="javascript:doReg();return false;"></button>				
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
	
	</form>	

	</section>
  
	<div id="c-mask" class="c-mask"></div>
	<script src="/common/js/classie.js"></script>
	<script src="/common/js/common.js"></script>
  
</body>

</html>