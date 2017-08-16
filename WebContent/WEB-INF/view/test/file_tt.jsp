<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/assets/js/jquery-1.10.2.js"></script>
<script type="text/javascript">
function file_ck(fileNm) {
	if (fileNm != "") {
	    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
	    if (ext == "jpeg" || ext == "gif" || ext == "jpg" || ext == "png") {
	        return true;
	    }else{
	        return false;
	    }
	}
}


function doSubmit(f) {
	var files = f.pict;
	for(var i=0;i<files.length;i++){
		if(file_ck(files[i].value)==false){
			alert("놉 : " + files[i].value);
			files[i].focus();
			return false;
		}
	}
	return true;
}

function add_file() {
	$('#file_area').append("<div id='file_area' name='file_area'><input type='file' name='pict' /></div>");
}

function del_file() {
	var areas = document.getElementsByName("file_area");
	if(areas.length > 1){
		var parent = document.getElementById("file_areas");
		areas[areas.length-1].remove(areas[areas.length-1]);
	}else{
		alert("못지움 ㅅㄱ!");
	}
}
</script>
</head>
<body>
<form action="/file_reg.do" onsubmit="return doSubmit(this)" method="post" name="f" enctype="multipart/form-data" >
	<div id="file_areas">
		<div id="file_area" name="file_area">
			<input type="file" name="pict" />
		</div>
		
		<div id="file_area" name="file_area">
			<input type="file" name="pict" />
		</div>
		
		<div id="file_area" name="file_area">
			<input type="file" name="pict" />
		</div>
	</div>
	<br/>
	<input type="submit" />
	<input type="button" value="추가" onclick="add_file()"/>
	<input type="button" value="제거" onclick="del_file()"/>
</form>
</body>
</html>