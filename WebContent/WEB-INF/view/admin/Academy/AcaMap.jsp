<%@page import="java.util.ArrayList"%>
<%@page import="sports.com.dto.AcademyDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	List<AcademyDTO> list = (List<AcademyDTO>)request.getAttribute("list");
	if(list == null){
		list = new ArrayList<AcademyDTO>();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>학원 관리</title>
</head>
<body>
<div id="map" style="width:100%;height:400px;"></div>

    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=krscz5j_oZkrcI1dOWs6&callback=initMap"></script>
    <script type="text/javascript">
        var map = null;

        function initMap() {
            map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(37.55013056, 126.8434417),
                zoom: 12
            });
        }
    </script>
<br>
<%-- <%for(AcademyDTO academyDTO : list){ %>
	<%=academyDTO.getAca_no() %>&nbsp; <%=academyDTO.getAca_name() %></br>
<%} %> --%>
</body>
</html>