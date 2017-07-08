<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="sports.com.util.CmmUtil" %>
<%@ page import="sports.com.dto.ProductInfoDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %> 
<%


List<ProductInfoDTO> rList = (List<ProductInfoDTO>) request.getAttribute("DLWKDUS");

if (rList==null) {
	rList = new ArrayList<ProductInfoDTO>();
}
%> 
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품소개 리스트</title>
</head>
<body>


	<table border="1" width="500px">
	
		<tr>
			<td width="200" align="center">제품이름</td>
			<td width="200" align="center">제품가격</td>
		</tr>
		
		<%
			for (ProductInfoDTO aDTO : rList) {

				if (aDTO==null) {
					aDTO = new ProductInfoDTO();
				}
		%>
		
		<tr>
		
			<td align="center"><a href="/admin/ProductInfo/ProductInfoDetail.do?prod_no1=<%=CmmUtil.nvl(aDTO.getProd_no()) %>">
			<%=CmmUtil.nvl(aDTO.getProd_name()) %></td>
			<td align="center"><%=CmmUtil.nvl(aDTO.getProd_price()) %></td>
		</tr>
		
		<%
		}
		%>
		
	</table>





</body>
</html>