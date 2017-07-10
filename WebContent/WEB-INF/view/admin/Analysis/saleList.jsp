<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sports.com.dto.R_testDTO"%>
<%@page import="java.util.List"%>
<% List<R_testDTO> sale_list = (List<R_testDTO>) request.getAttribute("sales_list");  %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>모두의 스포츠</title>
    
	<!-- BOOTSTRAP STYLES-->
    <link href="/assets/css/bootstrap.css" rel="stylesheet" />
    
     <!-- FONTAWESOME STYLES-->
    <link href="/assets/css/font-awesome.css" rel="stylesheet" />
    
     <!-- MORRIS CHART STYLES-->
    <link href="/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    
     <!-- CUSTOM STYLES-->
    <link href="/assets/css/custom.css" rel="stylesheet" />
    
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main.do">모두의 스포츠</a> 
            </div>
  <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;"> 
  </div>
        </nav>   
           
           <!-- 사이드 네비바 시작 -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="/assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					<!-- 우리가 사용할 메뉴 시작  -->
					
					<!--  회원관리 -->		
					<li>
                        <a href="ui.do"><i class="fa fa-desktop fa-3x"></i> 회원관리</a>
                    </li>
                    
                    <!--  권한관리 -->
                    <li>
                        <a  href="ui1.do"><i class="fa fa-desktop fa-3x"></i> 권한관리</a>
                    </li>
                    
                    <!--주문관리-->
                      <li>
                        <a href="table.do"><i class="fa fa-table fa-3x"></i> 주문관리</a>
                    </li>
                    
                    <!--학원관리-->
                    <li>
                        <a  href="accountmanagement.do"><i class="fa fa-table fa-3x"></i> 학원관리</a>
                    </li>
                    
                    <!--스포츠용품리스트관리  -->
                    <li>
                        <a href="table1.do"><i class="fa fa-table fa-3x"></i> 스포츠 용품 리스트 관리</a>
                    </li>
                    
					<!--매출분석정보-->
					<li>
                        <a   href="chart1.do"><i class="fa fa-bar-chart-o fa-3x"></i> 매출분석정보</a>
                    </li>
                    
                  
					<!-- 커뮤니티 -->
					<li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> 커뮤니티 관리<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">공지사항</a>
                            </li>
                            <li>
                                <a href="#">QnA</a>
                            </li>
                        </ul>
                   </li>
                </ul>
               
            </div>
            
        </nav>  
        <!-- 사이드 네비 바 끝  -->
        
        <div id="page-wrapper" >
            	<div id="page-inner">
               
               	 	<div class="row">
                    	<div class="col-md-12">
                     	<h2>매출 데이터 분석</h2>   
                       
                    	</div>
                	</div>          
                	<!--  진정 본문 시작 -->    
                 <!-- /. ROW  -->
                 
                  <hr />
                  
                  <!-- 모리스 바 차트 영역 시작 -->
                     <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: center">
						일 매출
                        </div>
                        
                        <div class="panel-body">
                            <div id="morris-bar-chart"></div>
                        </div>
                        </div>  
                   <!-- 모리스 바 차트 영역 끝 -->
                        
                        <!--테이블 시작   -->
                            <div class="row">
                				<div class="col-md-12">
                    				<div class="panel panel-default">
                        				<div class="panel-heading" style="text-align: center">매출 종목 순위
                        				</div>
                        
                        				<div class="panel-body">
                            				<div class="table-responsive">
                                				<table class="table table-striped table-bordered table-hover" id="dataTables-example" style="text-align: center">
                                    				<thead>
                                        				<tr>
				                                            <th style="text-align: center">순위</th>
				                                            <th style="text-align: center">종목</th>
                                        				</tr>
                                    				</thead>
                                    				<tbody>
														<tr>
															<td>1</td>
															<td></td>
														</tr>
														
														<tr>
															<td>2</td>
															<td></td>
														</tr>
														
														<tr>
															<td>3</td>
															<td></td>
														</tr>
														
														<tr>
															<td>4</td>
															<td></td>
														</tr>
														
														<tr>
															<td>5</td>
															<td></td>
														</tr>
														
                                    				</tbody>
                                				</table>
                            				</div>
                        				</div>
                    				</div>
                				</div>
            				</div>
                        <!-- 테이블 끝 -->
                      
                 <!-- /. ROW  -->           
    			</div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
     <!-- </div> -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    
    <!-- JQUERY SCRIPTS -->
    <script src="/assets/js/jquery-1.10.2.js"></script>
   
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="/assets/js/bootstrap.min.js"></script>
    
    <!-- METISMENU SCRIPTS -->
    <script src="/assets/js/jquery.metisMenu.js"></script>
  
    <!-- MORRIS CHART SCRIPTS -->
    <script src="/assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="/assets/js/morris/morris.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <!-- <script src="assets/js/custom.js"></script> -->
    
    <script type="text/javascript">

   /*=============================================================
       Authour URI: www.binarycart.com
       Version: 1.1
       License: MIT
       
       http://opensource.org/licenses/MIT

       100% To use For Personal And Commercial Use.
      
       ========================================================  */

   (function ($) {
       "use strict";
       var mainApp = {

           main_fun: function () {
               /*====================================
               METIS MENU 
               ======================================*/
               $('#main-menu').metisMenu();

               /*====================================
                 LOAD APPROPRIATE MENU BAR
              ======================================*/
               $(window).bind("load resize", function () {
                   if ($(this).width() < 100) {
                       $('div.sidebar-collapse').addClass('collapse')
                   } else {
                       $('div.sidebar-collapse').removeClass('collapse')
                   }
               });

               /*====================================
               MORRIS BAR CHART
            ======================================*/
               Morris.Bar({
                   element: 'morris-bar-chart',
                   data: [{
                       y: '<%=sale_list.get(0).getSale_date()%>',
                       a: <%=sale_list.get(0).getSum_price()%>
                   }, {
                       y: '<%=sale_list.get(1).getSale_date()%>',
                       a: <%=sale_list.get(1).getSum_price()%>
                   }, {
                       y: '<%=sale_list.get(2).getSale_date()%>',
                       a: <%=sale_list.get(2).getSum_price()%>
                   }, {
                       y: '<%=sale_list.get(3).getSale_date()%>',
                       a: <%=sale_list.get(3).getSum_price()%>
                   }, {
                       y: '<%=sale_list.get(4).getSale_date()%>',
                       a: <%=sale_list.get(4).getSum_price()%>
                   }],
                   xkey: 'y',
                   ykeys: ['a'],
                   labels: ['매출'],
                   hideHover: 'auto',
                   resize: true
               });

               /*====================================
             MORRIS DONUT CHART
          ======================================*/


       
        
           },

           initialization: function () {
               mainApp.main_fun();

           }

       }
       // Initializing ///

       $(document).ready(function () {
           mainApp.main_fun();
       });

   }(jQuery));
</script>
   
</body>
</html>
