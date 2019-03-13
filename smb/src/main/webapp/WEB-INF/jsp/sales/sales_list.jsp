<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- ----------------------------------------------- -->
<!-- include Header -->
<!-- ----------------------------------------------- -->
<%@ include file="../common/header.jsp" %>
<!-- ----------------------------------------------- -->
<!-- ----------------------------------------------- -->

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
                		<button type="submit" id="fmBtnCostSalesList" class="btn btn-primary">��� ����Ʈ</button>
              		    <button type="submit" id="fmBtnSalesInsert" class="btn bg-maroon margin">������</button>
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

<!-- ----------------------------------------------- -->
<!-- include Footer -->
<!-- ----------------------------------------------- -->
<%@ include file="../common/footer.jsp" %>
<!-- ----------------------------------------------- -->
<!-- ----------------------------------------------- -->

<!-- page script -->
<script>
$(function () {
	$("#salesList").DataTable();
});

$('#fmBtnSalesReport').click(function() {window.location = "/smb/SalesReport.do?amt_year=2019";});
$('#fmBtnCostSalesList').click(function() {window.location = "/smb/CostSalesList.do"});  
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
