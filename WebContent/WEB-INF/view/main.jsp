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
������!���Ѹ� ����� ���� �׽�Ʈ<br>

�����׽�Ʈ 1 �Դϴ�
���� 1���� �������� ���� 2 �׽�Ʈ<!-- ������ �׽�Ʈ  -->
=======
�����׽�Ʈ 1 �Դϴ�<!-- ���Ѹ� test2 -->
���� 1���� �������� ���� 2 �׽�Ʈ

<%for(TestDTO testDTO : list){ %>
	<%=testDTO.getAb() %>&nbsp;|&nbsp;<%=testDTO.getBc() %>
<%} %>
<!-- ���ʿ� -->
</body>
</html>