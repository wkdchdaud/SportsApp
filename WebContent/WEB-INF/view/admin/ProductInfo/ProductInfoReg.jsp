<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/admin/ProductInfo/ProductInfoInsert.do" method='POST'>
<table border="1">

<tr>
<td>제품이름 </td>
<td><input type="text" name="prod_name" value="hhh"/></td>
</tr>

<tr>
<td>제품가격 </td>
<td><input type="text" name="prod_price" value="1234"/></td>
</tr>

<tr>
<td>제품내용</td>
<td><textarea name="prod_contents" rows="600px" cols="400px"></textarea></td>

</tr>
<tr align="center">

<td colspan="2">
&nbsp;

<input type=submit value="등록"> 
<input type=button value="취소" OnClick="location.href='/admin/ProductInfo/List.do' ">
  </tr>



</table>

</form>

</body>

</html>