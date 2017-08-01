<%@page import="java.util.ArrayList"%>
<%@page import="sports.com.dto.UserDTO"%>
<%@page import="sports.com.util.AES256Util"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<UserDTO> ulist = (List<UserDTO>)request.getAttribute("udto");

%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <script>
	
   </script>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Free Bootstrap Admin Template : Binary Admin</title>
    
<%@include file="/inc/head.jsp"%>

    
</head>
<body>
    <div id="wrapper">
    
               <!-- 사이드 네비바 및 헤더 부분 시작 -->
               <%@include file="/inc/side_nav.jsp"%>
       	   	   <!-- 사이드 네비바 및 헤더 부분 끝  -->
       	   	   
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Table Examples</h2>   
                        <h5>Welcome Jhon Deo , Love to see you back. </h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
           
            <div class="row">
              <div class="col-md-12">
                
                     <!--    Context Classes  -->
                    <div class="panel panel-default" style="text-align: center">
                       
                        <div class="panel-heading">
                            	권한 리스트
                        </div>
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">회원번호</th>
                                            <th style="text-align: center">회원이름</th>
                                            <th style="text-align: center">회원아이디</th>
                                            <th style="text-align: center">회원권한</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <%for (UserDTO list : ulist) {%>
                                        <tr class="success">
                                            <td><%=list.getUser_no()%></td>
                                            <td><%=AES256Util.strDecode(list.getUser_name())%></td>
                                            <td><%=AES256Util.strDecode(list.getUser_id())%></td>
                                            <td>
                                            
                                            <select class="btn btn-info" id="authselect" size="1" style="-webkit-appearance: none;" >
                                     		<%if(list.getAuth().equals("A")){ %>       
                                            <option value ="A">A</option>
                                            <option value ="U">U</option>
                                            <% } else { %>
                                            <option value ="U">U</option>
                                            <option value ="A">A</option>
                                            <%} %>
                                            
                                            </select>
                                            
                                            </td>
                                        </tr>
                                   <% } %>
                               <!--          <tr class="info">
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr class="warning">
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                        <tr class="danger">
                                            <td>4</td>
                                            <td>John</td>
                                            <td>Smith</td>
                                            <td>@jsmith</td>
                                        </tr> -->

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--  end  Context Classes  -->
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

      <!-- BOOTSTRAP SCRIPTS -->
    <script src="/assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="/assets/js/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="/assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="/assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
    
   
</body>
</html>
