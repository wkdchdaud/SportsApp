<%@page import="java.util.ArrayList"%>
<%@page import="sports.com.dto.TestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<TestDTO> list = (List<TestDTO>)request.getAttribute("list");
	if(list == null){
		list = new ArrayList<TestDTO>();
	}
	%>
	
<%for(TestDTO testDTO : list){ %>
	
<%} %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>모두의 스포츠</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- datepicker -->
<!--    <link rel="stylesheet" href="assets/css/datepicker.css">

	
	<script>
		$(function() {
			$(".datepicker").datepicker({
				dateFormat : "yymmdd",
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
				dayNamesMin : ['일','월','화','수','목','금','토'],
				changeMonth : true,
				changeYear : true,
				showMonthAfterYear : true,
			});
		});
	</script> -->
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
  <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;" id="nowDate">2017년 6월 23일
  <a href="login.html" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
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
                    
                  
					
					   <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> 커뮤니티 관리<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">공지사항</a>
                            </li>
                            <li>
                                <a href="#">Q&A</a>
                            </li>
                         </ul>
                        </li>
                </ul>
               
            </div>
            
        </nav>  
           <!-- /. NAV TOP  -->
		<!-- 네비바 일단 다지움  -->
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
             <div class="row">
                    <div class="col-md-12">
                     <h2>매출 데이터 분석</h2>   
                       
                    </div>
                </div>
                    <div class="col-md-12" align="center" >
                     <!-- <h2 style="text-align: center;">매출데이터분석</h2> -->
											  <button data-toggle="dropdown" class="btn btn-info dropdown-toggle" style="width: 200px; float: center; ">연관성 분석 <span class="caret"></span></button>
											  <ul class="dropdown-menu">
												<li><a href="chart2.do">매출 분석</a></li>
												<li class="divider"></li>
												<li><a href="chart1.do">연관성 분석</a></li>
												<li class="divider"></li>
												<li><a href="#">장바구니 분석</a></li>
											  </ul>
					</div>
						
                     <div style="text-align: center;">
                        <span class="label label-success"><a href="#" style="color: white; text-decoration: none; font-size: 12px" >일별</a></span>
                        &nbsp;
                        <span class="label label-success"><a href="#" style="color: white; text-decoration: none; font-size: 12px" >분기별</a></span>
                        &nbsp;
                        <span class="label label-success"><a href="#" style="color: white; text-decoration: none; font-size: 12px">연도별</a></span>
                    </div>
                 <!-- /. ROW  -->
                 <hr />
             
                <div class="row"> 
                 <div class="col-md-6 col-sm-12 col-xs-12">  
                                    
                    <div class="panel panel-default" style="width: 1560px">
                    
                        <div class="panel-heading" style="text-align: center;">2017 / 03 ~ 
<span class="btn btn-warning"> <a href="#" class="datepicker" style="color: white; text-decoration: none; font-size: 12px">달력</a></span>          
             
 </div>
                        <div class="panel-body" >
                            <div id="morris-bar-chart">
                            </div>
                    	</div>
                    	
                    </div>
                     <div class="panel panel-default" style="text-align: center; width: 1560px">
                        <div class="panel-heading">
                          	 연관성 분석 상세
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive" >
                                <table class="table table-striped table-bordered table-hover" >
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">2017년 3월</th>
                                            <th align="center" style="text-align: center">태권도복</th>
                                            <th align="center" style="text-align: center">태권도화</th>
                                            <th align="center" style="text-align: center">운동매트</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>태권도띠<br/>(65%)</td>
                                            <td>태권도복<br/>(77%)</td>
                                            <td>격파용송판<br/>(75%)</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>태권도화<br/>(45%)</td>
                                            <td>태권도띠<br/>(51%)</td>
                                            <td>발차기매트<br/>(67%)</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>헤드기어<br/>(36%)</td>
                                            <td>격파용송판<br/>(27%)</td>
                                            <td>격투용샌드백<br/>(42%)</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                                
                </div>
           </div>
                 <!-- /. ROW  -->
             
                 <!-- /. ROW  -->
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
      <!-- 데이트 피커 하려고 해놨던애 -->
<!-- 	<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script> -->
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
                       y: '태권도복',
                       a: 100
                   }, {
                       y: '태권도화',
                       a: 75
                   }, {
                       y: '운동매트',
                       a: 50
                   }],
                   xkey: 'y',
                   ykeys: ['a'],
                   labels: ['연관성'],
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
