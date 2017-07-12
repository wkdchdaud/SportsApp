<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sports.com.dto.R_testDTO"%>
<%@page import="java.util.List"%>
<% List<R_testDTO> sale_list = (List<R_testDTO>) request.getAttribute("sales_list");
 List<R_testDTO> rank_list = (List<R_testDTO>) request.getAttribute("rank_list");
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>모두의 스포츠</title>
    <!-- 데이트피커 -->
 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
  
<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.min.js"></script>  

<%@include file="/inc/head.jsp"%>

<script>
/*  네비바 화면에따른 오픈 클로즈 */

$(function() {
    $(window).bind("load resize", function () {
        if ($(this).width() < 768) {
            $('div.sidebar-collapse').addClass('collapse')
        } else {
            $('div.sidebar-collapse').removeClass('collapse')
        }
    });

    $( "#testDatepicker" ).datepicker({
    	dateFormat: 'yy-mm-dd',
    	changeMonth:true,
    	changeYear:true,
    	selectOtherMonths:true,
    	showOtherMonths:true,
    	/* altField : '#getdate' */
    	});

    alert($("#star_val").text());
    /*  datepicker 시작 */
});
</script>
</head>
<body>
    <div id="wrapper">

           <!-- 사이드 네비바 및 헤더 부분 시작 -->
               <%@include file="/inc/side_nav.jsp"%>
       	   <!-- 사이드 네비바 및 헤더 부분 끝  -->
        
        <div id="page-wrapper" >
            	<div id="page-inner">
               
               	 	<div class="row">
                    	<div class="col-md-12">
                     	<center><h2>매출 데이터 분석</h2></center>   
                     	<hr/>
                    	</div>
                	</div>        
                	  						<center><div class="btn-group">
											  <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" style="width: 150px">매출 분석 정보 <span class="caret"></span></button>
											  <ul class="dropdown-menu">
												<li><a href="#">연관성 분석</a></li>
												<li class="divider"></li>
												<li><a href="#">장바구니 분석</a></li>
											  </ul>
											</div></center>
											<br/>
											<div id="star_val">
											<center>
											 <a href="#" class="btn btn-warning btn-xs">일별</a>
											 <a href="#" class="btn btn-warning btn-xs">주별</a>
											 <a href="#" class="btn btn-warning btn-xs">월별</a>
											 <a href="#" class="btn btn-warning btn-xs">분기별</a>
											 <a href="#" class="btn btn-warning btn-xs">연도별</a>
											</center>
											</div>
					<br/>						
					
					<!-- 데이트 피커 달력 버튼  input으로만 가능하다.-->
					<center><input type="button" class="btn btn-success btn-sm" id="testDatepicker" value="날짜 설정"></a></center>
					
                	<!--  진정 본문 시작 -->   
                	 
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
                                    				<tbody id="table_date_ajax">
														<tr>
															<td>1</td>
															<td><%= rank_list.get(0).getName() %></td>
														</tr>
														
														<tr>
															<td>2</td>
															<td><%= rank_list.get(1).getName() %></td>
														</tr>
														
														<tr>
															<td>3</td>
															<td><%= rank_list.get(2).getName() %></td>
														</tr>
														
														<tr>
															<td>4</td>
															<td><%= rank_list.get(3).getName() %></td>
														</tr>
														
														<tr>
															<td>5</td>
															<td><%= rank_list.get(4).getName() %></td>
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
    
    <!-- JQUERY SCRIPTS 맨위로 올렸음  -->
    <!-- <script src="/assets/js/jquery-1.10.2.js"></script> -->
   
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="/assets/js/bootstrap.min.js"></script>
    
    <!-- METISMENU SCRIPTS -->
    <script src="/assets/js/jquery.metisMenu.js"></script>
  
    <!-- MORRIS CHART SCRIPTS -->
    <script src="/assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="/assets/js/morris/morris.js"></script>
    <!-- moris sample data CUSTOM SCRIPTS 이거 셋팅 안해주니까 네비바가 걍열려있네 -->
   <!-- <script src="/assets/js/custom.js"></script> --> 
    
    <script type="text/javascript">
    
    /* 모리스 js 매출 분석 정보 달력 클릭시 마다 바뀌는 함수*/
    function sale_moris_day(sale_date_mo){
  	  $.ajax({
  		url: "sale_chart.do",
  		method: "post",
  		data: {
  			'sale_date_mo' : sale_date_mo
  		},
  		dataType: "json",
  		success : function(data){
  			var dt ="";
  			var arr = new Array();
  			$.each(data, function(key, value){
/*     				if(value.sum_price==null){
  					dt={y : "2000-11-11", a:0}
  				} */
  				dt={y: value.sale_date, a: value.sum_price}
  				arr.push(dt)
  											});
  			console.log(arr)
				/*  네비바 */
				 Morris.Bar({
                  element: 'morris-bar-chart',
                  data: arr,
                  xkey: 'y',
                  ykeys: ['a'],
                  labels: ['매출'],
                  hideHover: 'auto',
                  resize: true
            
              });
			}			      
		});   
    }
    /* 모리스 js 매출 분석 정보 달력 클릭시 마다 바뀌는 함수 끝*/
    
    /* 매출분석 정보 테이블마다 바뀌는 함수 */
    function sale_table_day(sale_date_mo){
    	$.ajax({
    		url : "sale_table.do",
    		method : "post",
    		data : {
    			'sale_date_mo': sale_date_mo
    		},
    		dataType:"json",
    		success:function(data){
    		var cont= "";
    		var cnt= 1;
    		$.each(data, function(key, value){
    			cont +="<tr> <td>"+ cnt +"</td><td>"+value.name+"</td></tr>";
    			cnt++;
    			
    		})
    		$('#table_date_ajax').html(cont);
    		console.log(data);
    		}
    	});
    }
    
    /* 매출분석 정보 테이블마다 바뀌는 함수끝 */
    $(function() {
    	 Morris.Bar({
             element: 'morris-bar-chart',
             data: [{
                 a: '<%=sale_list.get(0).getSum_price()%>',
                 y: '<%=sale_list.get(0).getSale_date()%>'
             }, {
                 a: '<%=sale_list.get(1).getSum_price()%>',
                 y: '<%=sale_list.get(1).getSale_date()%>'
             }, {
                 a: '<%=sale_list.get(2).getSum_price()%>',
                 y: '<%=sale_list.get(2).getSale_date()%>'
             }, {
                 a: '<%=sale_list.get(3).getSum_price()%>',
                 y: '<%=sale_list.get(3).getSale_date()%>'
             }, {
                 a: '<%=sale_list.get(4).getSum_price()%>',
                 y: '<%=sale_list.get(4).getSale_date()%>'
             }, {
                 a: '<%=sale_list.get(5).getSum_price()%>',
                 y: '<%=sale_list.get(5).getSale_date()%>'
             }, {
                 a: '<%=sale_list.get(6).getSum_price()%>',
                 y: '<%=sale_list.get(6).getSale_date()%>'
             }
             ],
             xkey: 'y',
             ykeys: ['a'],
             labels: ['매출'],
             resize: true
         });
    	 
      $( "#testDatepicker" ).change(function() {
    	  $('#morris-bar-chart').html(null);
    	  $('#table_date_ajax').html(null);
    	  var sale_date_mo = $('#testDatepicker').val();
    	/* 모리스 js 함수 호출   */
    	sale_moris_day(sale_date_mo);
    	/* 모리스 js 끝  */
    	
    	/* 테이블 아작스 실행 */
		sale_table_day(sale_date_mo);    	
    	/* 테이블 아작스 끝 */
    });
  });
</script>
   
</body>
</html>
