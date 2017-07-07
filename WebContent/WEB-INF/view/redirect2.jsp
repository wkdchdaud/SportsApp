<%@page import="sports.com.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String msg1 = CmmUtil.nvl((String)request.getAttribute("msg1"));
	String msg2 = CmmUtil.nvl((String)request.getAttribute("msg2"));
	String url = CmmUtil.nvl((String)request.getAttribute("url"));
%>
<script type="text/javascript">
	alert('<%=msg1%>\n<%=msg2 %>');
	location.href = "<%=url %>";
</script>