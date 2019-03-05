<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>CNTT | GIS-MATCHING SYSTEM</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all-skins.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
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
			���� ����Ʈ
			<small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">�������</a></li>
			<li class="active">���⸮��Ʈ</li>
		</ol>
	</section>

	<!-- Main content -->	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">SMB Sales List</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="salesList" class="table table-bordered table-striped">
							<thead>
							<tr align="center">
								<th>������</th>
								<th>������</th>
								<th>�����ü</th>
								<th>�귣��</th>
								<th>�Ѹ���</th>
								<th>�Ѹ���</th>
								<th>������</th>
								<th>����Ǽ�</th>
								<th>����</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${salesList}" var="row">
							<tr align="center">
								<td>${row.amt_year}/${row.amt_month}</td>
								<td>${row.work_nm}</td>
								<td>${row.cmpy_nm}</td>
								<td>${row.brand_nm}</td>
								<td><fmt:formatNumber value="${row.sales_money}" pattern="#,###" /></td>
								<td><fmt:formatNumber value="${row.amt_money}" pattern="#,###" /></td>
								<td><fmt:formatNumber value="${row.net_sales_money}" pattern="#,###" /></td>
								<td><fmt:formatNumber value="${row.perform_count}" pattern="#,###" /></td>
								<td>
									<button type="submit" id="fmBtnUpdate" class="btn btn-primary" onclick="javascript:updateData('${row.idx}')">U</button>
									<button type="submit" id="fmBtnDelete" class="btn btn-primary" onclick="javascript:deleteData('${row.idx}')">D</button>
								</td>
							</tr>  
							</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->

					<div align="right" class="box-footer">
                		<button type="submit" id="fmBtnSalesReport" class="btn btn-primary">������ ����Ʈ</button>
                		<button type="submit" id="fmBtnSalesInsert" class="btn bg-maroon margin">���ȭ��</button>
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
	
</div><!-- /.Content Wrapper -->

</div>
<!-- /.Wrapper -->

<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>

<!-- page script -->
<script>
$(function () {
	$("#salesList").DataTable();
});

$('#fmBtnSalesReport').click(function() {window.location = "/smb/SalesReport.do?amt_year=2019";});
$('#fmBtnSalesInsert').click(function() {window.location = "/smb/SalesInsertForm.do"});  


/**
 * ������ ����
 */
function updateData(idx) {
	window.location = "/smb/SalesUpdateForm.do?idx=" + idx;	
}

/**
 * ������ ����
 */
function deleteData(idx) {
	
	if(!confirm("��¥ ���� �ҷ�??")) {
		return;
	}
	
	// Delete Data
	$.ajax({
		type : 'GET',
		data  : {idx : idx},
		dataType: "json",
		url : '/smb/SalesDelete.do',
		contentType : 'application/json; charset=UTF-8',
		error : function(ajaxResult) {
			alert('����: ������ �ۼ��ſ� ������ �ֽ��ϴ�.');
		},
		success : function(ajaxResult) {
			alert('���� ����');
			window.location = "/smb/SalesList.do"
		}
	});
}
</script>



</body>
</html>
