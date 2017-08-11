<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	var tf;
	for(var i=0;i<files.length;i++){
		if(file_ck(files[i].value)==false){
			alert("놉 : " + files[i].value);
			files[i].focus();
			return false;
		}
	}
	return true;
}
</script>
</head>
<body>
<form action="/file_reg.do" onsubmit="return doSubmit(this)" method="post" name="f" enctype="multipart/form-data" >
	<input type="file" name="pict" />
	<input type="file" name="pict" />
	<input type="file" name="pict" />
	<input type="submit" />
</form>
</body>
</html>