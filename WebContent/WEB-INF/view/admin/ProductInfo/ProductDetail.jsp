<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="sports.com.dto.ProductInfoOptionDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="sports.com.dto.ProductFileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="sports.com.util.CmmUtil" %>
<%@ page import="sports.com.dto.ProductInfoDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %> 
<%
ProductInfoDTO rDTO = (ProductInfoDTO) request.getAttribute("dlwkdus");
	
if (rDTO==null) {
	rDTO = new ProductInfoDTO();
}
	
List<ProductFileDTO> fileList = (List<ProductFileDTO>) request.getAttribute("file");

if (fileList==null) {
	fileList = new ArrayList<ProductFileDTO>();
}

List<ProductInfoOptionDTO> oList = (List<ProductInfoOptionDTO>) request.getAttribute("oList");
	
if (oList==null) {
	oList = new ArrayList<ProductInfoOptionDTO>();
}
%>

<%
List<String> OptName = new ArrayList();
					
//배열은 선언과 동시에 배열의 크기를 지정해야함
//List는 LinkedList의 구조로 선언시에 List의 크기를 지정하지않고 List에 값을 add할때마다 List의 크기가 커지는 형식
		            
for (ProductInfoOptionDTO oDTO : oList) {
	OptName.add(oDTO.getOpt_name());	//List에 값을 넣는 코드 값을 뺄때는 OptName.get(index값);
}
					
Set<String> setOptName = new HashSet<String>(OptName);	//옵션값 유니크하게 뽑기
List<String> alignOptName = new ArrayList(setOptName);
		           
String firstOpt = "";
String secondOpt = "";
		            
if (alignOptName.size() == 2) {
	
	firstOpt = alignOptName.get(0).toString();
	secondOpt = alignOptName.get(1).toString();

} else if (alignOptName.size() == 1) {
	
	firstOpt =	alignOptName.get(0).toString(); 
	
}
		            
System.out.println("firstOpt" + firstOpt);
System.out.println("secondOpt" + secondOpt);
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
    
function doAction(gubun) {
			
	var f = document.getElementById("form1");
		
	if (gubun == "U") {
		
		f.action = "/admin/ProductInfo/ProductInfoUpdateForm.do";
		f.submit();
		
	} else if (gubun == "D") {
		
		if (confirm("삭제하시겠습니까?")) {
			
			f.action = "/admin/ProductInfo/ProductInfoDelete.do";
			f.submit();
			
		}
		
	} else if(gubun == "L") {
		
		f.action ="/admin/ProductInfo/List.do";
			
	}
	
}

$(function() {
		
	var sell_price;
	var amount;

})
	
function pickOption() {
	
	var sop = document.getElementById("secondOpt");
		
	alert(document.getElementById("firstOpt").value);
		
	sop.removeAttribute("disabled");
		
	if (document.getElementById("firstOpt").value == document.getElementById("firstOpt")[0].value) {
		
		sop.disabled = 'false';
		sop.options[0].selected = true;	//선택값 초기화

	}
			
}

function chkOptVal() {
	
	var firstOpt = "<%=firstOpt %>";
	var secondOpt = "<%=secondOpt %>";
	
	if (firstOpt == "") {
		
		document.getElementById("firstOpt").style.display = "none";
		document.getElementById("secondOpt").style.display = "none";
		document.getElementById("OptText").style.display = "none";
		
	} else if (secondOpt == "") {
		
		document.getElementById("secondOpt").style.display = "none";
		
	}
	
}

/*
$(function() {

$('#secondOpt').keyup(function() {

	$.ajax({
		
		url : "/admin/Product/ProductDetailOpt.do",
		method : "post",
		data : {'option' : option},
		datatype :	"json",
		success : function(data) {
		
		
		
		
	}	//ajax closed
	
});	//"secondOpt" function closed	

});	//jQuery function closed
*/

</script>
	
</head>

<body onload="javascript:chkOptVal();return false;">

	<section id="wrapper" class="wrapper">
	
		<header class="header">
			<div class="wrap">
				<div class="left_menu"><img src="/common/images/btn_gnb.png" alt="메뉴" id="c-button--slide-left" class="c-button"></div>
				<div class="logo"><a href="#"><h2 class="title">모두의 스포츠</h2></a></div>
      		</div>
      		<div class="page_title"><p>스포츠 용품</p></div>
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

		<form name="form1" id="form1" method="GET">
	
		<input type="hidden" name="prod_no1" value="<%=CmmUtil.nvl(rDTO.getProd_no())%>" />
	
		<div class="container detail">
			<div class="wrap btn-wrap">
	
				<div class="list_wrap">
				
					<div class="goods_detail">
						<div class="thumb">
							<input type="image" src="<%=CmmUtil.nvl(fileList.get(0).getFile_path()+"/"+fileList.get(0).getSrc_filename())%>" style="height: 300px; width: 300px;"/>
						</div>
			            <div class="info">
							<p class="title"><%=CmmUtil.nvl(rDTO.getProd_name()) %></p>
							<p class="sub_text">배송비 2,500원 (50,000원 이상 무료배송)</p>
			            </div>
					</div>
					
							
					
					<div class="goods_option">
					
            			<p class="blue_text" id="OptText">옵션 선택</p>
            				<div class="select_wrap">
              					<select class="col-2" id="firstOpt" onchange="javascript:pickOption()" >
									<option value="<%=firstOpt %>"><%=firstOpt %></option>
									<% for (ProductInfoOptionDTO oDTO: oList) {
										if (firstOpt.equals(oDTO.getOpt_name())) {%>
              						<option value="<%=oDTO.getOpt_kind() %>"><%=oDTO.getOpt_kind() %></option>
              						<%
              							}
              						}%>
              					</select>
              					<select class="col-2" id="secondOpt" disabled='false'>
                 					<option value="<%=secondOpt %>" ><%=secondOpt %></option>
                 					<% for (ProductInfoOptionDTO oDTO : oList) {
              							if (secondOpt.equals(oDTO.getOpt_name())) {%>
              						<option value="<%=oDTO.getOpt_kind() %>"><%=oDTO.getOpt_kind() %></option>
              						<%
              							}
                 					}%>
              					</select>
            				</div>
									
						<!-- 수정 시작ㅎ  -->
						<p class="blue_text">수량</p>
							<div class="count_input">
								<a class="incr-btn" onclick="del();">–</a>
								<input class="quantity" type="text" name="amount" value="1" readonly="true" onchange="change();" />
								<a class="incr-btn" onclick="add();">+</a>
							</div>
			            	<div class="price_wrap">총금액<span class="price"></span><span class="won">원</span></div>
			            
					</div>
				
				</div>
		
				<div class="list_wrap">
					<h4 class="goods_detail_title">제품 상세정보</h4>
					<div class="detail_contents">
						<%
						Iterator<ProductFileDTO> it = fileList.iterator();
						while (it.hasNext()) {
							ProductFileDTO pDTO = it.next();
						%>
						<input type="image" src="<%=CmmUtil.nvl(pDTO.getFile_path()+"/"+pDTO.getSrc_filename()) %>" style="height: 300px; width: 300px;"/>
						<%} %>
						<dl>
							<dt>제품특징</dt> 
							<dd><%=CmmUtil.nvl(rDTO.getProd_contents()).replaceAll("\r\n", "<br>") %></dd>
						</dl>
					</div>
				</div>
	
				<div class="btn-groub">
					<button class="col-3 deep-btn button" onclick="doAction('U')">수정</button>
					<button class="col-3 blue-btn button" onclick="doAction('D')">삭제</button>
					<button class="col-3 glay-btn button" onclick="doAction('L')">목록</button>
				</div>
	        
			</div>
		</div>
	    
	    </form>
	    
		<footer class="footer">
		    <a href="#"><img src="/common/images/ic_kakao.png" alt="카카오톡" class="kakao"></a>
		    <div class="company_info">
		      <p>대표이사 : 장명훈 ㅣ 대표번호 : 010-9057-6156</p>
		      <p>사업자등록번호 : 567-36-00142</p>
		      <p>통신판매업신고 : 2017-인천서구-0309호</p>
		      <p>인천시 서구 보도진로 18번길 12(가좌동) 진성테크2층</p>
		      <p>Copyright © <strong>모두의 스포츠</strong> All rights reserved.</p>
		    </div>
		</footer>

	</section>
	
	<div id="c-mask" class="c-mask"></div>
	<script src="/common/js/classie.js"></script>
	<script src="/common/js/common.js"></script>

</body>

</html>