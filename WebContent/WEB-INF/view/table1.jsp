<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="assets/js/jquery-1.10.2.js"></script>
<script>
$(function(){
	   alert("dsd");
		$.ajax({
			url : 'rTest.do',
			method : 'post' ,
			success : function(data){
					console.log(data);
			}
		})
	})
</script>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Free Bootstrap Admin Template : Binary Admin</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
   
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
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
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>스포츠 용품 리스트 관리</h2>   
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
스포츠 용품 리스트
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>카테고리</th>
                                            <th>용품</th>
                                            <th>가격</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>1</td>
                                            <td>헬스 용품</td>
                                            <td><a href="#">쿼티아 헬스장갑</a></td>
                                            <td class="center">12,000원</td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>2</td>
                                            <td>태권도 용품</td>
                                            <td><a href="#">기리아 태권도 복 </a></td>
                                            <td class="center">17,000원</td>
                                        </tr>
                                        <tr class="odd gradeA">
                                            <td>3</td>
                                            <td>헬스 용품</td>
                                            <td> <a href="#">러닝머신</a> </td>
                                            <td class="center">740,000원</td>
                                        </tr>
                                        <tr class="even gradeA">
                                            <td>4</td>
                                            <td>헬스 용품</td>
                                            <td><a href="#">15Kg 바벨 쌍</a></td>
                                            <td class="center">37,000원</td>
                                        </tr>
                                        <tr class="odd gradeA">
                                            <td>5</td>
                                            <td>태권도 용품</td>
                                            <td><a href="#">제브라 태권도 화</a></td>
                                            <td class="center">42,000원</td>
                                        </tr>
                                        <tr class="even gradeA">
                                            <td>6</td>
                                            <td>태권도 용품</td>
                                            <td><a href="#">태권도 미트</a></td>
                                            <td class="center">70,000원</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>7</td>
                                            <td>축구 용품</td>
                                            <td><a href="#">2010 월드컵 축구공</a></td>
                                            <td class="center">52,000원</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>8</td>
                                            <td>야구 용품</td>
                                            <td><a href="#">나이키 야구 배트</a></td>
                                            <td class="center">47,200원</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>9</td>
                                            <td>농구 용품</td>
                                            <td><a href="#">에어조던 농구화</a></td>
                                            <td class="center">180,000원</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>10</td>
                                            <td>복싱용품</td>
                                            <td><<a href="#">크로커다일 샌드백</a></td>
                                            <td class="center">320,000원</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>11</td>
                                            <td>태권도 용품</td>
                                            <td><a href="#">태권도 미트</a></td>
                                            <td class="center">70,000원</td>
                                        </tr>
                                        <tr class="gradeA">
                                        <td>12</td>
                                             <td>태권도 용품</td>
                                            <td><a href="#">기리아 태권도 복</a> </td>
                                            <td class="center">17,000원</td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
                <!-- /. ROW  -->
            <div class="row">
                <div class="col-md-6">
                </div>
            </div>
                <!-- /. ROW  -->
        </div>
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
         <!-- CUSTOM SCRIPTS -->
    
   
</body>
</html>
