<%@page import="sports.com.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String msg = CmmUtil.nvl((String)request.getAttribute("msg"));
%>
<script type="text/javascript">
	alert('<%=msg%>');
	self.close();
</script>
