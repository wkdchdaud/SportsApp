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
%><%-- <%for(TestDTO testDTO : list){ %>
	<%=testDTO.getAb() %>&nbsp;|&nbsp;<%=testDTO.getBc() %>
<%} %> --%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>모두의 스포츠</title>
	<%@include file="/inc/head.jsp" %>
	<script type="text/javascript">
		var ndate = document.getElementById("nowDate");
		var d = new Date();
	</script>
</head>
<body>
    <div id="wrapper">
       <%@include file="/inc/side_nav.jsp"%>
       
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>스포츠 용품업자를 위한 온라인 납품 어플리케이션 구현</h2>   
                        <h5>앱 디자인 나오기전 임시 메인화면</h5>
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                 <!-- /. ROW  -->
                <hr />                
          <!--       <div class="row" style="display: inline;"> -->
                    
                    
                    <!-- <div class="col-md-3 col-sm-12 col-xs-12 "> -->
                        <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: center">
						일 매출
                        </div>
                        <div class="panel-body">
                            <div id="morris-line-chart"></div>
                        </div>
                    </div>    
                    <div class="panel panel-primary text-center no-boder bg-color-green">
                        <div class="panel-body">
                            <i class="fa fa-bar-chart-o fa-5x"></i>
                            <h3>372,000$ </h3>
                        </div>
                        <div class="panel-footer back-footer-green">
                           실시간 금일 매출 금액 
                            
                        </div>
                    </div>
                        <div class="panel ">
          
        </div>
			
    <!-- </div> -->
                        
        <!-- </div> -->
                        <!-- <div class="row" > -->
                    <!-- <div class="col-md-3 col-sm-12 col-xs-12"> -->
  <div class="panel panel-primary text-center no-boder bg-color-green">
                        <div class="panel-body">
                            <i class="fa fa-comments-o fa-5x"></i>
                            <h4>고객센터 문의 </h4>
                             <h4>답변을 기다리는 문의</h4>
                        </div>
                        <div class="panel-footer back-footer-green">
                             <i class="fa fa-rocket fa-5x"></i>
                           <a href="#" style="text-decoration: none; color: white;">바로이동</a>
                            
                        </div>
                    </div>
                    <!-- </div> -->
                <!-- </div> -->
                 <!-- /. ROW  -->
               <!--  <div class="row"> 
                    
                      
                               <div class="col-md-9 col-sm-12 col-xs-12" style="width: 1310px">       -->               
                    
                    
            <!--     </div>
                
           </div> -->
                 <!-- /. ROW  -->

                 <!-- /. ROW  -->
             
                   <!-- 채팅 패널 시작 -->
                    <div class="chat-panel panel panel-default chat-boder chat-panel-head" style="width: 1580px" >
                        <div class="panel-heading">
                            <i class="fa fa-comments fa-fw"></i>
							실시간 문의
	                            <div class="btn-group pull-right">
                                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-chevron-down"></i>
                                </button>
                            </div>
                        </div>

                        <div class="panel-body">
                            <ul class="chat-box">
                                <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                        <img src="assets/img/1.png" alt="User" class="img-circle" />
                                    </span>
                                    <div class="chat-body">                                        
                                            <strong >강서구 열혈 태권도장</strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>12분 전
                                            </small>                                      
                                        <p>
                                            배송이 얼마나 걸릴까요?
                                        </p>
                                    </div>
                                </li>
                                <li class="right clearfix">
                                    <span class="chat-img pull-right">

                                        <img src="assets/img/2.png" alt="User" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        
                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>13분 전</small>
                                            <strong class="pull-right">강동구 새마을 휘트니스</strong>
                                      
                                        <p>
                                            	물건은 잘받았습니다. 다른 바벨들도 구매 하고 싶은데요 
                                            	a204제품 혹시 발주 가능하신가요?
                                        </p>
                                    </div>
                                </li>
                                <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                         <img src="assets/img/3.png" alt="User" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        
                                            <strong >천호동 호랑이 태권도</strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>14분 전</small>
                                        
                                        <p>
                                           태권도띠 이니셜 다 대문자로 부탁드립니다.
                                        </p>
                                    </div>
                                </li>
                                <li class="right clearfix">
                                    <span class="chat-img pull-right">
                                         <img src="assets/img/4.png" alt="User" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                      
                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>15분 전</small>
                                                
                                            <strong class="pull-right">성수동 풋살</strong>
                                       
                                        <p>
                                            선수 유니폼 이니셜 다 소문자로 부탁합니다.
                                        </p>
                                    </div>
                                </li>
                                    <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                        <img src="assets/img/1.png" alt="User" class="img-circle" />
                                    </span>
                                    <div class="chat-body">                                        
                                            <strong >영등포구 백호 합기도장</strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>17분 전
                                            </small>                                      
                                        <p>
                                            띠 200개 주문 한거 내일모레 받고싶습니다 연락주세요 010-2312-2426
                                        </p>
                                    </div>
                                </li>
                                <li class="right clearfix">
                                    <span class="chat-img pull-right">
                                       <img src="assets/img/2.png" alt="User" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        
                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>13분 전 </small>
                                            <strong class="pull-right">강서구 새마을 복싱장 </strong>
                                      
                                        <p>
                                            	혹시 배송은 얼마나 걸리는지 알수있을까요
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="panel-footer">
                            <div class="input-group">
                                <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message to send..." />
                                <span class="input-group-btn">
                                    <button class="btn btn-warning btn-sm" id="btn-chat">
                                        보내기
                                    </button>
                                </span>
                            </div>
                    
                </div>
                </div>     
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
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
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
                    if ($(this).width() < 768) {
                        $('div.sidebar-collapse').addClass('collapse')
                    } else {
                        $('div.sidebar-collapse').removeClass('collapse')
                    }
                });

             
                /*====================================
        MORRIS LINE CHART
     ======================================*/
                Morris.Line({
                    element: 'morris-line-chart',
                    data: [{
                        y: '2006',
                        a: 100,
                        b: 90
                    }, {
                        y: '2007',
                        a: 75,
                        b: 65
                    }, {
                        y: '2008',
                        a: 50,
                        b: 40
                    }, {
                        y: '2009',
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
                    ykeys: ['a'],
                    labels: ['매출  '],
                    hideHover: 'auto',
                    resize: true
                });
               
         
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
