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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 리스트</title>
<script type="text/javascript">

//상세보기 이동
function doDetail(aca_no){ 
	location.href="/accountinfo.do?aca_no="+ aca_no;
}

</script>	
</head>
<body>
<h2>공지사항</h2>
<hr/>
<br/>

<table border="1" width="600px">
<tr>
	<td width="100" align="center">학원 No.</td>
	<td width="200" align="center">학원 이름</td>
	<td width="100" align="center">주소1</td>
	<td width="100" align="center">주소2</td>
</tr>
<%
for (int i=0; i<rlist.size(); i++){
	AcademyDTO aDTO = rlist.get(i);

	if (aDTO==null){
		aDTO = new AcademyDTO();
	}
	
%>
<tr>

	
	<td align="center">
	<%=CmmUtil.nvl(aDTO.getAca_no())%>
		</td>
	<td align="center">
	<a href="javascript:doDetail('<%=CmmUtil.nvl(aDTO.getAca_no())%>');">
	<%=CmmUtil.nvl(aDTO.getAca_name()) %></a>
		</td>
	<td align="center">
	<%=CmmUtil.nvl(aDTO.getAca_area1())%></td>
	<td align="center">
	<%=CmmUtil.nvl(aDTO.getAca_area2())%></td>
</tr>
<%
}
%>
</table>
<a href="/accountreg.do">[글쓰기]</a>
</body>
</html>