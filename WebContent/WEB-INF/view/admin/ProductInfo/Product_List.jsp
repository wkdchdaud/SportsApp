<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sports.com.util.CmmUtil" %>
<%@ page import="sports.com.dto.ProductInfoDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %> 
<%
List<ProductInfoDTO> rList = (List<ProductInfoDTO>) request.getAttribute("DLWKDUS");
/*  */
if (rList==null) {
   rList = new ArrayList<ProductInfoDTO>();
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
    <script src="./common/js/placeholders.min.js"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>


<body>
  <section id="wrapper" class="wrapper">
 <%@ include file="./inc/head.jsp" %>
 <%@ include file="./inc/nav.jsp" %>
<!-- 스포츠용품리스트시작 -->



    <div class="container detail">
      <div class="wrap search-wrap">
        <div class="search array">
          <select id="SearchSelect" class=""><img src="/common/images/ic_array.png" alt="정렬">
          	<option value='all'>전체</option>
        	<option value='lowprice'>낮은가격</option>
       		<option value='highprice'>높은가격</option>
        	</select>
        	
          <input type="text" name='keyWord' id='Search' placeholder="상품이름을 입력하세요">
          <button class="blue btn">검색</button>
        </div>

        <div class="list_wrap">
          <ul class="sports_list">
          	<li><a href="#">전체</a></li>
            <li><a href="#">태권도</a></li>
            <li><a href="#">검도</a></li>
            
            <li><a href="#">합기도</a></li>	
            <li><a href="#">복싱, MMA</a></li>
            <li><a href="#">스포츠용품(구기)</a></li>
            
            <li><a href="#">네트&amp;골대</a></li>
            <li><a href="#">휘트니스</a></li>
            <li><a href="#">스포츠의류</a></li>
            
            <li><a href="#">측정용품&amp;호각</a></li>
            <li><a href="#">펌프</a></li>
            <li><a href="#">정리용품</a></li>
            
            <li><a href="#">체육대회용품</a></li>
            <li><a href="#">학교체육용품</a></li>
            
          </ul>
        </div>
            <%
         for (ProductInfoDTO aDTO : rList) {
      %>
        <div class="goods_list_wrap">
          <ul class="goods_list">
            
            <li>
              <a href="#">
              <div class="thumb">
                <img src="/common/images/sample01.png" alt="thumb">
              </div>
              <div class="info">
                <p class="title">한국스포츠 KSD 태권도 품 도복 (아동) TKD POOM Uniform (Child) </p>
                <p class="price register">30,000원</p>
              </div>
              </a>
              <button class="register-btn thumb-btn">등록</button>
            </li> 
            <li>
              <a href="#">
              <div class="thumb">
                <img src="/common/images/sample02.png" alt="thumb">
              </div>
              <div class="info">
                <p class="title"><a href="/admin/ProductInfo/ProductInfoDetail.do?prod_no1=<%=CmmUtil.nvl(aDTO.getProd_no()) %>"> <%= CmmUtil.nvl(aDTO.getProd_name()) %></p>
                <p class="price edit"><%= CmmUtil.nvl(aDTO.getProd_price()) %></p>
                </div>
                <button class="edit-btn thumb-btn">편집</button>
              
            
            </li>
            </ul>
            
              </div>
            <%} %>
            
                <div id="as">
         		<center><button class="btn btn-primary btn-lg" id="btn_more" style="width: 300px">더보기</button></center>
        		</div>
            
            
        </div>

      </div>
    </div>
   <%@ include file="./inc/foot.jsp" %>
  
  </section>
  <div id="c-mask" class="c-mask"></div>
  <script src="/common/js/classie.js"></script>
  <script src="/common/js/common.js"></script>
</body>

</html>
