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

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>상세</title>

    <!-- Bootstrap Core CSS -->
    <link href="/assets2/product1/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/assets2/product1/css/small-business.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>


<table border="1" width="500px">
	
		<tr>
			<td width="200" align="center">제품이름</td>
			<td width="200" align="center">제품가격</td>
			<td width="200" align="center">제품내용</td>
		</tr>
		
	
		
		<tr>
		
			<td align="center">
			<%=CmmUtil.nvl(aDTO.getProd_name()) %></td>
			<td align="center"><%=CmmUtil.nvl(aDTO.getProd_price()) %></td>
			<td align="center"><%=CmmUtil.nvl(aDTO.getProd_contents()) %></td>
		</tr>
		
	
		
	</table>
           
<input type="button" value="삭제" OnClick="location.href='/admin/ProductInfo/ProductInfoDelete.do?prod_no1=<%=aDTO.getProd_no() %>'" />
<input type="button" value="수정" OnClick="location.href='/admin/ProductInfo/ProductInfoUpdateForm.do?prod_no1=<%=aDTO.getProd_no() %>'" />
<input type="button" value="목록" OnClick="location.href='/admin/ProductInfo/List.do' " />

<%-- <%
}
%>
		 --%>
		<div class="container">

        <!-- Heading Row -->
        <div class="row">
            <div class="col-md-8">
                <img class="img-responsive img-rounded" src="http://placehold.it/900x600" alt="">
            </div>
            <!-- /.col-md-8 -->
            <div class="col-md-4">
                <h1><%=CmmUtil.nvl(aDTO.getProd_name()) %></h1>
                <hr>
                <h2><p><%=CmmUtil.nvl(aDTO.getProd_price()) %></p></h2>
    
            </div>
            
            <section>
                <h1>선택옵션</h1>
                <table class="sit_ov_tbl">
                <colgroup>
                    <col class="grid_3">
                    <col>
                </colgroup>
                <tbody>
                <tr>
				<th><label for="it_option_1">컬러</label></th>
				<td><select id="it_option_1" class="it_option">
				<option value="">선택</option>
				<option value="빨강">빨강</option>
				<option value="파랑">파랑</option>
				</select>
				<th><label for="it_option_2">사이즈</label></th>
				<td><select id="it_option_2" class="it_option" disabled="disabled">
				<option value="">선택</option>
				<option value="S">S</option>
				<option value="M">M</option>
				<option value="L">L</option>
				</select>
				</td>
				</tr>
                </tbody>
                </table>
                
                
      
            </section>
            
             <hr>
                <a class="btn btn-primary btn-lg" href="#">주문하기</a>
                <input type="button" value="삭제" OnClick="location.href='/admin/ProductInfo/ProductInfoDelete.do?prod_no1=<%=aDTO.getProd_no() %>'" />
				<input type="button" value="수정" OnClick="location.href='/admin/ProductInfo/ProductInfoUpdateForm.do?prod_no1=<%=aDTO.getProd_no() %>'" />
				<input type="button" value="목록" OnClick="location.href='/admin/ProductInfo/List.do' " />
            <!-- /.col-md-4 -->
        </div>
        <!-- /.row -->

        <hr>

        <!-- Call to Action Well -->
        <div class="row">
            <div class="col-lg-12">
                <div class="well text-center">
                           	상품정보 
                </div>
         
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-4">
                <h2><%=CmmUtil.nvl(aDTO.getProd_name()) %></h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-4">
                <h2>Heading 2</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-4">
                <h2>Heading 3</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-4 -->
        </div>
        <!-- /.row -->

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright © Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    
    <!-- /.container -->

    <!-- jQuery -->
    <script src="/assets2/product1/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/assets2/product1/js/bootstrap.min.js"></script>
    <%
}
%>
</body>
</html>