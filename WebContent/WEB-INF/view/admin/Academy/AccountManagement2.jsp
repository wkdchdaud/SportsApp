<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sports.com.util.CmmUtil" %>
<%@ page import="sports.com.dto.AcademyDTO" %>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%> 
<%

List<AcademyDTO> rlist = (List<AcademyDTO>)request.getAttribute("rlist");

//게시판 조회 결과 보여주기
if (rlist==null){
	rlist = new ArrayList<AcademyDTO>();
	
}

%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>거래처 관리</title>
    
    <!-- 푸드트럭 css -->
        <link rel="stylesheet" href="assets/css/style.css?ver=2">
 
    
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
<script type="text/javascript">

//상세보기 이동
function doDetail(aca_no){ 
	location.href="/accountinfo.do?aca_no="+ aca_no;
}

</script>	
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
<<<<<<< HEAD
                                <a href="#">공지사항</a>
=======
                                <a href="#">Secdfgdfgdfgdfgdfgdfgdfgink</a>
>>>>>>> refs/remotes/origin/LHM3
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
                     <h2>거래처 관리</h2>   
                        <h5>스포츠 용품업자의 거래처를 관리하는 페이지입니다.</h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             거래처 목록
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>학원 No.</th>
                                            <th>학원명</th>
                                            <th>학원 위치</th>
                                            <!-- <th>ACA_EVENT</th>
                                            <th>전화번호</th>
                                            <th>방문여부</th>-->
                                        </tr>
                                    </thead>
                                    <tbody>
			<div class="section">
                <div class='tb_fs'>
                	<div class='tb_section ranking'>
                        <span class='w31'>학원 No.</span>
                        <span class='w31'>학원명</span>
                        <span class='w31'>ㅇㅇ</span>
                        <span class='w31'>ㄹㄹ</span>
                    </div>
<div class='tb_section'>
						</div>
                                    <%
for (int i=0; i<rlist.size(); i++){
	AcademyDTO aDTO = rlist.get(i);

	if (aDTO==null){
		aDTO = new AcademyDTO();
	}
	
%>


							<span class="sc_head"></span> <span class="sc_desc"><%=CmmUtil.nvl(aDTO.getAca_no())%></span>
						
						
							<span class="sc_head"></span> <span class="sc_desc">
							<a href="javascript:doDetail('<%=CmmUtil.nvl(aDTO.getAca_no())%>');"><%=CmmUtil.nvl(aDTO.getAca_name()) %></span>
						
						
						
							<span class="sc_head"></span>
							<span class="sc_desc"><%=CmmUtil.nvl(aDTO.getAca_area1())%> <%=CmmUtil.nvl(aDTO.getAca_area2())%></span>

					
					
						


                                       <%--  <tr class="odd gradeX">
                                            <td>
                                            <%=CmmUtil.nvl(aDTO.getAca_no())%></td>
                                            <td>
                                            <a href="javascript:doDetail('<%=CmmUtil.nvl(aDTO.getAca_no())%>');"><%=CmmUtil.nvl(aDTO.getAca_name()) %></a></td>
                                            <td><%=CmmUtil.nvl(aDTO.getAca_area1())%> <%=CmmUtil.nvl(aDTO.getAca_area2())%></td>
                                        </tr> --%>
                                        <% } %>
                                        
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
                
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
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
    <script src="assets/js/custom.js"></script>
    <a href="/accountreg.do" class="btn btn-success">등록</a>
   
</body>
</html>
