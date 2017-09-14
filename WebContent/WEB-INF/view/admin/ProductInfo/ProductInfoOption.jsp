<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>

    <link href="/assets/css/bootstrap.css" rel="stylesheet" />

    <script type="text/javascript">
   
    var num = 0;
    
    function doAction(gubun) {
		
    	var f = document.getElementById("form1");
    		
    	if (gubun == "C") {
    		
    		f.action = "/admin/ProductInfo/ProductInfoOptionInsert.do";
    		f.submit();
    		
    	} 
    	
    }
        $(document).ready(function(){

            // 옵션추가 버튼 클릭시

            $("#addItemBtn").click(function(){
				num=0;
                // tr 태그의 마지막번째를 구해 id="item"의 형태로 만들어 lastItemNo변수에

                var lastItemNo = $("#example tr:last").attr("class").replace("item", "");
 
				//tr 복사  tr 첫번째꺼를 똑같이 복사한다.
                var newitem = $("#example tr:eq(1)").clone();

                newitem.removeClass();

                newitem.find("td:eq(0)").attr("rowspan", "1");

                newitem.addClass("item"+(parseInt(lastItemNo)+1));

                $("#example").append(newitem);

            });
/* 
            // 항목추가 버튼 클릭시

            $(".btn.btn-primary.btn-xs").live("click", function(){

                var clickedRow = $(this).parent().parent();
				
                //alert(clickedRow.attr("class"));
				
                var cls = clickedRow.attr("class");

                // tr 복사해서 마지막에 추가

                var newrow = clickedRow.clone();

                newrow.find("td:eq(0)").remove();
				num++;
                newrow.insertAfter($("#example ."+cls+":last"));

                // rowspan 조정

                resizeRowspan(cls);
				alert(num);
            }); */

            // 삭제버튼 클릭시

            $(".btn.btn-danger.btn-xs").live("click", function(){

                var clickedRow = $(this).parent().parent();

                var cls = clickedRow.attr("class");

                // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.

                if( clickedRow.find("td:eq(0)").attr("rowspan") ){

                    if( clickedRow.next().hasClass(cls) ){

                        clickedRow.next().prepend(clickedRow.find("td:eq(0)"));

                    }

                }

                clickedRow.remove();

                // rowspan 조정

                resizeRowspan(cls);

            });

            // cls : rowspan 을 조정할 class ex) item1, item2, ...

            function resizeRowspan(cls){

                var rowspan = $("."+cls).length;

                $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);

            }

        });

    </script>

</head>

 

<body>

<form id="form1" method="POST">
<button type="button" id="addItemBtn" class="btn btn-primary btn-xs">옵션추가</button>
<div class="table-responsive">
<div class="panel-body">

<table id="example" class="table table-striped table-bordered table-hover" border="1px">

        <tr>

            <th>옵션명</th>

            <th>항목명</th>

           <!--  <th>필수항목</th> -->

            <th>가격</th>

            <th>재고</th>
            <th>삭제</th>

         

        </tr>

        <tr class="item1">

            <td><input type="text" name="opt_name" class="form-control"/><!-- <button type="button" class="btn btn-primary btn-xs">항목명추가</button> --></td>

            <td><input type="text" name="opt_kind" class="form-control" /></td>

    <!--         <td><input type="checkbox" /></td> -->

            <td><input type="text" name="opt_price" class="form-control"/></td>

          <!--   <td><input type="text" name=""/></td> -->

            <td><input type="text" name="opt_cnt" class="form-control"/></td>
            <td><button type="button" class="btn btn-danger btn-xs">삭제</button></td>
        </tr>

</table>
</div>
</div>
<center><button  class="btn btn-primary btn-xs"onclick="doAction('C')"> 등록</button>
<!-- <button align="center" type="button" onclick="location.href='/admin/ProductInfo/ProductInfoReg.do';return false;"> 취소</button>
	 -->
<button  class="btn btn-danger btn-xs" type="button" onclick="self.close();">취소</button></center>
</form>

</body>

</html>


