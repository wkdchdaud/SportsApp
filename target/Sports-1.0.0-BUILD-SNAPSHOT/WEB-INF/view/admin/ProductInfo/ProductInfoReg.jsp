<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
<!-- include summernote-ko-KR -->
<script src="lang/summernote-ko-KR.js"></script>



</script>
  <script>
    $(document).ready(function() { 
        $('#summernote').summernote();
    });
  </script>
<title>Insert title here</title>
</head>
<body>

<form action="/admin/ProductInfo/ProductInfoInsert.do" method='POST'>
<!-- <textarea id="summernote" name="prod_contents"></textarea> -->



<table border="1" >

<tr>
<td>제품이름 </td>
<td><input type="text" name="prod_name" value="" style= 'width :430px'/></td>
</tr>

<tr>
<td>제품가격 </td>
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
 





</form>
<script>
     $(document).ready(function() {
         $('#summernote').summernote({
    height : 800px, // 에디터의 높이 
    width:  500,
    minHeight : null,
    maxHeight : null,
    focus : true,
    lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경
         });
     });

     var postForm = function() {
      var contents =  $('textarea[name="prod_contents"]').html($('#summernote').code());
  }
 
</script>



</body>

</html>