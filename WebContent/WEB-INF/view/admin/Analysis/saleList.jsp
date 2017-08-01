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

<script src="/js/sales_moris.js"></script>
<script src="/js/sales_table.js"></script>
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

<!-- 일별주별월별분기별 연도별 클릭했을때는 
	Hide 이용해서 값세팅해주고 datepicker이 ㅊchange될때 그값을 가지고 온다
	그리고 변수에다 가 그값을 넣어서 보내주면 되겠지-->
<script>

var hid ="";

/*  테이블 제목 주기 */
var rank_text="";


$(function() {
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	today = yyyy+'-'+mm+'-'+dd;
	$("#rank_text").text('(일별) 매출 종목 순위');
	$("#testDatepicker").val(today);
	
    $(window).bind("load resize", function () {
        if ($(this).width() < 768) {
            $('div.sidebar-collapse').addClass('collapse')
        } else {
            $('div.sidebar-collapse').removeClass('collapse')
        }
    });
    
    /*  datepicker 시작 */
    $("#testDatepicker").datepicker({
    	dateFormat: 'yy-mm-dd',
    	changeMonth:true,
    	changeYear:true,
    	selectOtherMonths:true,
    	showOtherMonths:true,
    	/* altField : '#getdate' */
    	});
   
	/* 날짜 변동할때마다 액션 */
	$("#testDatepicker").change(function() {
		
		if(hid==""){
			hid ='day';	
		}
		  $('#morris-bar-chart').html(null);
		  $('#table_date_ajax').html(null);
		  
   		  var sale_date_mo = $('#testDatepicker').val();
		/* 모리스 js 함수 호출   */
		sale_moris_day(sale_date_mo,hid);
		/* 모리스 js 끝  */
		/* 테이블 아작스 실행 */
		sale_table_day(sale_date_mo,hid);    	
		/* 테이블 아작스 끝 */
	});
});

/*  일별 주별 월별 분기별 연도별에 따른 합계*/
function button_day(button_val){
	$("#rank_text").text(null);
	hid = null;
	hid = button_val;
	$('#morris-bar-chart').html(null);
  	$('#table_date_ajax').html(null);
	var button_day_var = $('#testDatepicker').val();
	var cal_day = button_val;

	if(button_val=="day"){
		
    	sale_moris_day(button_day_var,cal_day);
		sale_table_day(button_day_var,cal_day);
		$("#rank_text").text('(일별) 매출 종목 순위');
	}else if(button_val=="week"){
		
    	sale_moris_day(button_day_var,cal_day);
		sale_table_day(button_day_var,cal_day);
		$("#rank_text").text('(주별) 매출 종목 순위');
	}else if(button_val=="month"){
		
    	sale_moris_day(button_day_var,cal_day);
		sale_table_day(button_day_var,cal_day);
		$("#rank_text").text('(월별) 매출 종목 순위');
	}else if(button_val=="boongi"){
		
    	sale_moris_day(button_day_var,cal_day);
		sale_table_day(button_day_var,cal_day);
		$("#rank_text").text('(분기별) 매출 종목 순위');
	}else if(button_val=="year"){
		
    	sale_moris_day(button_day_var,cal_day);
		sale_table_day(button_day_var,cal_day);
		$("#rank_text").text('(연도별) 매출 종목 순위');
	}
	
}
/*  네비바 화면에따른 오픈 클로즈 */
 



	
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
                	
                	<input type="hidden" id="hid" value="day"/>
                	
                	  						<center><div class="btn-group">
											  <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" style="width: 150px">매출 분석 정보 <span class="caret"></span></button>
											  <ul class="dropdown-menu">
												<li><a href="#">연관성 분석</a></li>
												<li class="divider"></li>
												<li><a href="#">장바구니 분석</a></li>
											  </ul>
											</div></center>
											<br/>
											<center>
											 <button id="day" class="btn btn-warning btn-xs" onclick="button_day('day');">일별</button>
											 <button id="week" class="btn btn-warning btn-xs" onclick="button_day('week');">주별</button>
											 <button id="month" class="btn btn-warning btn-xs" onclick="button_day('month');">월별</button>
											 <button id="boongi" class="btn btn-warning btn-xs" onclick="button_day('boongi');">분기별</button>
											 <button id="year" class="btn btn-warning btn-xs" onclick="button_day('year');">연도별</button>
											</center>
					<br/>						
					
					<!-- 데이트 피커 달력 버튼  input으로만 가능하다.-->
					<center><input type="button" class="btn btn-success btn-sm" id="testDatepicker" value=""></a></center>
					
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
                        				<div class="panel-heading" style="text-align: center" id="rank_text">
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
                                    				
                                    				<% int i = 0;
                                    				for (R_testDTO qwe : rank_list){
															i++;%>
															
														<tr>
															<td><%=i %></td>
															<td><%=qwe.getName() %></td>
														</tr>														
														
														<%}%>
														
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

    /* 모리스 js 매출 분석 정보 달력 클릭시 마다 바뀌는 함수 끝*/
    
    $(function() {
    	 Morris.Bar({
             element: 'morris-bar-chart',
             data: [ <% int qw = 0 ; 
                     for(R_testDTO qwe : sale_list){qw++; %>
             {
            	 a:'<%=qwe.getSum_price()%>' 
            	 ,
                 y: '<%=qwe.getSale_date()%>' 
              }
              <%if (qw != 5){%> , <%}%>
             <%}%>
             ],
             xkey: 'y',
             ykeys: ['a'],
             labels: ['매출'],
             resize: true
         });

  });
</script>
   
</body>
</html>
