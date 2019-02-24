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
							<div class="col-md-6">
								<div class="form-group">
									<label>�������</label>
									<select id="select_work" class="form-control select2" style="width: 100%;">
									<c:forEach items="${workList}" var="row">
										<option value="${row.work_id}" selected="selected">${row.work_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
								
								<div class="form-group">
									<label>�����ü</label>
									<select id="select_cmpy" class="form-control select2" style="width: 100%;">
									<c:forEach items="${cmpyList}" var="row">
										<option value="${row.cmpy_id}" selected="selected">${row.cmpy_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
								
								<div class="form-group">
									<label>�귣��</label>
									<select id="select_brand" class="form-control select2" style="width: 100%;">
									<c:forEach items="${brandList}" var="row">
										<option value="${row.brand_id}" selected="selected">${row.brand_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
							</div>
							
							<!-- /.col -->
							<div class="col-md-6">
								<div class="form-group">
									<form role="form">
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
									
									</form>
								</div>
								<!-- /.form-group -->
							</div>
							<!-- /.col -->
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
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
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
	$("input#net_sales_money").mask('000,000,000,000,000', {reverse:true});
	$("input#perform_count").mask('000,000,000,000,000', {reverse:true});
	$("input#refund_money").mask('000,000,000,000,000', {reverse:true});
});


/**
 * ������ ���ϱ�
 */
$("input#sales_money").blur(function() {
	var sales_money = $("input#sales_money").val();
	var amt_money   = $("input#amt_money").val();
	$("input#net_sales_money").val(sales_money.replace(/,/gi, '') - amt_money.replace(/,/gi, ''));
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
		$("select_brand").val("KAKAO");
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
	
	
});
</script>



</body>
</html>
