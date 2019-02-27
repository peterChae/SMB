<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<title>CNTT | GIS-MATCHING SYSTEM</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all-skins.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9a749ab366ad2be358f9cc9cc135906"></script>
	
	<style>
		report_title {
			font-weight: bold;
			color: white;
		}
		total_title {
			font-weight: bold;
			color: black;
		}
	</style>
	
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/menu.jsp" %>

<!-- Content Wrapper -->
<div class="content-wrapper">

	<section class="content-header">
		<h1>
			세일즈리포트 
			<small>통계</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">매출관리</a></li>
			<li class="active">세일즈리포트</li>
		</ol>
	</section>

	<!-- Main content -->	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs pull-right">
						<li class="active"><a href="#sales-list" data-toggle="tab">List</a></li>
						<li><a href="#sales-chart" data-toggle="tab">Chart</a></li>
						<li class="pull-left header"><i class="fa fa-inbox"></i> SMB Sales Report</li>
					</ul>
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="sales-list" style="position: relative;">
							<!-- /.box-header -->
							<div class="box-body">
								<table id="salesList" class="table">
									<tr align="center" bgcolor="#0070C0">
										<td><report_title>업무명</report_title></td>
										<td width="7%"><report_title>1월</report_title></td>
										<td width="7%"><report_title>2월</report_title></td>
										<td width="7%"><report_title>3월</report_title></td>
										<td width="7%"><report_title>4월</report_title></td>
										<td width="7%"><report_title>5월</report_title></td>
										<td width="7%"><report_title>6월</report_title></td>
										<td width="7%"><report_title>7월</report_title></td>
										<td width="7%"><report_title>8월</report_title></td>
										<td width="7%"><report_title>9월</report_title></td>
										<td width="7%"><report_title>10월</report_title></td>
										<td width="7%"><report_title>11월</report_title></td>
										<td width="7%"><report_title>12월</report_title></td>
									</tr>
									<c:forEach items="${salesReport}" var="row">
									
										<c:set var="work_id" value="${row.work_id}" scope="session"/>
										<c:choose>
											<c:when test="${work_id eq 'total'}">
												<tr align="center" bgcolor="#ffff00">
													<td><total_title>합계</total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_1}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_2}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_3}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_4}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_5}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_6}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_7}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_8}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_9}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_10}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_11}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_12}" pattern="#,###" /></total_title></td>
													</td>
												</tr>  
											</c:when>
											<c:otherwise>
												<tr align="center">
													<td>${row.work_nm}</td>
													<td><fmt:formatNumber value="${row.sales_1}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_2}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_3}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_4}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_5}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_6}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_7}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_8}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_9}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_10}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_11}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_12}" pattern="#,###" /></td>
													</td>
												</tr>  
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->						
						</div>
						<div class="chart tab-pane" id="sales-chart" style="position: relative;">
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
					

		<div class="row">
			<div class="col-xs-12">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs pull-right">
						<li class="active"><a href="#sales-company-list" data-toggle="tab">List</a></li>
						<li><a href="#sales-company-chart" data-toggle="tab">Chart</a></li>
						<li class="pull-left header"><i class="fa fa-inbox"></i> 수행업체별 실적</li>
					</ul>
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="sales-company-list" style="position: relative;">
							<!-- /.box-header -->
							<div class="box-body">
								<table id="salesList" class="table">
									<tr align="center" bgcolor="#0070C0">
										<td><report_title>수행업체</report_title></td>
										<td width="7%"><report_title>1월</report_title></td>
										<td width="7%"><report_title>2월</report_title></td>
										<td width="7%"><report_title>3월</report_title></td>
										<td width="7%"><report_title>4월</report_title></td>
										<td width="7%"><report_title>5월</report_title></td>
										<td width="7%"><report_title>6월</report_title></td>
										<td width="7%"><report_title>7월</report_title></td>
										<td width="7%"><report_title>8월</report_title></td>
										<td width="7%"><report_title>9월</report_title></td>
										<td width="7%"><report_title>10월</report_title></td>
										<td width="7%"><report_title>11월</report_title></td>
										<td width="7%"><report_title>12월</report_title></td>
									</tr>
									<c:forEach items="${salesReport_company}" var="row">
									
										<c:set var="cmpy_id" value="${row.cmpy_id}" scope="session"/>
										<c:choose>
											<c:when test="${cmpy_id eq 'total'}">
												<tr align="center" bgcolor="#ffff00">
													<td><total_title>합계</total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_1}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_2}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_3}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_4}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_5}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_6}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_7}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_8}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_9}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_10}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_11}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_12}" pattern="#,###" /></total_title></td>
													</td>
												</tr>  
											</c:when>
											<c:otherwise>
												<tr align="center">
													<td>${row.cmpy_nm}</td>
													<td><fmt:formatNumber value="${row.sales_1}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_2}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_3}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_4}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_5}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_6}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_7}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_8}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_9}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_10}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_11}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_12}" pattern="#,###" /></td>
													</td>
												</tr>  
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<div class="chart tab-pane" id="sales-company-chart" style="position: relative;">
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						</div>
					</div>							
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		

		<div class="row">
			<div class="col-xs-12">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs pull-right">
						<li class="active"><a href="#sales-brand-list" data-toggle="tab">List</a></li>
						<li><a href="#sales-brand-chart" data-toggle="tab">Chart</a></li>
						<li class="pull-left header"><i class="fa fa-inbox"></i> 브랜드별 실적</li>
					</ul>
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="sales-brand-list" style="position: relative;">
							<!-- /.box-header -->
							<div class="box-body">
								<table id="salesList" class="table">
									<tr align="center" bgcolor="#0070C0">
										<td><report_title>브랜드</report_title></td>
										<td width="7%"><report_title>1월</report_title></td>
										<td width="7%"><report_title>2월</report_title></td>
										<td width="7%"><report_title>3월</report_title></td>
										<td width="7%"><report_title>4월</report_title></td>
										<td width="7%"><report_title>5월</report_title></td>
										<td width="7%"><report_title>6월</report_title></td>
										<td width="7%"><report_title>7월</report_title></td>
										<td width="7%"><report_title>8월</report_title></td>
										<td width="7%"><report_title>9월</report_title></td>
										<td width="7%"><report_title>10월</report_title></td>
										<td width="7%"><report_title>11월</report_title></td>
										<td width="7%"><report_title>12월</report_title></td>
									</tr>
									<c:forEach items="${salesReport_brand}" var="row">
									
										<c:set var="brand_id" value="${row.brand_id}" scope="session"/>
										<c:choose>
											<c:when test="${brand_id eq 'total'}">
												<tr align="center" bgcolor="#ffff00">
													<td><total_title>합계</total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_1}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_2}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_3}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_4}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_5}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_6}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_7}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_8}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_9}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_10}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_11}" pattern="#,###" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_12}" pattern="#,###" /></total_title></td>
													</td>
												</tr>  
											</c:when>
											<c:otherwise>
												<tr align="center">
													<td>${row.brand_nm}</td>
													<td><fmt:formatNumber value="${row.sales_1}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_2}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_3}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_4}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_5}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_6}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_7}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_8}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_9}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_10}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_11}" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${row.sales_12}" pattern="#,###" /></td>
													</td>
												</tr>  
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->

						</div>
						<div class="chart tab-pane" id="sales-brand-chart" style="position: relative;">
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						<!-- SalesReport Chart -->
						</div>	
					</div>
					
					<div align="right" class="box-footer">
                		<button type="submit" id="fmBtnSalesInsert" class="btn bg-maroon margin">조회화면</button>
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
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>


<script>
$('#fmBtnSalesInsert').click(function() {window.location = "/smb/SalesList.do"});
</script>

</body>
</html>
