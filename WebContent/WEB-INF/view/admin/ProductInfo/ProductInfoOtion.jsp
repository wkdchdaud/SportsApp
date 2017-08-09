<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<script language="javascript">
function insertRowTest(){
var oTable=document.all["tt"];
var oRow=oTable.insertRow();
oRow.onmouseover=function(){tt.clickedRowIndex=this.rowIndex};

//alert(tt.clickedRowIndex);


var oCell=null;

oCell=oRow.insertCell();oCell.innerHTML="<input type='text' name=''>";
oCell=oRow.insertCell();oCell.innerHTML="Name추가";
oCell=oRow.insertCell();oCell.innerHTML="<input type='button' value='삭제' onclick='deleteRowTest();'>"
}
function deleteRowTest(){
//alert(tt.clickedRowIndex);


tt.index = 1;
alert(tt.index);
tt.deleteRow(tt.index);
}
</script>
</HEAD>

<BODY>
<form name="form1" method="post" action="">
<table border="1" id="tt">
<tr>
<td colspan="3" align="right">
<input type="button" value="추가" onclick="insertRowTest();">
</td>
</tr>
<tr>
<td><input type="text" name=""></td>
<td>Name</td>
<td> </td>
</tr>
</table>
</form>
</BODY>
</HTML>