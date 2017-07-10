<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sports.com.dto.AcademyDTO" %>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%>     
<%@ page import="sports.com.util.CmmUtil" %>
    
    
<%
AcademyDTO aDTO = (AcademyDTO)request.getAttribute("aDTO"); 

if (aDTO==null){
	aDTO = new AcademyDTO();
}
%>      
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>거래처 수정</title>


<script type="text/javascript">


var SetComma = function(str) {

    var regMustNumberComma = /^[0-9|,|\t]+$/;
    str = str.replace(/,/g,'');

    var retValue = "";
        for( i = 1; i <= str.length; i++ ) {
            if( i > 1 && (i%3) == 1 )
                retValue = str.charAt(str.length - i) + "," + retValue;
            else
                retValue = str.charAt(str.length - i) + retValue;
        }
        if( regMustNoStartZero.test(retValue) == true && window.event.keyCode != 9 ) {
            alert("입력숫자는 '0'으로 시작할 수 없습니다.");
            return "";
        }
        if( regMustNumberComma.test(retValue) == false ) {
            alert("숫자만 입력하실 수 있습니다.");
            return "";
        }
        return retValue;

}
	
      function doAction(gubun) {
         var f = document.getElementById("form1");
         if(gubun=="U"){
        	f.action = "accountupdate.do";
            f.submit();
         }else if(gubun=="D"){
            if(confirm("삭제하시겠습니까?")){
               f.action = "delete.do";
               f.submit();
            }
         }
      }
/*       function doFileUpload() {

         var cw = screen.availWidth; //화면 넓이
         var ch = screen.availHeight; //화면 높이

         var sw = 500; //띄울 창의 넓이
         var sh = 400; //띄울 창의 높이

         var ml = (cw - sw) / 2; //가운데 띄우기위한 창의 x위치
         var mt = (ch - sh) / 2; //가운데 띄우기위한 창의 y위치

         window.open("/file/FileUploadSingPOP.do?jObj=fileGRP", "UPLOAD_POP",
                 "width=" + sw + ",height=" + sh + ",top=" + mt + ",left=" + ml
                       + ",resizable=no,scrollbars=yes");
        }
 */
      //이미지 첨부가 완료되면 실행될 함수
      function doUploadOK() {

         var btnImg = document.getElementById("btnImg");

         btnImg.value = "업로드가 완료되었습니다.";
         btnImg.disabled;

      }
   </script>
   
</head>

<body>

    <div id="wrapper">


        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"> 수정</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"> 수정
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            
             
             <form name="form1" method="post" action="academyupdateform.do">            
                <p align="right">
<hr>
<input type="hidden" name="aca_no" class="form-control"  value="<%=CmmUtil.nvl(aDTO.getAca_no()) %>"/><br/></p>

<table  border="1" class="table table-striped table-bordered table-hover">
                            
                              <tr>
                                 <td align="center"><b>학원명</b></td>
                                 <td colspan="3"><input type="text" name="aca_name" class="form-control" maxlength="10" value="<%=CmmUtil.nvl(aDTO.getAca_name()) %>"/></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>주소1</b></td>
                                 <td colspan="3"> <input type="text" name="aca_area1" class="form-control" maxlength="10" value="<%=CmmUtil.nvl(aDTO.getAca_area1()) %>"/></td>
                                 <td align="center"><b>주소2</b></td>
                                 <td colspan="7"> <input type="text" name="aca_area2" class="form-control"  maxlength="10" value="<%=CmmUtil.nvl(aDTO.getAca_area2()) %>"/></td>
                              </tr>
                              

                              </tbody>
                           </table>
                       
                           
                           
                         <p align="right">
                         <input type="submit" value="확인" class="btn btn-outline btn-info">
										<input type=button value="취소" class="btn btn-outline btn-success"
											onclick="location.href='/fest/festlist.do'"/>
                               </p>
                               
                              
</form>                        
                            
                            
                            </div>

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

<!--     jQuery
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    Bootstrap Core JavaScript
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    Metis Menu Plugin JavaScript
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    DataTables JavaScript
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>
    
    Custom Theme JavaScript
    <script src="../dist/js/sb-admin-2.js"></script> -->

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
   

</body>

</html>