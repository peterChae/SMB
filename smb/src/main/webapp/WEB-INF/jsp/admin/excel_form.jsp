<%@page contentType="text/html;charset=euc-kr"%>
<html>
<script>  
function checkForm() {   
 if (upload.file1.value == "") {   
  alert("������ ���ε����ּ���.");   
  return false;   
 }  else if(!checkFileType(upload.file1.value)) {   
  alert("�������ϸ� ���ε� ���ּ���.");   
  return false;   
 }   
  document.upload.submit();
}   
function checkFileType(filePath){   
  
 var fileLen = filePath.length;   
 var fileFormat = filePath.substring(fileLen - 5);   
 fileFormatfileFormat = fileFormat.toLowerCase();   
  
 if (fileFormat == ".xlsx"){   return true;    
 }   else{     return false;     }   
}   
</script>  
 
<body>
 <div class="box box-info" style="text-align:center; margin-top:300px;">
           <div id="box" style="width:200%, height:200%;"></div>
            <div class="box-header with-border">
              <h1 class="box-title">Welcome New Brand</h1>
            </div>
<form action="excel_insert.do" name="upload" method="GET" enctype="multipart/form-data">
<td><input type="file" name="file1" size="20" align="absmiddle" />    </td>
<td><a onclick="checkForm();" style="cursor:hand"> [����] </a></td>
</form>
</body>
 
</html>


