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
<!DOCTYPE html>

<html lang="en">
<head>

  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="/assets2/product/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets2/product/css/bootstrap.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="product/css/shop-homepage.css" rel="stylesheet">
 <!-- jQuery -->
    <script src="/assets2/product/product.js/jquery.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
// 검색시 

$(function(){
	
$("#Search").keyup(function(){//인풋아이디값에 해당하는 내용을 이 바뀔때 시작
/* 	alert("안녕하세여ㅛ"); */
	var price = $("#SearchSelect").val();//셀렉트박스값을 선언한 search변수안에 넣는다.
	var name= $('#Search').val();//인풋 아이디인 값을 가져와라
		alert('"name"'+ name+'",price"'+ price); 
		
	if(price=='all'){//만약 select박스 벨류값이 lowprice라면
	/* alert("에잉");   */
	alert($('.col-sm-4.col-lg-4.col-md-4').html());
	$('.col-sm-4.col-lg-4.col-md-4').html(null);
		$.ajax({//아작스 실행
			url : "/admin/ProductInfo/allSearch.do",
			method : "post",
			data : {
				'price' : price,
				'name' : name			
			},
			dataType : "json",
			success : function(data){//성공하면 함수실행data 키벨류값
	/* 			alert("아아아아"); */  
				console.log(data);
				var contents = "";
				var cnt=1;
					$.each(data, function(key,value){
						contents += "<div class='thumbnail'>";
						contents += "<img src='http://placehold.it/500x500' alt=''>";
						contents += "<div class='caption'>";
						contents += "<h4 class='pull-right'>" + value.prod_price + "</h4>";
						contents += "<h4> <a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1=" + value.prod_no + "'>" + value.prod_name + "</a></h4>";
						contents += "<p>See more snippets like this online store item at <a target='_blank' href='http://www.bootsnipp.com'>Bootsnipp - http://bootsnipp.com</a>.</p>";
						contents += "</div>";
						contents += "<div class='ratings'>";
						contents += "</div>";
						contents += "</div>";
						cnt++;
				});
					alert(cnt);
				$('.col-sm-4.col-lg-4.col-md-4').html(contents);
			}
		});//ok
	
	}
	else if(price=='lowprice'){//만약 select박스 벨류값이 lowprice라면
		$.ajax({//아작스 실행
			url : "admin/ProductInfo/lowpriceSearch.do",
			method : "post",
			data : {
				'price' : price,
				'name' : name			
			},
			dataType : "json",
			success : function(data){//성공하면 함수실행data 키벨류값
				console.log(data);
				var contents = "";
	
					$.each(data, function(key,value){
						contents += "<div class='thumbnail'>";
						contents += "<img src='http://placehold.it/500x500' alt=''>";
						contents += "<div class='caption'>";
						contents += "<h4 class='pull-right'>" + value.getProd_price + "</h4>";
						contents += "<h4> <a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1=" + avalue.prod_no + "'>" + value.prod_name + "</a></h4>";
						contents += "<p>See more snippets like this online store item at <a target='_blank' href='http://www.bootsnipp.com'>Bootsnipp - http://bootsnipp.com</a>.</p>";
						contents += "</div>";
						contents += "<div class='ratings'>";
						contents += "</div>";
						contents += "</div>";
						
				})
				$('.col-sm-4 col-lg-4 col-md-4').html(contents);
			}
		});//ok
	}
	else if(price==highprice){
		{
			$.ajax({//아작스 실행
				url : "admin/ProductInfo/highpriceSearch.do",
				method : "post",
				data : {
					'word' : word,
					'selected' : selected			
				},
				dataType : "json",
				success : function(data){//성공하면 함수실행data 키벨류값
					console.log(data);
					var contents = "";
					$.each(data, function(key,value){
						contents += "<div class='thumbnail'>";
						contents += "<img src='http://placehold.it/500x500' alt=''>";
						contents += "<div class='caption'>";
						contents += "<h4 class='pull-right'>" + value.getProd_price + "</h4>";
						contents += "<h4> <a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1=" + avalue.prod_no + "'>" + value.prod_name + "</a></h4>";
						contents += "<p>See more snippets like this online store item at <a target='_blank' href='http://www.bootsnipp.com'>Bootsnipp - http://bootsnipp.com</a>.</p>";
						contents += "</div>";
						contents += "<div class='ratings'>";
						contents += "</div>";
						contents += "</div>";
						
					})
					$('.col-sm-4 col-lg-4 col-md-4').html(contents);
				}
			})
		}
	}
});//ok
});//맨위

/* function go_search() {
                                                                                          
 

 
 if (keyWord.value == "") {
  alert("검색어를 입력해주세요.");
  return;
 }
 f.method = "post";                                                        
 f.action="admin/ProductInfo/List.do";                                
 f.submit();
} */
</script>
    
</head>
<body>





<!-- 검생 -->
       <div class="container">
  <!-- 검색 컬럼 -->
      	<select id="SearchSelect">
      
        <option value='all'>전체</option>
        <option value='lowprice'>낮은가격</option>
        <option value='highprice'>높은가격</option>
        
      </select>
      
      <input type='text' name='keyWord' id='Search' placeholder="상품이름을 입력하세요" />
      <button type='submit' onclick="go_search();">검색</button>    
       
    
        <div class="row">
            <div class="col-md-9">

<!-- 스포츠용품리스트 시작 -->
                <div class="row">
              <%
         for (ProductInfoDTO aDTO : rList) {

            if (aDTO==null) {
               aDTO = new ProductInfoDTO();
            }
      %>
   
      
      
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                               <img src="http://placehold.it/500x500" alt="">
                          
                            <div class="caption">
                                <h4 class="pull-right"><%= CmmUtil.nvl(aDTO.getProd_price()) %></h4>
                                <h4><a href="/admin/ProductInfo/ProductInfoDetail.do?prod_no1=<%=CmmUtil.nvl(aDTO.getProd_no()) %>"> <%= CmmUtil.nvl(aDTO.getProd_name()) %></a>
                                </h4>
                                <p>See more snippets like this online store item at <a target="_blank" href="http://www.bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                            </div>
                            <div class="ratings">
                                                            </div>
                        </div>
                   
                    </div>
 <%} %>
 
 
 
                </div>

            </div>

        </div>

    </div>
    <input type=button value="등록" OnClick="location.href='/admin/ProductInfo/ProductInfoReg.do' ">
    
    <!-- /.container -->
    

    <div class="container">
    
        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->



    <!-- Bootstrap Core JavaScript -->
    <script src="/assets2/product/product.js/bootstrap.min.js"></script>
    
    

</body>
</html>