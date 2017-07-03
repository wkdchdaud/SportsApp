<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert 장총명 here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	    <link rel="stylesheet" href="assets/css/datepicker.css">
	<script>
		$(function() {
			$(".datepicker").datepicker({
				dateFormat : "yymmdd",
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
				dayNamesMin : ['일','월','화','수','목','금','토'],
				changeMonth : true,
				changeYear : true,
				showMonthAfterYear : true,
			});
		});
	</script>
</head>
<body>
<input type="text" class="datepicker" />
<!-- asdoji -->
</body>
</html>