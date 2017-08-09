<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <title>Home</title>
      <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
      <script>
       
      $(function() {
         
        $("#checkJson").click(function() {
           
          //사람 정보
          var personArray = new Array();
          
          for(var i=1; i<10; i++){
        	  
	          var personInfo = new Object();
	           
	          personInfo.name = i;
	          personInfo.age = 10+i;
	          personInfo.gender = 100+i;
	          personInfo.nickname = 1000+i;
	             
	          personArray.push(personInfo);
          }
           
         
          //사람, 책 정보를 넣음
          var totalInfo = new Object();
           
          totalInfo.persons = personArray;
/*           totalInfo.books = bookArray;
 */           
          var jsonInfo = JSON.stringify(totalInfo);
           console.log(jsonInfo); //브라우저 f12개발자 모드에서 confole로 확인 가능
          alert(jsonInfo);
     
        });
         
      });
       
      </script>
    </head>
    <body>
        <br>
        <br>
        <a id="checkJson" style="cursor:pointer">확인</a>
    </body>
</html>