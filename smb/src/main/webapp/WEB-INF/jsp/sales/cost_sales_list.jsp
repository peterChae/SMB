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
			원가 리스트
			<small>List</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">매출관리</a></li>
			<li class="active">원가리스트</li>
		</ol>
	</section>

	<!-- Main content -->	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">SMB Cost List</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="costSalesList" class="table table-bordered table-striped">
							<thead>
							<tr align="center">
								<th>지급년월</th>
								<th>원가</th>
								<th>금액</th>
								<th>삭제</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${costSalesList}" var="row">
							<tr align="center">
								<td>${row.amt_year}/${row.amt_month}</td>
								<td>${row.cost_cate_nm} / ${row.cost_nm}</td>
								<td><fmt:formatNumber value="${row.cost_money}" pattern="#,###" /></td>
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
                		<button type="submit" id="fmBtnSalesReport" class="btn btn-primary">세일즈 리포트</button>
                		<button type="submit" id="fmBtnSalesList" class="btn btn-primary">매출 리스트</button>
                		<button type="submit" id="fmBtnCostSalesInsert" class="btn bg-maroon margin">비용등록</button>
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
<!-- /.content wrapper -->
	
<!-- ----------------------------------------------- -->
<!-- include Footer -->
<!-- ----------------------------------------------- -->
<%@ include file="../common/footer.jsp" %>
<!-- ----------------------------------------------- -->
<!-- ----------------------------------------------- -->

<!-- page script -->
<script>
$(function () {
	$("#costSalesList").DataTable();
});

$('#fmBtnSalesReport').click(function() {window.location = "/smb/SalesReport.do?amt_year=2019";});
$('#fmBtnSalesList').click(function() {window.location = "/smb/SalesList.do"});  
$('#fmBtnCostSalesInsert').click(function() {window.location = "/smb/CostSalesInsertForm.do"});  


/**
 * 데이터 수정
 */
function updateData(idx) {
	window.location = "/smb/CostSalesUpdateForm.do?idx=" + idx;	
}

/**
 * 데이터 삭제
 */
function deleteData(idx) {
	
	if(!confirm("진짜 삭제 할래??")) {
		return;
	}
	
	// Delete Data
	$.ajax({
		type : 'GET',
		data  : {idx : idx},
		dataType: "json",
		url : '/smb/CostSalesDelete.do',
		contentType : 'application/json; charset=UTF-8',
		error : function(ajaxResult) {
			alert('에러: 데이터 송수신에 문제가 있습니다.');
		},
		success : function(ajaxResult) {
			alert('삭제 ㅇㅋ');
			window.location = "/smb/CostSalesList.do"
		}
	});
}
</script>

</body>
</html>
