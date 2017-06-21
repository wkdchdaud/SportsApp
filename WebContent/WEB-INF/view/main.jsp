<%@page import="java.util.ArrayList"%>
<%@page import="sports.com.dto.TestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	List<TestDTO> list = (List<TestDTO>)request.getAttribute("list");
	if(list == null){
		list = new ArrayList<TestDTO>();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
ㅇㅋ요!장총명 깃허브 수정 테스트<br>

수정테스트 1 입니다
수정 1에서 에러나고 수정 2 테스트<!-- 인현묵 테스트  -->
=======
수정테스트 1 입니다<!-- 장총명 test2 -->
수정 1에서 에러나고 수정 2 테스트

<%for(TestDTO testDTO : list){ %>
	<%=testDTO.getAb() %>&nbsp;|&nbsp;<%=testDTO.getBc() %>
<%} %>
<!-- 이필원 -->
</body>
</html>