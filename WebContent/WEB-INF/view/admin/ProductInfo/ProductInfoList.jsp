<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sports.com.util.CmmUtil" %>
<%@ page import="sports.com.dto.ProductInfoDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %> 
<%
List<ProductInfoDTO> rList = (List<ProductInfoDTO>) request.getAttribute("DLWKDUS");
/*  */
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

    <title>스포츠용품리스트</title>

    <!-- Bootstrap Core CSS -->
	<%@include file="/inc/head.jsp"%>
 	<!-- jQuery -->
    <script src="/assets2/product/product.js/jquery.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


    <script type="text/javascript">


	$(function(){
		var cnt = 6;
		
		/* 셀렉트 박스 값에 따른 아작스  */
		
		//셀렉트박스값을 선언한 search변수안에 넣는다.
		var name= $('#Search').val();//인풋 아이디인 값을 가져와라
		
		$("#SearchSelect").change(function(){
			var price = $("#SearchSelect").val();
			alert(price);
			if(price=='all'){
				
				$('#menu_list').html(null);
					$.ajax({//아작스 실행
						url : "/admin/ProductInfo/allSearch.do",
						method : "post",
						data : {
							'price' : price,
							'name' : name			
						},
						dataType : "json",
						success : function(data){//성공하면 함수실행data 키벨류값
			 
							console.log(data);
							var contents = "";
							var cnt=1;
								$.each(data, function(key,value){
									contents += "<div class='col-sm-4 col-lg-4 col-md-4'>";
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
									contents += "</div>";
									cnt++;
							});
								
							$('#menu_list').html(contents);
						}
					});//ok
				
				}		
				else if(price=='lowprice'){
			  //만약 select박스 벨류값이 lowprice라면
				$('#menu_list').html(null);
				$.ajax({//아작스 실행
					url : "/admin/ProductInfo/lowpriceSearch.do",
					method : "post",
					data : {
						'price' : price,
						'name' : name			
					},
					dataType : "json",
					success : function(data){//성공하면 함수실행data 키벨류값
						alert("아작스실행");
						console.log(data);
						var contents = "";
						var cnt=1;
							$.each(data, function(key,value){
								contents += "<div class='col-sm-4 col-lg-4 col-md-4'>";
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
								contents += "</div>";
								cnt++;
						});
						$('#menu_list').html(contents);
					}
				});//ok
			}
			else if(price=='highprice'){
				$('#menu_list').html(null);
				
					$.ajax({//아작스 실행
					
						url : "/admin/ProductInfo/highpriceSearch.do",
						method : "post",
						data : {
							'price' : price,
							'name' : name		
						},
						dataType : "json",
						success : function(data){//성공하면 함수실행data 키벨류값
							console.log(data);
							var contents = "";
							var cnt=1;
							$.each(data, function(key,value){
								contents += "<div class='col-sm-4 col-lg-4 col-md-4'>";
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
								contents += "</div>";
								cnt++;
								
							});
							$('#menu_list').html(contents);
						}
					});
			}
		});

		
		$("#btn_more").click(function(){
			$.ajax({
				url : "/admin/ProductInfo/readMore.do",
				method : "post",
				data : {
					'cnt' : cnt
				},
				dataType : "json",
				success : function(data){
					var contents = "";
					console.log(data)
					$.each(data,function (key,value){
						contents += "<div class='col-sm-4 col-lg-4 col-md-4'>";
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
						contents += "</div>";
					});
					$('#menu_list').append(contents)
					if ((data).length<6) {
						$('#btn_more').remove();
					}
				}
			});
			cnt += 6;
		});
	
		/*검색아작스*/
	

        
	/* 	$("#Search").keyup(function(){//인풋아이디값에 해당하는 내용을 이 바뀔때 시작

		}); */

	});

</script>
    
</head>
<body>
    
    
    
    <div id="wrapper">
 <%@include file="/inc/side_nav.jsp"%>
<div id="page-wrapper" >
            	<div id="page-inner">

					<div class="row">
                    	<div class="col-md-12">
                     	<center><h2>스포츠 용품 리스트</h2></center>   
                     	<hr/>
                    	</div>
                	</div>      
<!-- 검생 -->

       <div class="container">
  <!-- 검색 컬럼 -->
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!-- <div class="btn-group" style="text-align: center;">
		  <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" style="width: 100px">전체 <span class="caret"></span></button>
		  <ul class="dropdown-menu">
			<li><a href="#">낮은가격</a></li>
			<li class="divider"></li>
			<li><a href="#">높은가격</a></li>
		  </ul>
		&nbsp;<input type='text' name='keyWord' id='Search' placeholder="상품이름을 입력하세요" style="height: 35px" /></div> -->
     	
     	<select id="SearchSelect" class="">	
        <option value='all'>전체</option>
        <option value='lowprice'>낮은가격</option>
        <option value='highprice'>높은가격</option>
      </select> 
      
      <input type='text' name='keyWord' id='Search' placeholder="상품이름을 입력하세요" style="height: 35px" />
     <div style="float:right;" style="display: inline-block;"> <button OnClick="location.href='/admin/ProductInfo/ProductInfoReg.do' " class="btn btn-success"> 등록 </button></div>
        
    <div class="panel panel-default">
        <div class="row">
            <div class="col-md-9" id="menu_list" style="width: 100%;">

<!-- 스포츠용품리스트 시작 -->
              <%
         for (ProductInfoDTO aDTO : rList) {
      %>
   
      
      
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                               <img src="http://placehold.it/500x500" alt="">
                          
                            <div class="caption">
                                <h4 class="pull-right"><%= CmmUtil.nvl(aDTO.getProd_price()) %></h4>
                                <h4><a href="/admin/ProductInfo/ProductInfoDetail.do?prod_no1=<%=CmmUtil.nvl(aDTO.getProd_no()) %>"> <%= CmmUtil.nvl(aDTO.getProd_name()) %></a>
                                </h4>
                             
                            </div>
                        </div>
                   
                    </div>
 <%} %>
 
 

            </div>

        </div>
         <center><button class="btn btn-primary btn-lg" id="btn_more" style="width: 300px">더보기</button></center>
         <br/>
        
		</div>
		
    </div>
    
    
    <!-- /.container -->
    

    <div class="container">
    
        <hr>

     

    </div>
    <!-- /.container -->
</div>
</div>
</div>

    <!-- Bootstrap Core JavaScript -->

        <!-- BOOTSTRAP SCRIPTS -->
    <script src="/assets/js/bootstrap.min.js"></script>
    
    <!-- METISMENU SCRIPTS -->
    <script src="/assets/js/jquery.metisMenu.js"></script>
  
    <!-- MORRIS CHART SCRIPTS -->
    <script src="/assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="/assets/js/morris/morris.js"></script>
    

</body>
</html>