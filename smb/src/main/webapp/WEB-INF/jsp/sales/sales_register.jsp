<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>CNTT | GIS-MATCHING SYSTEM</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all-skins.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9a749ab366ad2be358f9cc9cc135906"></script>
	
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/menu.jsp" %>

<!-- Content Wrapper -->
<div class="content-wrapper">

	<section class="content-header">
		<h1>
			���� ���
			<small>Register</small>
		</h1>
	</section>

	<!-- Main content -->	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">SMB Sales Register</h3>
					</div>
					<!-- /.box-header -->
	
					<div class="box-body">	
						<div class="row">
							<form id="frmInsSales" name="frmInsSales" role="form">
							<div class="col-md-6">
								<div class="form-group">
									<label>�������</label>
									<select id="select_work" class="form-control select2" style="width: 100%;">
									<c:forEach items="${workList}" var="row">
										<option value="${row.work_id}">${row.work_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
								
								<div class="form-group">
									<label>�����ü</label>
									<select id="select_cmpy" class="form-control select2" style="width: 100%;">
									<c:forEach items="${cmpyList}" var="row">
										<option value="${row.cmpy_id}">${row.cmpy_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
								
								<div class="form-group">
									<label>�귣��</label>
									<select id="select_brand" class="form-control select2" style="width: 100%;">
									<c:forEach items="${brandList}" var="row">
										<option value="${row.brand_id}">${row.brand_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
							</div>
							
							<!-- /.col -->
							<div class="col-md-6">
								<div class="form-group">
									<label>����⵵</label>
									<select id="select_year" class="form-control select2" style="width: 100%;">
										<option value="2018">2018��</option>
										<option value="2019" selected="selected">2019��</option>
									</select>
								</div>
								<!-- /.form-group -->

								<div class="form-group">
									<label>�����</label>
									<select id="select_month" class="form-control select2" style="width: 100%;">
										<option value="01">1��</option>
										<option value="02">2��</option>
										<option value="03">3��</option>
										<option value="04">4��</option>
										<option value="05">5��</option>
										<option value="06">6��</option>
										<option value="07">7��</option>
										<option value="08">8��</option>
										<option value="09">9��</option>
										<option value="10">10��</option>
										<option value="11">11��</option>
										<option value="12">12��</option>
									</select>
								</div>
								<!-- /.form-group -->

								<div class="form-group">
									<label>����ȸ��</label>
									<select id="select_term" class="form-control select2" style="width: 100%;">
										<option value="1" selected="selected">1ȸ�� (1 ~ 15)</option>
										<option value="2">2ȸ�� (15 ~ 31)</option>
									</select>
								</div>
								<!-- /.form-group -->

								<div class="form-group">
									<!-- text input -->
									<div class="form-group">
										<label>����ݾ�</label>
										<input type="text" id="sales_money" class="form-control">
									</div>
									<div class="form-group">
										<label>���Աݾ�</label>
										<input type="text" id="amt_money" class="form-control">
									</div>
									<div class="form-group">
										<label>īī�� ���� �ݾ�</label>
										<input type="text" id="amt_kakao_money" class="form-control">
									</div>
									<div class="form-group">
										<label>�������</label>
										<input type="text" id="net_sales_money" class="form-control" disabled>
									</div>
									<div class="form-group">
										<label>����Ǽ�</label>
										<input type="text" id="perform_count" class="form-control">
									</div>
									<div class="form-group">
										<label>ȯ�ұݾ�</label>
										<input type="text" id="refund_money" class="form-control">
									</div>
								</div>
								<!-- /.form-group -->
							</div>
							<!-- /.col -->
						</form>
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
					
					<div class="box-footer">
                		<button type="submit" id="btn_cancel" class="btn btn-default">���</button>
                		<button type="submit" id="btn_insert" class="btn btn-info pull-right">����</button>
              		</div>
              		<!-- /.box-footer -->
					
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
	
</div>
<!-- /.Content Wrapper -->

</div>
<!-- /.Wrapper -->

<!-- jQuery 2.2.3 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<!-- Maks -->
<script src="${pageContext.request.contextPath}/js/jquery.mask.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.mask.min.js"></script>

<!-- page script -->
<script>
/**
 * �ݾ� ����ŷ ó��
 */
$(function () {
	$("input#sales_money").mask('000,000,000,000,000', {reverse:true});
	$("input#amt_money").mask('000,000,000,000,000', {reverse:true});
	$("input#amt_kakao_money").mask('000,000,000,000,000', {reverse:true});
	$("input#net_sales_money").mask('000,000,000,000,000', {reverse:true});
	$("input#perform_count").mask('000,000,000,000,000', {reverse:true});
	$("input#refund_money").mask('000,000,000,000,000', {reverse:true});
});

/**
 * �ݾ� ����ŷ ����
 */
function removeMask(target) {
	if(target == null) return 0;
	else return target.replace(/,/gi, '');
}


/**
 * ������ ���ϱ�
 */
$("input#sales_money").blur(function() {
	var sales_money = $("input#sales_money").val();
	var amt_money   = $("input#amt_money").val();
	$("input#net_sales_money").val(removeMask(sales_money) - removeMask(amt_money));
});
$("input#amt_money").blur(function() {
	$("input#sales_money").blur();
});


/**
 * Select Box
 */
$("#select_work").change(function() {
	var work_id = $("#select_work option:selected").val();
	if(work_id == "w0001" || work_id == "w0002") {
		$('#select_brand option[value=kakao]').attr('selected','selected');
	}
});


/**
 * �����ư Ŭ��
 */
$('#btn_insert').click(function() {
	
	// Invaid Check
	if($("input#sales_money").val()=="") {
		alert('����ݾ��� �Է��ϼ���');
		$("input#sales_money").focus();
		return ;
	} else if($("input#amt_money").val()=="") {
		alert('���Աݾ��� �Է��ϼ���');
		$("input#amt_money").focus();
		return ;
	} else if($("input#perform_count").val()=="") {
		alert('����Ǽ��� �Է��ϼ���');
		$("input#perform_count").focus();
		return ;
	} else if($("input#refund_money").val()=="") {
		alert('ȯ�ұݾ��� �Է��ϼ���');
		$("input#refund_money").focus();
		return ;
	}

	// Insert Data
	$.ajax({
		type : 'GET',
		data  : {work_id : $("#select_work option:selected").val(),
				 cmpy_id : $("#select_cmpy option:selected").val(),
				 brand_id : $("#select_brand option:selected").val(),
				 amt_year : $("#select_year option:selected").val(),
				 amt_month : $("#select_month option:selected").val(),
				 amt_term : $("#select_term option:selected").val(),
				 sales_money : removeMask($("input#sales_money").val()),
				 amt_money : removeMask($("input#amt_money").val()),
				 amt_kakao_money : removeMask($("input#amt_kakao_money").val()),
				 net_sales_money : removeMask($("input#net_sales_money").val()),
				 refund_money : removeMask($("input#refund_money").val()),
				 perform_count : removeMask($("input#perform_count").val())
				},
		dataType: "json",
		url : '/smb/insertSales.do',
		contentType : 'application/json; charset=UTF-8',
		error : function(ajaxResult) {
			alert('����: ������ �ۼ��ſ� ������ �ֽ��ϴ�.');
		},
		success : function(ajaxResult) {
			if(confirm("����Ǿ����ϴ�.\n�߰��� �Է��� �����Ͱ� �ֽ��ϱ�?")) {
				window.location = "/smb/insSales.do"
			} else {
				window.location = "/smb/initSales.do"
			}
		}
	}); 

	
});

/**
 * ��ҹ�ư Ŭ��
 */
$('#btn_cancel').click(function() {
	window.location = "/smb/initSales.do"	
});

</script>



</body>
</html>