<%@page import="java.util.ArrayList"%>
<%@page import="sports.com.dto.AcademyDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	List<AcademyDTO> list = (List<AcademyDTO>)request.getAttribute("list");
System.out.println("리스트는1= "+list.get(0).getAca_lat());

	if(list == null){
		list = new ArrayList<AcademyDTO>();
	}
	String aca_name;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>학원 밀집도 확인</title>
    
    
    	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
   
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    
</head>
<body>
<div id="map" style="width:100%;height:700px;"></div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=b34cca89fa889023148b105f661c797d&libraries=services"></script>
<script type="text/javascript">
var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
    MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
    OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
    OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
    OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
    OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
    OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
    OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
    SPRITE_MARKER_URL = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
    SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
    SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
    SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

var markerSize = new daum.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
    markerOffset = new daum.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
    overMarkerSize = new daum.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
    overMarkerOffset = new daum.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
    spriteImageSize = new daum.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

<% System.out.println("리스트 사이즈는= "+list.size());%>
    
 <%

 	List<String> Addr1 = new ArrayList<String>();
 	List<String> Addr2 = new ArrayList<String>();
 	List<String> Name = new ArrayList<String>();
  
 System.out.println("Addr 사이즈는= "+Addr1.size());
 System.out.println("getAca_lat= "+list.get(0).getAca_lat());
 System.out.println("getAca_lat= "+list.get(1).getAca_lat());
 System.out.println("getAca_lat= "+list.get(2).getAca_lat());
 System.out.println("getAca_lng= "+list.get(0).getAca_lng());
 System.out.println("getAca_lng= "+list.get(1).getAca_lng());
 System.out.println("getAca_lng= "+list.get(2).getAca_lng());

 
	 for(int i=0; i<list.size(); i++){
		Addr1.add(i, list.get(i).getAca_lat());  
} 
	 for(int i=0; i<list.size(); i++){
		Addr2.add(i, list.get(i).getAca_lng());  
} 	 
	 for(int i=0; i<list.size(); i++){
		Name.add(i, list.get(i).getAca_name());  
} 
	 
	 System.out.println("Addr 본다= "+Addr1.get(0));
	 System.out.println("Addr 본다= "+Addr1.get(1));
	 System.out.println("Addr 본다= "+Addr1.get(2));
	 System.out.println("Addr 본다= "+Addr2.get(0));
	 System.out.println("Addr 본다= "+Addr2.get(1));
	 System.out.println("Addr 본다= "+Addr2.get(2));
	 System.out.println("Addr 본다= "+Name.get(0));
	 System.out.println("Addr 본다= "+Name.get(1));
	 System.out.println("Addr 본다= "+Name.get(2));

%>
var positions = [  // 마커의 위치
 <%
	for(int i=0; i<Addr1.size(); i++){ %>
        new daum.maps.LatLng(<%=Addr1.get(i)%> , <%=Addr2.get(i)%>),
	<%}%>
    ],
    selectedMarker = null; //클릭한 마커를 담을 변수

    
    
    
    
    //날려버려 씨빨럼아
<%--   var aca_name =  [{
	<%
	for(int i=0; i<Name.size(); i++){ %>
	new aca_name(<%=Name.get(i)%>),
	<%}%>}]   --%>
    
	

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
}

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도 위에 마커를 표시합니다
for (var i = 0, len = positions.length; i < len; i++) {
    var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
        originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
        overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
        normalOrigin = new daum.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
        clickOrigin = new daum.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
        overOrigin = new daum.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
        
    // 마커를 생성하고 지도위에 표시합니다
    addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
        
        
        
        // 일단 남겨놓기
	<%-- <%if (positions[i].equals(list.get(i).getAca_lat,list.get(i).getAca_lng)){
			System.out.println("같겠지");
	}else{
			System.out.println("설마 다르냐");
		
	}%> --%>
}



// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
function addMarker(position, normalOrigin, overOrigin, clickOrigin) {

    // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
    var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
        overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
        clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
    
    // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: position,
        image: normalImage
    });
    
    
    //marker.position 값이랑 list.position값 .equals로 비교해서 같으면 list.get(1) 가져오기
    
    
    
 // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
     var iwContent = '<div style="padding:5px;"><input type="text" name="123"></div>',
    
    
    
    
    // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });


    
    
    // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
    marker.normalImage = normalImage;

    
    
    
//********************         mouseover, mouseout, click 함수 등록 ****************************
    
 // 마커에 mouseover 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'mouseover', function() {

    	

    	
        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 오버 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {
            marker.setImage(overImage);

        }
    });

    // 마커에 mouseout 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'mouseout', function() {

        // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 기본 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {
            marker.setImage(normalImage);
        }
    });

    
    //map을 클릭하면 열려있는 infowindow가 닫힌다.
    daum.maps.event.addListener(map, 'click', function() {
	infowindow.close(map,marker);
	alert(map.value);
    })
 
    // 마커에 click 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
	


    	/* 
    	if (selectedMarker == marker){
    		
    	} */
        /* if (selectedMarker!=null) {
        	alert(marker);
        	alert(map);
        	infowindow.close(map,marker);
        	}
        else{
        	alert("d") 
        	
        	
        }*/
    	
        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 클릭 이미지로 변경합니다
        if (selectedMarker !== marker) {
        
        	//selectedMarker가 marker가 아니면
			
            // 클릭된 마커 객체가 null이 아니면
            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
        	
            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
            marker.setImage(clickImage);
            

        }
        
      
            	
/*  for (var i = 0, len = positions.length; i < len; i++) { 
    if (positions[i].equals(list.get(i).getAca_lat,list.get(i).getAca_lng))
    	System.out.println("d");
    	} */
    			 
    			 
    			 
        infowindow.open(map, marker);  

        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
        selectedMarker = marker;
        /* alert("marker는 "+marker)
        alert("selectedMarker는 "+selectedMarker) */
    });
}

//***********************************************************************************


// MakrerImage 객체를 생성하여 반환하는 함수입니다
function createMarkerImage(markerSize, offset, spriteOrigin) {
    var markerImage = new daum.maps.MarkerImage(
        SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
        markerSize, // 마커의 크기
        {
            offset: offset, // 마커 이미지에서의 기준 좌표
            spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
            spriteSize: spriteImageSize // 스프라이트 이미지의 크기
        }
    );
    
    return markerImage;
}
</script>
</body>
</html>