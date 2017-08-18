<%@ page import="java.util.Set"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="sports.com.dto.ProductInfoOptionDTO"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="sports.com.dto.ProductFileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="sports.com.util.CmmUtil"%>
<%@ page import="sports.com.dto.ProductInfoDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%> 
<%
ProductInfoDTO rDTO = (ProductInfoDTO) request.getAttribute("rDTO");
if (rDTO==null) {
	rDTO = new ProductInfoDTO();
}
	
List<ProductFileDTO> fileList = (List<ProductFileDTO>) request.getAttribute("fileList");
if (fileList==null) {
	fileList = new ArrayList<ProductFileDTO>();
}

List<ProductInfoOptionDTO> oList = (List<ProductInfoOptionDTO>) request.getAttribute("oList");
if (oList==null) {
	oList = new ArrayList<ProductInfoOptionDTO>();
}

List<ProductInfoOptionDTO> fir_option = new ArrayList<ProductInfoOptionDTO>();
List<ProductInfoOptionDTO> sec_option = new ArrayList<ProductInfoOptionDTO>();

ProductInfoOptionDTO zDTO = oList.get(0);
for(ProductInfoOptionDTO infoDTO : oList){
	if(CmmUtil.nvl(infoDTO.getOpt_name()).equals(CmmUtil.nvl(zDTO.getOpt_name()))){
		fir_option.add(infoDTO);
	}else{
		sec_option.add(infoDTO);
	}
}

String firstOpt = CmmUtil.nvl(fir_option.get(0).getOpt_name());
String secondOpt = CmmUtil.nvl(sec_option.get(0).getOpt_name());
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
var num = 0;

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

function fir_pick() {
	document.getElementById("secondOpt").disabled=false;
}

function sec_pick() {
	
	var contents ="";
	var firstOpt = document.getElementById("firstOpt");
	var secondOpt = document.getElementById("secondOpt");
	
	var t_f = false;
	var number = -1;
	
	for(i=0;i<num;i++){
		if(document.getElementById("sumop_"+i)!=null) {
			if(document.getElementById("sumop_"+i).innerHTML == firstOpt.value + " + " +secondOpt.value){
				number = i;
				t_f = true;
			}
		}
	}
	
	if(t_f){
		add_one(number);
	}else{
		contents += "<div class='list_wrap' id='div_"+num+"'>";
		contents += "<center id='sumop_"+num+"'>"+firstOpt.value + " + " +secondOpt.value+"</center>"+"<br />";
		contents += "<div style='float:left' align='left'><p><font class='blue_text'>수량&nbsp;</font>";
		contents += "<div class='count_input'>";
		contents += "<a class='incr-btn' onclick='del_one("+num+");'>-</a>";
		contents += "<input id='cnt_"+num+"' class='quantity' type='text' name='amount' value='1' readonly='true' onchange='change();' />";
		contents += "<a class='incr-btn' onclick='add_one("+num+");'>+</a>";
		contents += "</div>";
		contents += "<font class='blue_text'>금액&nbsp;</font><span class='price' id='price_"+num+"'>"+<%=rDTO.getProd_price()%>+"</span><span class='won'>원</span>"
		contents += "<a href='javascript:div_delete("+num+")'>";
		contents += "<img src='/common/images/ic_delete.png' style='width: 40px;height: 40px'>";
		contents += "</a>";
		contents += "</p>";
		contents += "</div>";
		contents += "</div>";
		num++;
		$('#optionBox').append(contents);
	}
	var total = 0;
	for(i=0;i<num;i++){
		if(document.getElementById("price_"+i)!=null){
			total += Number(document.getElementById("price_"+i).innerHTML);
		}
	}
	
	document.getElementById("total_price").innerHTML = total;
	
	document.getElementById("firstOpt")[0].selected = true;
	document.getElementById("secondOpt")[0].selected = true;
	document.getElementById("secondOpt").disabled=true;
	
}



function ch_price(number) {
	
	var price = <%=rDTO.getProd_price()%>;
	var cnt =  document.getElementById("cnt_"+number).value;
	var re_price = price * cnt;
	alert(re_price);
	
	var span_price = document.getElementById("price_"+number);
	span_price.innerHTML=re_price;
	
	var total = 0;
	for (i=0;i<num;i++) {
		if(document.getElementById("price_"+i)!=null) {
			total += Number(document.getElementById("price_"+i).innerHTML);
		}
	}
	document.getElementById("total_price").innerHTML = total;
}

function div_delete(number) {
	var div_del = document.getElementById("div_"+number);
	div_del.remove(div_del);
	var total = 0;
	for (i=0;i<num;i++) {
		if(document.getElementById("price_"+i)!=null) {
			total += Number(document.getElementById("price_"+i).innerHTML);
		}
	}
	document.getElementById("total_price").innerHTML = total;
}

function add_one(number) {
	
	document.getElementById("cnt_"+number).value = Number(document.getElementById("cnt_"+number).value)+1;
	
	var price = <%=rDTO.getProd_price()%>;
	var cnt =  document.getElementById("cnt_"+number).value;
	var re_price = price * cnt;
	
	var span_price = document.getElementById("price_"+number);
	span_price.innerHTML=re_price;
	var total = 0;
	
	for (i=0;i<num;i++) {
		if(document.getElementById("price_"+i)!=null) {
			total += Number(document.getElementById("price_"+i).innerHTML);
		}
	}
	
	document.getElementById("total_price").innerHTML = total;
	
}

function del_one(number) {
	
	if(Number(document.getElementById("cnt_"+number).value)>1){
		document.getElementById("cnt_"+number).value = Number(document.getElementById("cnt_"+number).value) - 1;
	}
	
	var price = <%=rDTO.getProd_price()%>;
	var cnt =  document.getElementById("cnt_"+number).value;
	var re_price = price * cnt;
	
	var span_price = document.getElementById("price_"+number);
	span_price.innerHTML=re_price;
	var total = 0;
	
	for (i=0;i<num;i++) {
		if(document.getElementById("price_"+i)!=null) {
			total += Number(document.getElementById("price_"+i).innerHTML);
		}
	}
	
	document.getElementById("total_price").innerHTML = total;
	
}
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

		<input type="hidden" name="prod_no1" id="prod_no" value="<%=CmmUtil.nvl(rDTO.getProd_no())%>" />
	
		<div class="container detail">
			<div class="wrap btn-wrap">
	
				<div class="list_wrap">
				
					<div class="goods_detail">
						<div class="thumb">
							<% if (fileList.size() > 0) {%>
								<input type="image" src="<%=CmmUtil.nvl(fileList.get(0).getFile_path()+"/"+fileList.get(0).getSrc_filename())%>" style="height: 300px; width: 300px;" />
							<%} %>						
						</div>
			            <div class="info">
							<p class="title"><%=CmmUtil.nvl(rDTO.getProd_name()) %></p>
							<p class="sub_text">배송비 2,500원 (50,000원 이상 무료배송)</p>
			            </div>
					</div>
					
					<div class="goods_option">
					
            			<p class="blue_text" id="OptText">옵션 선택</p>
            				<div class="select_wrap">
              					<select class="col-2" id="firstOpt" onchange="javascript:fir_pick()">
									<option value="no"><%=firstOpt %></option>
									<%for(ProductInfoOptionDTO infoDTO : fir_option){ %>
										<option value="<%=CmmUtil.nvl(infoDTO.getOpt_kind())%>"><%=CmmUtil.nvl(infoDTO.getOpt_kind())%></option>
									<%} %>
              					</select>
              					<select class="col-2" id="secondOpt" disabled onchange="javascript:sec_pick()">
                 					<option value="no"><%=secondOpt %></option>
                 					<%for(ProductInfoOptionDTO infoDTO : sec_option){ %>
										<option value="<%=CmmUtil.nvl(infoDTO.getOpt_kind())%>"><%=CmmUtil.nvl(infoDTO.getOpt_kind())%></option>
									<%} %>
              					</select>
            				</div>
							<br />
			            	<div class="price_wrap">금액<span class="price" id="total_price"><%=rDTO.getProd_price() %></span><span class="won">원</span></div>
			            
					</div>
				
				</div>
		
				<div id="optionBox"></div>
		
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