<%@page import="smb.common.dto.DtoBranch"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<body>
	<h2 class="box-title">Address Convert</h2>
          <div class="box box-info" style="text-align:center; margin-top:100px;"></div>
        
    								<!-- /.box-header -->
        <div class="box-body">
        <div class="row">
        <div class="col-md-6">
        <div class="form-group" style="text-align:center">
        <label>브랜드</label>
        <select style="width: 20%;" id="id-brand" name="select_brand" onchange="changeBrand()">
    		<option value="---" selected disabled></option>
    		<option value="BurgerKing">BurgerKing</option>
    		<option value="DropTop">DropTop</option>
    		<option value="QUIZNOS">QUIZNOS</option>
    	</select>
        </div>
        </div>
       	</div>
        </div>

    
                                          <!-- Main content -->
    <div class="box box-info" style="text-align:center; margin-top:100px;">
    <div class="box-header">
    <h3 class="box-title">Address Convert Table</h3>
    </div>
    </div>
            
            <!-- /.box-header -->
    <div class="box-body"> </div>
    
    <table>
    	<thead>
    		<tr>
    			<th>Branch_name</th>
    			<th>Full_addr</th>
    		</tr>
    	</thead>
    	<tbody id='pp'>
    	</tbody>
    </table>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
var list_BurgerKing = '${listToStringBurgerKing}';
var list_DropTop = '${listToStringDropTop}';

var listObj_Bur = JSON.parse(list_BurgerKing);
var listObj_Drop = JSON.parse(list_DropTop);


function button1_click(oldAddr,index) { 
	var inputNewAdd = prompt('새로운 주소를 입력하세요', oldAddr); 
	//alert(inputNewAdd);
	listBrand[index].full_addr = inputNewAdd;
	changeBrand();
	
 }
                
var listBrandToJavaBur = JSON.stringify(listObj_Bur);

jQuery.ajaxSettings.traditional = true;

$.ajax({
    type: 'post',
    dataType: 'json',
    data: {"item":listBrandToJavaBur},
    url: 'test.do',
    success : function(data){        

    	var result = data.json;
    }
});
 

function changeBrand(){
	
	var selectedBrand = document.getElementById("id-brand");
    var a = document.getElementById("pp");
	
    var tag = '';
    
    
    if(selectedBrand.options[selectedBrand.selectedIndex].value == "BurgerKing"){
    	listBrand = listObj_Bur;
    }
    else if(selectedBrand.options[selectedBrand.selectedIndex].value == "DropTop"){
    	listBrand = listObj_Drop;
    }
    
    
    for(var i=0; i<listBrand.length; i++){
    	//console.log('branch_name:'+listBrand[i].branch_name);
    	//console.log(listBrand[i].full_addr);
    	tag = tag + '<tr>' +
    				'<td>' + listBrand[i].branch_name + '</td>' +
    				'<td>' + listBrand[i].full_addr + '</td>' +
					'<td><button type="button" id="button1" onclick="button1_click(\''+listBrand[i].full_addr+'\','+i+');">수정</button></td>' + 
					'<td><button type="button" class="btn btn-block btn-default">정제</button></td>' +
				  '</tr>';
	
    }
    
    
    if(selectedBrand.options[selectedBrand.selectedIndex].value == "BurgerKing")
        a.innerHTML = tag;
    else if(selectedBrand.options[selectedBrand.selectedIndex].value == "DropTop")
        a.innerHTML = tag;
    else if(selectedBrand.options[selectedBrand.selectedIndex].value == "QUIZNOS")
        a.innerHTML = "<h1>퀴즈노스</h1>";
}
</script>

</html>