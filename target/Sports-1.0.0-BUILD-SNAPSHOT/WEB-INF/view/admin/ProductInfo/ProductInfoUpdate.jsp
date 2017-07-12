<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="sports.com.util.CmmUtil" %>
<%@ page import="sports.com.dto.ProductInfoDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %> 
<%


List<ProductInfoDTO> rList = (List<ProductInfoDTO>) request.getAttribute("dlwkdus");

if (rList==null) {
	rList = new ArrayList<ProductInfoDTO>();
}
%> 
	
		<%
			for (ProductInfoDTO aDTO : rList) {

				if (aDTO==null) {
					aDTO = new ProductInfoDTO();
				}
		%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정</title>
</head>

<body>


<form action="/admin/ProductInfo/ProductInfoUpdate.do" method='post'>
<table border="1">

<input type="hidden" name="prod_no" value="<%=CmmUtil.nvl(aDTO.getProd_no()) %>"/>
<tr>
<td>제품이름 </td>
<td>
<input type="text" name="prod_name" value="<%=CmmUtil.nvl(aDTO.getProd_name()) %>"/></td>
</tr>

<tr>
<td>제품가격 </td>
<td><input type="text" name="prod_price" value="<%=CmmUtil.nvl(aDTO.getProd_price())%>"/></td>
</tr>

<tr>
<td>제품내용</td>
<td><textarea name="prod_contents" rows="600px" cols="400px"> <%=CmmUtil.nvl(aDTO.getProd_contents())%>"</textarea></td>

</tr>
<tr align="center">

<td colspan="2">
&nbsp;
</td>
</tr>
</table>
<input type=submit value="등록"> 
<input type=button value="취소" OnClick="location.href='/admin/ProductInfo/List.do' ">
<%
			}
			%>
			</form>
</body>
</html>