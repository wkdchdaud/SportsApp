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
		//화면 온로드후 실행
		$(function(){
		
		//전역변수로 cnt 값 6 설정
		var cnt = 6;
			
		var price = '';	//셀렉트박스값을 가져옴 all, lowprice, highrprice
		var name= '';	//인풋 검색 서취값 가져옴
		
		//더보기 버튼 구현 시작 
		$("#btn_more").add("#as").click(function(){
			alert("더보기 시작113S");
			alert(cnt);
			$.ajax({
				url : "/admin/ProductInfo/readMore.do",
				method : "post",
				data : {
					'cnt' : cnt,
					'price': price
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
		
		
		
		$("#Search").keyup(function(){
			price=null;
			name=null;
			cnt = 6;
			price = $("#SearchSelect").val();
			name= $('#Search').val();
			if(name==''){
				name= 'all_select';
			}
			
			if(price=='all'){ //만약 셀렉트value 값이 all이면
				
				$('#menu_list').html(null);
			  	$("#as").html("<center><button class='btn btn-primary btn-lg' id='btn_more' style='width: 300px'>더보기</button></center>");
			
					$.ajax({//아작스 실행
						url : "/admin/ProductInfo/allSearch.do",
						method : "post",
						data : {
							'price' : price,
							'name' : name,	
							'cnt' : cnt
						},
						dataType : "json",
						success : function(data){//성공하면 함수실행data 키벨류값
			 
							console.log(data);
							var contents = "";
							var cnt=6;

								$.each(data, function(key,value){
									contents += "<div class='col-sm-4 col-lg-4 col-md-4'>";
									contents += "<div class='thumbnail'>";
									contents += "<img src='http://placehold.it/500x500' alt=''>";
									contents += "<div class='caption'>";
									contents += "<h4 class='pull-right'>" + value.prod_price + "</h4>";
									contents += "<h4> <a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1=" + value.prod_no + "'>" + value.prod_name + "</a></h4>";
									contents += "</div>";
									contents += "<div class='ratings'>";
									contents += "</div>";
									contents += "</div>";
									contents += "</div>";
									cnt++;
							});
								
							$('#menu_list').html(contents);
							if ((data).length<6) {
								$('#btn_more').remove();
							}
						}
					});//ok
				
				}		
				else if(price=='lowprice'){
			  //만약 select박스 벨류값이 lowprice라면
				$('#menu_list').html(null);
			  	$("#as").html("<center><button class='btn btn-primary btn-lg' id='btn_more' style='width: 300px'>더보기</button></center>");
				$.ajax({//아작스 실행
					url : "/admin/ProductInfo/lowpriceSearch.do",
					method : "post",
					data : {
						'price' : price,
						'name' : name,
						'cnt' : cnt
					},
					dataType : "json",
					success : function(data){//성공하면 함수실행data 키벨류값
						console.log(data);
						var contents = "";
						var cnt=6;
							$.each(data, function(key,value){
								contents += "<div class='col-sm-4 col-lg-4 col-md-4'>";
								contents += "<div class='thumbnail'>";
								contents += "<img src='http://placehold.it/500x500' alt=''>";
								contents += "<div class='caption'>";
								contents += "<h4 class='pull-right'>" + value.prod_price + "</h4>";
								contents += "<h4> <a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1=" + value.prod_no + "'>" + value.prod_name + "</a></h4>";
								contents += "</div>";
								contents += "<div class='ratings'>";
								contents += "</div>";
								contents += "</div>";
								contents += "</div>";
								cnt++;
						});
						$('#menu_list').html(contents);
						if ((data).length<6) {
							$('#btn_more').remove();
						}
					}
				});//ok
			}
			else if(price=='highprice'){
				$('#menu_list').html(null);
			  	$("#as").html("<center><button class='btn btn-primary btn-lg' id='btn_more' style='width: 300px'>더보기</button></center>");
					$.ajax({//아작스 실행
					
						url : "/admin/ProductInfo/highpriceSearch.do",
						method : "post",
						data : {
							'price' : price,
							'name' : name,
							'cnt' : cnt
						},
						dataType : "json",
						success : function(data){//성공하면 함수실행data 키벨류값
							console.log(data);
							var contents = "";
							var cnt=6;
							$.each(data, function(key,value){
								contents += "<div class='col-sm-4 col-lg-4 col-md-4'>";
								contents += "<div class='thumbnail'>";
								contents += "<img src='http://placehold.it/500x500' alt=''>";
								contents += "<div class='caption'>";
								contents += "<h4 class='pull-right'>" + value.prod_price + "</h4>";
								contents += "<h4> <a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1=" + value.prod_no + "'>" + value.prod_name + "</a></h4>";
								contents += "</div>";
								contents += "<div class='ratings'>";
								contents += "</div>";
								contents += "</div>";
								contents += "</div>";
								cnt++;
								
							});
							$('#menu_list').html(contents);
							if ((data).length<6) {
								$('#btn_more').remove();
							}
						}
					});
			}
		});
		
		
		
		//select 값 high, all , lowprice 바뀜에 따라 실행하는 아작스 시작
		$("#SearchSelect").change(function(){ //셀렉트 값이 바뀌면 실행됨
			price=null;
			name=null;
			cnt=6;
			price = $("#SearchSelect").val();
			name= $('#Search').val();
			if(name==''){
				name= 'all_select';
			}
		
			if(price=='all'){ //만약 셀렉트value 값이 all이면
				$('#menu_list').html(null);
			  	$("#as").html("<center><button class='btn btn-primary btn-lg' id='btn_more' style='width: 300px'>더보기</button></center>");
					$.ajax({//아작스 실행
						url : "/admin/ProductInfo/allSearch.do",
						method : "post",
						data : {
							'price' : price,
							'name' : name,
							'cnt' : cnt
						},
						dataType : "json",
						success : function(data){//성공하면 함수실행data 키벨류값
			 
							console.log(data);
							var contents = "";
							var cnt=6;
								$.each(data, function(key,value){
									contents += "<div class='col-sm-4 col-lg-4 col-md-4'>";
									contents += "<div class='thumbnail'>";
									contents += "<img src='http://placehold.it/500x500' alt=''>";
									contents += "<div class='caption'>";
									contents += "<h4 class='pull-right'>" + value.prod_price + "</h4>";
									contents += "<h4> <a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1=" + value.prod_no + "'>" + value.prod_name + "</a></h4>";
									contents += "</div>";
									contents += "<div class='ratings'>";
									contents += "</div>";
									contents += "</div>";
									contents += "</div>";
									cnt++;
							});
								
							$('#menu_list').html(contents);
							if ((data).length<6) {
								$('#btn_more').remove();
							}
						}
					});//ok
				
				}		
				else if(price=='lowprice'){
			  //만약 select박스 벨류값이 lowprice라면
				$('#menu_list').html(null);
			  	$("#as").html("<center><button class='btn btn-primary btn-lg' id='btn_more' style='width: 300px'>더보기</button></center>");
				$.ajax({//아작스 실행
					url : "/admin/ProductInfo/lowpriceSearch.do",
					method : "post",
					data : {
						'price' : price,
						'name' : name,
						'cnt' : cnt
					},
					dataType : "json",
					success : function(data){//성공하면 함수실행data 키벨류값
						console.log(data);
						var contents = "";
						var cnt=6;
							$.each(data, function(key,value){
								contents += "<div class='col-sm-4 col-lg-4 col-md-4'>";
								contents += "<div class='thumbnail'>";
								contents += "<img src='http://placehold.it/500x500' alt=''>";
								contents += "<div class='caption'>";
								contents += "<h4 class='pull-right'>" + value.prod_price + "</h4>";
								contents += "<h4> <a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1=" + value.prod_no + "'>" + value.prod_name + "</a></h4>";
								contents += "</div>";
								contents += "<div class='ratings'>";
								contents += "</div>";
								contents += "</div>";
								contents += "</div>";
								cnt++;
						});
						$('#menu_list').html(contents);
						if ((data).length<6) {
							$('#btn_more').remove();
						}
					}
				});//ok


			}
			else if(price=='highprice'){
				$('#menu_list').html(null);
			  	$("#as").html("<center><button class='btn btn-primary btn-lg' id='btn_more' style='width: 300px'>더보기</button></center>");

					$.ajax({//아작스 실행
					
						url : "/admin/ProductInfo/highpriceSearch.do",
						method : "post",
						data : {
							'price' : price,
							'name' : name,
							'cnt' : cnt
						},
						dataType : "json",
						success : function(data){//성공하면 함수실행data 키벨류값
							console.log(data);
							var contents = "";
							var cnt=6;
							$.each(data, function(key,value){
								contents += "<div class='col-sm-4 col-lg-4 col-md-4'>";
								contents += "<div class='thumbnail'>";
								contents += "<img src='http://placehold.it/500x500' alt=''>";
								contents += "<div class='caption'>";
								contents += "<h4 class='pull-right'>" + value.prod_price + "</h4>";
								contents += "<h4> <a href='/admin/ProductInfo/ProductInfoDetail.do?prod_no1=" + value.prod_no + "'>" + value.prod_name + "</a></h4>";
								contents += "</div>";
								contents += "<div class='ratings'>";
								contents += "</div>";
								contents += "</div>";
								contents += "</div>";
								cnt++;
								
							});
							$('#menu_list').html(contents);
							if ((data).length<6) {
								$('#btn_more').remove();
							}
						}
					});
			}
		});
		//select 값 high, all , lowprice 바뀜에 따라 실행하는 아작스 끝
		
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
<!-- 검색 -->

       <div class="container">


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
                               <img src="http://placehold.it/300x300" alt="">
                          
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
        
        <div id="as">
         <center><button class="btn btn-primary btn-lg" id="btn_more" style="width: 300px">더보기</button></center>
        </div>
        
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