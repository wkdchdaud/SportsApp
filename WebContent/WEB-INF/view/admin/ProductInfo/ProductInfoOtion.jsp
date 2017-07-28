<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" >

<tr>
<td>상품옵션이름</td>
<td><input type="text" name="prod_name" value="" style= 'width :430px'/></td>
</tr>

<tr>
<td>옵 </td>
<td><input type="text" name="prod_price" value="" style= 'width :430px'/></td>
</tr>

<tr>
<td>제품내용</td>
<td><textarea id="summernote" name="prod_contents" rows="15" col="500"></textarea></td>

</tr>


<tr align="center">

<td colspan="2">
&nbsp;

<input type=submit value="등록"> 
<input type=button value="취소" OnClick="location.href='/admin/ProductInfo/List.do' ">
 </tr>


</table> 

</body>
</html>