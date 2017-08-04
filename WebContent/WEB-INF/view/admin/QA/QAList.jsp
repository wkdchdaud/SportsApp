<%@page import="sports.com.util.AES256Util"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sports.com.util.CmmUtil" %>
<%@ page import="sports.com.dto.QADTO" %>
<%@ page import="java.util.List"%>   
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.HashMap"%>  
<%@ page import="java.util.Date" %>  
<%@ page import="java.text.SimpleDateFormat" %>
<%
List<QADTO> rList =	(List<QADTO>) request.getAttribute("rList");

if (rList==null) {
	rList = new ArrayList<QADTO>();
}

String user_no = CmmUtil.nvl((String)session.getAttribute("user_no"));
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Q&A 목록(스포츠 용품업자)</title>
<%@include file="/inc/head.jsp"%>
<!-- JQUERY SCRIPTS -->
<script src="/assets/js/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

$(function() {
	
	var cnt = 6;
	var search ="";

//검색
$('#searchbox').keyup(function() {
	
	cnt = 6;
	search = $('#searchbox').val();
	
	$.ajax({
		
		url : "/admin/QA/QASearchList.do",
		method : "post",
		data : {'search' : search},
		datatype :	"json",
		success : function(data) {
			
			var contents ="";
			console.log(data)
			
			$.each(data,function (key,value) {
				
				var yn = value.answer_yn;
				
				contents += "<tr><td align='left'>";
				contents += "<input type='checkbox' name='deleteSelect' class='deleteSelect' value="+value.qa_no+" />&nbsp;&nbsp;";
				
				if (value.answer_yn == "Y") {
					contents += "<a href='/admin/QA/QAAnswerDetail.do?qa_no="+value.qa_no+"'>";
				} else {
					contents += "<a href='/admin/QA/QADetail.do?qa_no="+value.qa_no+"'>";
				}
				
				if (value.answer_yn == "Y") {
					contents += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				
				contents += value.title+"</td>";
				contents += "<td align='left'>"+value.reg_user_no+"</a></td>";
				contents += "<td align='left'>"+value.reg_dt+"</td></tr>";
				
			});
			
			$('#list_more').html(null);
			$('#list_more').append(contents);
			
			var dS = document.getElementsByClassName("deleteSelect");
			
			for (var i =0; i<dS.length; i++) {
				dS[i].style.display = "none";
			}
				
			document.getElementById("delete").style.display = "none";
			document.getElementById("all").style.display = "none";
			
			if (data.length < 6) {
				$("#addview").hide();
			}
			
			if (data.length >= 6) {
				$("#searchadd").html("<center><input type='button' style='width: 150px;' class='btn btn-success' value='더보기' id='addview' /></center>");
			}
			
		}
		
	});	//ajax closed
	
});	//"searchbox" function closed

<% if (rList.size() < 6) {%>
	$("#addview").hide();
<%} %>

//더보기
$("#addview").add("#searchadd").click(function() {
	
	$.ajax({

		url : "/admin/QA/QAReadMore.do",
		method : "post",
		data : {'cnt' : cnt, 'search' : search},
		dataType : "json",
		success : function(data) {
			
			var contents = "";
			console.log(data)
			
			$.each(data,function (key,value) {
				
				var yn = value.answer_yn;
				
				contents += "<tr><td align='left'>";
				contents += "<input type='checkbox' name='deleteSelect' class='deleteSelect' value=" + value.qa_no + " />&nbsp;&nbsp;";
				
				if (value.answer_yn == "Y") {
					contents += "<a href='/admin/QA/QAAnswerDetail.do?qa_no="+value.qa_no+"'>";
				} else {
					contents += "<a href='/admin/QA/QADetail.do?qa_no="+value.qa_no+"'>";
				}
				
				if (value.answer_yn == "Y") {
					contents += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				
				contents += value.title+"</td>";
				contents += "<td align='left'>"+value.reg_user_no+"</a></td>";
				contents += "<td align='left'>"+value.reg_dt+"</td></tr>";
				
			});
			
			$('#list_more').append(contents);
			
			if ((data).length<6) {
				$('#addview').remove();
			}
			
			var dS = document.getElementsByClassName("deleteSelect");
			
			for (var i =0; i<dS.length; i++) {
				dS[i].style.display = "none";
			}
				
			document.getElementById("delete").style.display = "none";
			document.getElementById("all").style.display = "none";
		}
	
	});	//ajax closed
	
	cnt += 6;

});	//"addview" function closed

});	//jQuery function closed

//질문 상세 이동
function doDetail(qa_no) {
	location.href="/admin/QA/QADetail.do?qa_no=" + qa_no;
}

//답글 상세 이동
function doAnswerDetail(qa_no, answer_yn) {
	location.href="/admin/QA/QAAnswerDetail.do?qa_no=" + qa_no;
}

//체크박스 숨겨놓기
function hiddenCheckbox() {
	
	var dS = document.getElementsByClassName("deleteSelect");
		
	for (var i =0; i<dS.length; i++) {
		dS[i].style.display = "none";
	}
		
	document.getElementById("delete").style.display = "none";
	document.getElementById("all").style.display = "none";
	
}

//편집버튼 누르면 체크박스 뜸
function edit() {
	
	cbox = f.deleteSelect;
	
	var dS = document.getElementsByClassName("deleteSelect");
	
	for (var i =0; i<dS.length; i++) {
		
		if (dS[i].style.display == "none") {
			
			dS[i].style.display ="";
				
		} else {
			
			if (dS[i].style.display == "") {
				dS[i].style.display ="none";
			}
			
		}
		
	}
	
	if (cbox.length) { 
		
        for (var i = 0; i<cbox.length;i++) {
            cbox[i].checked="";
        }
        
    } else { 
    	
        cbox.checked="";
        
    }
	
	f.all.checked="";
	
	if (document.getElementById("delete").style.display == "") {
		
		document.getElementById("delete").style.display = "none";
		document.getElementById("all").style.display = "none";
		
		return;
		
	}

	document.getElementById("delete").style.display = "";
	document.getElementById("all").style.display = "";
	
}

//체크박스 전체 선택
function allCheck(f) {
    
	cbox = f.deleteSelect;
   
	if (cbox.length) {
		
        for(var i = 0; i<cbox.length;i++) {
            cbox[i].checked=f.all.checked;
        }
        
    } else { 
    	
        cbox.checked=f.all.checked;
        
    }
	
}

//체크박스 선택된 게시글 삭제
function deleteConfirm(f) {
	
	if (confirm("선택된 게시글을 삭제하시겠습니까?")) { 
		
		document.getElementById("f").submit();
	    
	} else {  
		
	    return;
	}

}

</script>
</head>
<body onload="javascript:hiddenCheckbox();" >

	<div id="wrapper">
		<!-- 사이드 네비바 및 헤더 부분 시작 -->
		<%@include file="/inc/side_nav.jsp"%>
		<!-- 사이드 네비바 및 헤더 부분 끝  -->
	
	<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Q&A</h2>
					</div>
				</div>
				
	<!-- /. ROW  -->
		<hr />
		<div class="row">
			<div class="col-md-7">
				<div class="panel panel-default" style="width: 100%">
						<div class="panel-heading">Q&A 목록</div>

	<!--    Context Classes  -->
	<form name="f" id="f" method="post" action="/admin/QA/QACheckboxDelete.do">
	
		<div class="panel panel-default" style="width: 100%">
			<div class="panel-body">
	
	<center>빠른 검색&nbsp;&nbsp;<input type="text" id="searchbox" value="" style="width: 200px" /></center>
	<br/>
	
	<table class="table">

		<thead>
	
		<tr>
			<th align="center" style="width: 400px"><font size="2px"><input type="checkbox" name="all" id="all" value="전체선택" onclick="allCheck(this.form);" />&nbsp;&nbsp;제목</font></th>
			<th align="center" style="width: 200px"><font size="2px">작성자</font></th>
			<th align="center" style="width: 200px"><font size="2px">작성일</font></th>
		</tr>
		   
		</thead>
		
		<tbody id="list_more">
		
		<%
			for (QADTO rDTO : rList) {

				if (rDTO==null) {
					rDTO = new QADTO();
				}
		%>
		
		<tr>
			<td align="left">
			<input type="checkbox" name="deleteSelect" class="deleteSelect" value="<%=rDTO.getQa_no()%>" />
			&nbsp;&nbsp;
			<% if (CmmUtil.nvl(rDTO.getAnswer_yn()).equals("Y")) {%>
			
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<a href="javascript:doAnswerDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>');"><%=CmmUtil.nvl(rDTO.getTitle()) %></a>
				
				<% if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {
					out.println("<b>[SECRET]</b>");
				}%>
				
				<%
				String reg_dt = CmmUtil.nvl(rDTO.getReg_dt());
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date to = transFormat.parse(reg_dt);
				
				long now = System.currentTimeMillis();
				long inputDate = to.getTime();
				String mark = "";
				 
				if (now - inputDate < (1000*60*60*24*3)) {
					out.println("<b>[NEW]</b>");
				}
				%>
				
			<%} else {%>
			
				<a href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getQa_no())%>');"><%=CmmUtil.nvl(rDTO.getTitle()) %></a>
				
				<% if (CmmUtil.nvl(rDTO.getSecret_yn()).equals("1")) {
					out.println("<b>[SECRET]</b>");
				}%>
				
				<%
				String reg_dt = CmmUtil.nvl(rDTO.getReg_dt());
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date to = transFormat.parse(reg_dt);
				
				long now = System.currentTimeMillis();
				long inputDate = to.getTime();
				String mark = "";
				 
				if (now - inputDate < (1000*60*60*24*7)) {
					out.println("<b>[NEW]</b>");
				}
				%>
				
			<%} %>
			</td>
			<td align="left"><%= CmmUtil.nvl(rDTO.getAnswer_yn()).equals("Y")?"관리자":AES256Util.strDecode(CmmUtil.nvl(rDTO.getUser_name()))%></td>
			<td align="left"><%=CmmUtil.nvl(rDTO.getReg_dt().substring(0, 10)) %></td>
		</tr>

		<%
		}
		%>
		
		</tbody>
		
	</table>

	<!-- 더보기 -->
	<div id="searchadd"><center><input type="button" style="width: 150px" class="btn btn-success" value="더보기" id="addview" /></center></div>
	
		</div>
	</div>
	<!--  end  Context Classes  -->

	<input type="button" value="편집" onclick="location.href='javascript:edit(this.form);' " />
	<input type="button" id="delete" value="삭제" onclick="location.href='javascript:deleteConfirm(this.form);' " />
	<input type="button" value="글쓰기" onclick="location.href='/admin/QA/QAReg.do' " />
	
	</form>

						</div>
					</div>
				</div>
			</div>
			
			<!-- /. ROW  -->
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
	<!-- CUSTOM SCRIPTS -->
	<script src="/assets/js/custom.js"></script>
		
</body>
</html>