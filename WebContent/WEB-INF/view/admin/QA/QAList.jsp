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
session.setAttribute("SESSION_USER_NO", "USER01");

List<QADTO> rList =	(List<QADTO>) request.getAttribute("rList");

if (rList==null) {
	rList = new ArrayList<QADTO>();
}
%>
<!DOCTYPE html>        
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A 목록(스포츠 용품업자)</title>
<script type="text/javascript">

function doDetail(qa_no) {
	location.href="/admin/QA/QADetail.do?qa_no=" + qa_no;
}

function doAnswerDetail(qa_no, answer_yn) {
	location.href="/admin/QA/QAAnswerDetail.do?qa_no=" + qa_no;
}

function hiddenCheckbox() {
	
	var dS = document.getElementsByClassName("deleteSelect");
		
	for (var i =0; i<dS.length; i++) {
		dS[i].style.display = "none";
	}
		
	document.getElementById("delete").style.display = "none";
	document.getElementById("all").style.display = "none";
	
}

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
		
        for(var i = 0; i<cbox.length;i++) {
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

function deleteConfirm(f) {
	
	if (confirm("선택된 게시글을 삭제하시겠습니까?") == true) { 
		
		document.getElementById("f").submit();
	    
	} else {  
		
	    return;
	}

}

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

</script>
</head>
<body onload="hiddenCheckbox();" >

<h2>Q&A</h2>
<hr/>

<form name="f" id="f" method="post" action="/admin/QA/QACheckboxDelete.do">

	<table width="600px">
	
		<tr>
			<td align="left">
				<input type="button" value="편집" onclick="location.href='javascript:edit(this.form);' " />
				<input type="button" id="delete" value="삭제" onclick="location.href='javascript:deleteConfirm(this.form);' " />
			</td>
			<td align="right"><input type="button" value="글쓰기" onclick="location.href='/admin/QA/QAReg.do' " /></td>
		</tr>
		
	</table>
	
<br/>	

	<table border="1" width="600px">
	
		<tr>
			<th width="250" align="center">제목 <input type="checkbox" name="all" id="all" value="전체선택" onclick="allCheck(this.form);" /></th>
			<th width="100" align="center">작성자</th>
			<th width="150" align="center">작성일</th>
		</tr>
		
		<%
			for (QADTO rDTO : rList) {

				if (rDTO==null) {
					rDTO = new QADTO();
				}
		%>
		
		<tr>
			<td align="left">
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
			<input type="checkbox" name="deleteSelect" class="deleteSelect" value="<%=rDTO.getQa_no()%>" />
			<td align="center"><%=CmmUtil.nvl(rDTO.getUser_name()) %></td>
			<td align="center"><%=CmmUtil.nvl(rDTO.getReg_dt().substring(0, 10)) %></td>
		</tr>

		<%
		}
		%>
		
	</table>
	
</form>
	
</body>
</html>