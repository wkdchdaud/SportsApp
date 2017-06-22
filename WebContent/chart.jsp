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
	<%=testDTO.getAb() %>&nbsp;|&nbsp;<%=testDTO.getBc() %>
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
                <a class="navbar-brand" href="index.html">모두의 스포츠</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> Last access : 30 May 2014 &nbsp; <a href="login.html" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
		<!-- 네비바 일단 다지움  -->
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2 style="text-align: center;">매출데이터분석</h2>   
                     <div style="text-align: center;">
                        <span class="label label-success"><a href="#" style="color: white; text-decoration: none; font-size: 12px" >일별</a></span>
                        <span class="label label-success"><a href="#" style="color: white; text-decoration: none; font-size: 12px">주별</a></span>
                        <span class="label label-success"><a href="#" style="color: white; text-decoration: none; font-size: 12px">월별</a></span>
                        <span class="label label-success"><a href="#" style="color: white; text-decoration: none; font-size: 12px" >분기별</a></span>
                        <span class="label label-success"><a href="#" style="color: white; text-decoration: none; font-size: 12px">연도별</a></span>
                    </div>
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
             
                <div class="row"> 
                               <div class="col-md-6 col-sm-12 col-xs-12">                     
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bar Chart Example
                        </div>
                        <div class="panel-body">
                            <div id="morris-bar-chart"></div>
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
                   if ($(this).width() < 768) {
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
                       y: '4567',
                       a: 100,
                       b: 90
                   }, {
                       y: '1234',
                       a: 75,
                       b: 65
                   }, {
                       y: '1233',
                       a: 50,
                       b: 40
                   }, {
                       y: 'adsfasdf',
                       a: 75,
                       b: 65
                   }, {
                       y: '2010',
                       a: 50,
                       b: 40
                   }, {
                       y: '2011',
                       a: 75,
                       b: 65
                   }, {
                       y: '2012',
                       a: 100,
                       b: 90
                   }],
                   xkey: 'y',
                   ykeys: ['a', 'b'],
                   labels: ['년도', '시팔'],
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
