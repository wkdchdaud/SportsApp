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
	
	System.out.println("리스트 사이즈 먼저 "+list.size());
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
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript">
    var nn;
    var totalInfo = new Object();
/* $(document).ready(function() {
        $('#nn').val(22);
    });  */     
    
      
      $(function() {
         
        $("#checkJson").click(function() {
           
          //사람 정보
          var AcaArray = new Array();
          <% for(int i=0; i<list.size(); i++){%>
        	  
	           
	          var AcaInfo = new Object();
	          
	          AcaInfo.Name = "<%=list.get(i).getAca_name()%>";
	          AcaInfo.Lat = <%=list.get(i).getAca_lat()%>;
	          AcaInfo.Lng = <%=list.get(i).getAca_lng()%>;
	
	             
	          AcaArray.push(AcaInfo.Name);
	          AcaArray.push(AcaInfo.Lat);
	          AcaArray.push(AcaInfo.Lng);
	          console.log(AcaInfo.Name)
	          console.log(AcaInfo.Lat)
	          console.log(AcaInfo.Lng)
	          
	        

          <%}%>
          
	          totalInfo.name = AcaArray;
          console.log(totalInfo.name);
          <%-- <% System.out.println("리스트 사이즈는= "+list.size());%>
           <% System.out.println("Lat= "+personInfo.Lat);%>
          <% System.out.println("Lng= "+personInfo.Lng);%>
 --%>
         
      
           

          var jsonInfo = JSON.stringify(totalInfo);
           console.log(jsonInfo); //브라우저 f12개발자 모드에서 confole로 확인 가능
          alert(jsonInfo);
     
        });
         
      });
       
      </script>          

</head>
<body>
<div id="map" style="width:100%;height:700px;"></div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=b34cca89fa889023148b105f661c797d&libraries=services"></script>
<script type="text/javascript">


    
    
    
var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
    MARKER_HEIGHT = 52, // 기본, 클릭 마커의 높이
    OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
    OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
    OVER_MARKER_WIDTH = 33, // 오버 마커의 너비
    OVER_MARKER_HEIGHT = 60, // 오버 마커의 높이
    OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
    OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
    SPRITE_MARKER_URL = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 스프라이트 마커 이미지 URL
    SPRITE_WIDTH = 24, // 스프라이트 이미지 너비
    SPRITE_HEIGHT = 35, // 스프라이트 이미지 높이
    SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

var markerImageSize = new daum.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
    markerOffset = new daum.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
    overMarkerSize = new daum.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
    overMarkerOffset = new daum.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
    spriteImageSize = new daum.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

<% System.out.println("리스트 사이즈는= "+list.size());%>
    
 <%

 	List<String> Addr1 = new ArrayList<String>();
 	List<String> Addr2 = new ArrayList<String>();
 	List<String> Name = new ArrayList<String>();
 	List<String> Visit = new ArrayList<String>();
  
/*  System.out.println("getAca_lat= "+list.get(0).getAca_lat());
 System.out.println("getAca_lat= "+list.get(1).getAca_lat());
 System.out.println("getAca_lat= "+list.get(2).getAca_lat());
 System.out.println("getAca_lng= "+list.get(0).getAca_lng());
 System.out.println("getAca_lng= "+list.get(1).getAca_lng());
 System.out.println("getAca_lng= "+list.get(2).getAca_lng()); */

 
	 for(int i=0; i<list.size(); i++){
		Addr1.add(i, list.get(i).getAca_lat());   
} 
	 for(int i=0; i<list.size(); i++){
		Addr2.add(i, list.get(i).getAca_lng());  
} 	 
	 for(int i=0; i<list.size(); i++){
		Name.add(i, list.get(i).getAca_name());  
} 
	 for(int i=0; i<list.size(); i++){
		Visit.add(i, list.get(i).getAca_visit());  
} 
	 
/*  System.out.println("Addr1 사이즈는= "+Addr1.size());
 	 System.out.println("Addr 본다= "+Addr1.get(0));
	 System.out.println("Addr 본다= "+Addr1.get(1));
	 System.out.println("Addr 본다= "+Addr1.get(2));
	 System.out.println("Addr 본다= "+Addr2.get(0));
	 System.out.println("Addr 본다= "+Addr2.get(1));
	 System.out.println("Addr 본다= "+Addr2.get(2));
	 System.out.println("Addr 본다= "+Name.get(0));
	 System.out.println("Addr 본다= "+Name.get(1));
	 System.out.println("Addr 본다= "+Name.get(2)); 

	 System.out.println("Visit 사이즈= "+Visit.size());
	 System.out.println("Visit 0은= "+Visit.get(0)); */
%>

var acaVisitList = [];

<%for (int i=0; i<Visit.size(); i++) {%>
	acaVisitList.push("<%=Visit.get(i)%>")

<%}%>


var acaNameList = [];

<%for(int i=0; i<Name.size(); i++){%>
	acaNameList.push("<%=Name.get(i)%>")
	
<%}%>



/* alert("acaNameList.pop(0020)"+acaNameList[0]);
alert("acaNameList.pop(1)"+acaNameList[1]);
alert("acaNameList.pop(2)"+acaNameList[2]); */
nn =  "dd"/* acaNameList.pop(1); */ //위에 nn에 jsonstring 넣고 지워보기

var positions = [  // 마커의 위치
	 <%
		for(int i=0; i<Addr1.size(); i++){ %>
	        new daum.maps.LatLng(<%=Addr1.get(i)%> , <%=Addr2.get(i)%>),
		<%}%>
	    ],
	    selectedMarker = null; //클릭한 마커를 담을 변수

/* alert("positions 사이즈2는 "+ positions.length);
 *///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
	

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = { 
        center: new daum.maps.LatLng(37.5420701, 126.730667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var c=0;
console.log("c먼저"+c);
// 지도 위에 마커를 표시합니다
for (var i = 0, len = positions.length; i < len; i++) {
/*     var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
        originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
        overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
        normalOrigin = new daum.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
        clickOrigin = new daum.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
        overOrigin = new daum.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표 */
        
    // 마커를 생성하고 지도위에 표시합니다
    addMarker(positions[i]);
        /* , normalOrigin, overOrigin, clickOrigin); */
        
        
c++;        
}
//for문 제대로 돌았는지 확인
console.log(c);

// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
function addMarker(position, normalOrigin, overOrigin, clickOrigin) {

    // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
    var normalImage = createMarkerImage(markerImageSize, markerOffset, normalOrigin),
        overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
        clickImage = createMarkerImage(markerImageSize, markerOffset, clickOrigin);
    
    // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: positions[i],
        image: normalImage
    });
    
    
    //marker.position 값이랑 list.position값 .equals로 비교해서 같으면 list.get(1) 가져오기
    
    
    
 // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
     var iwContent = '<div style="margin:5px; padding:5px; width:200px; height:150px">'
     +'<select class="input-sm" name="aca_visit" >'
     +'<option value = "1">미방문</option>'
     +'<option value = "2">방문</option>'
     +'<option value = "3">거래중</option>'
     +'<textarea class="input-sm" name="1" style="margin:1px; height:90px" value="학원 Comment"></textarea></div>'
     +'<center><input type="submit" style="width:60px; margin:5px; padding:2px; height:25px; font-size:12px" class="btn btn-primary" value="확인"></center>',

     
     /* var iwContent = '<div style="padding:5px;"><input type="text" id="nn" name="123" readonly="true" value="' + acaNameList[i] + '">'
     +'</div><div style="padding:4px;"><textarea name="1" value="학원 Comment"></textarea></div>', */
    
    
    
    
    // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });

    marker.normalImage = normalImage;
<%--  	for(var i=0; i<acaNameList.length; i++){%>
    var acaName = '<div style="padding:5px;"><input type="text" name="123" readonly="true" value="' + "<%=Name.get(0)%>" + '">'
    +'</div>'
    } --%>

        
    // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다

/* 	for(var i=0; i<acaNameList.length; i++)  {
    var acaName = '<div style="padding:5px;"><input type="text" name="123" readonly="true" value="' + acaNameList[i] + '">'
    +'</div>' */
    
    
    
    var contents = '<div class="panel panel-default2" "padding:5px;">'+acaNameList[i]+''
    +'</div>'  ;

    var contents2 = '<div class="panel panel-default3" "padding:5px;">'+acaNameList[i]+''
    +'</div>'  ;
    
    var contents3 = '<div class="panel panel-default4" "padding:5px;">'+acaNameList[i]+''
    +'</div>'  ;

    
    
    if (acaVisitList[i]=="1"){
    	dd=contents
    }
    else if
    	(acaVisitList[i]=="2"){
        	dd=contents2
    }
    else{
    	dd=contents3
    	
    }
    
 // 커스텀 오버레이를 생성합니다
    var customOverlay = new daum.maps.CustomOverlay({
        position: position,
        content: dd
    });
   
   //for문 괄호   /*  } */

    // 커스텀 오버레이를 지도에 표시합니다
    customOverlay.setMap(map);
    
    
//********************         mouseover, mouseout, click 함수 등록 ****************************
    
 // 마커에 mouseover 이벤트를 등록합니다.
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
	infowindow.close(map, marker);
    })
 
    // 마커에 click 이벤트를 등록합니다
    
    daum.maps.event.addListener(marker, 'click', function() {
    	$(dfdf).trigger("click");
	console.log(nn)


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
      
        if (selectedMarker !== null){
        	infowindow.close();
        }
      
        
        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 클릭 이미지로 변경합니다
        if (selectedMarker !== marker) {
        
			
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
function createMarkerImage(markerImageSize, offset, spriteOrigin) {
    var markerImage = new daum.maps.MarkerImage(
        SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
        markerImageSize, // 마커의 크기
        {
            offset: offset, // 마커 이미지에서의 기준 좌표
            spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
            spriteSize: spriteImageSize // 스프라이트 이미지의 크기
        }
    );
    
    return markerImage;
}



	

</script>
<a id="checkJson" style="cursor:pointer">확인</a>
<div style="padding:5px;"><input type="text" id="nn" name="123" readonly="true"></div>
<div style="padding:4px;"><textarea name="1" value="학원 Comment"></textarea></div>
</body>
</html>