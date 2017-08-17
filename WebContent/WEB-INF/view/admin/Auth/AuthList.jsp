<%@page import="java.util.ArrayList"%>
<%@page import="sports.com.dto.UserDTO"%>
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

<script>

/*  편집 삭제 버튼 숨기기 */
function hiddenCheckbox() {

	var dS = document.getElementsByClassName("deleteSelect");
	
	for (var i = 0; i < dS.length; i++) {
		dS[i].style.display = "none";
	}

	document.getElementById("delete").style.display = "none";
	document.getElementById("all").style.display = "none";
}

function edit(f) {
	
	cbox = f.deleteSelect;
	var qw = document.getElementsByName('qwe');
	var dS = document.getElementsByClassName("deleteSelect");

	for (var i = 0; i < dS.length; i++) {
		if (dS[i].style.display == "none") {
			dS[i].style.display = "";
			qw[i].removeAttribute("disabled");

			

		} else {
			if (dS[i].style.display == "") {
				dS[i].style.display = "none";
				qw[i].setAttribute("disabled","disabled")
			}
		}
	}

	if (cbox.length) { // 여러 개일 경우
		for (var i = 0; i < cbox.length; i++) {
			cbox[i].checked = "";
		}
	} else { // 한 개일 경우
		cbox.checked = "";
	}

	f.all.checked = "";

	if (document.getElementById("delete").style.display == "") {

		document.getElementById("delete").style.display = "none";
		document.getElementById("all").style.display = "none";

		return false;
	}

	document.getElementById("delete").style.display = "";
	document.getElementById("all").style.display = "";

}

function deleteConfirm(f) {
	
	var qw = document.getElementsByName('qwe');
	var dS = document.getElementsByClassName("deleteSelect");
	
	for (var i = 0; i < dS.length; i++) {
	/* alert(dS.length);		 */
	
	if(dS[i].checked){
		//alert(qw[i].options[qw[i].selectedIndex].text);//권한
		var authcon = qw[i].options[qw[i].selectedIndex].text;		
		<%for (UserDTO list : ulist) {%>
		<%-- alert(<%=list.getUser_no()%>);		//회원번호 --%>
		if(dS[i].getAttribute("value")==<%=list.getUser_no()%>){
			//alert(dS[i].getAttribute("value"));
			<%-- alert(<%=list.getUser_no()%>); --%>
		dS[i].setAttribute("value",'<%=list.getUser_no()%>,'+authcon );
		}<%}%>
	}
	
	}
	
	if (confirm("선택된 회원권한을 수정 하시겠습니까?")) {
		f.submit();
	} else {
		return;
	}

}

function allCheck(f) {

	cbox = f.deleteSelect;

	if (cbox.length) { // 여러 개일 경우
		for (var i = 0; i < cbox.length; i++) {
			cbox[i].checked = f.all.checked;
		}
	} else { // 한 개일 경우
		cbox.checked = f.all.checked;
	}
}


</script>
    
</head>
<body onload="javascript:hiddenCheckbox();">
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
                            <form name="chk" method="post" action="/admin/auth/update.do">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th id="allchk" style="text-align: center"><input type="checkbox" name="all" id="all" onclick="allCheck(this.form);" value="전체선택" />&nbsp;회원번호</th>
                                            <th style="text-align: center">회원이름</th>
                                            <th style="text-align: center">회원아이디</th>
                                            <th style="text-align: center">회원권한</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <%for (UserDTO list : ulist) {%>
                                        <tr class="success">
                                            <td>&nbsp;&nbsp;<input type="checkbox" name="deleteSelect"
														class="deleteSelect" value="<%=list.getUser_no()%>" />&nbsp;<%=list.getUser_no()%></td>
                                            <td><%=list.getUser_name()%></td>
                                            <td><%=list.getUser_id()%></td>
                                            <td>
                                            
                                            <select class="btn btn-info" name="qwe" id="authselect" size="1"  disabled='false' style="-webkit-appearance: none;">
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
                               
                    <input type= "button" value="편집" onclick="edit(this.form)"class="btn btn-success" />
                    <input type= "button" value="수정" id="delete"  onclick="deleteConfirm(this.form)"class="btn btn-warning"  />
                     </form>
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
