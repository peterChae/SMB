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
	
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all-skins.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
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
						<li class="active"><a href="#sales-work-list" data-toggle="tab">List</a></li>
						<li><a id="linkTest" href="#sales-work-chart" data-toggle="tab">Chart</a></li>
						<li class="pull-left header"><i class="fa fa-inbox"></i> SMB Sales Report</li>
					</ul>
					<div class="tab-content no-padding">
						<div class="chart tab-pane" id="sales-work-list" style="position: relative;">
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
									<c:forEach items="${salesReport_work}" var="row">
									
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
												</tr>  
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->						
						</div>

						<div class="chart tab-pane active" id="sales-work-chart" style="position: relative;">
							<div class="col-xs-6" id="sales-work-chart-donut"></div>
							<div class="col-xs-6" id="sales-work-chart-area"></div>
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
												</tr>  
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<div class="chart tab-pane" id="sales-company-chart" style="position: relative;">
							<div class="col-xs-6" id="sales-company-chart-donut"></div>
							<div class="col-xs-6" id="sales-company-chart-area"></div>
						</div>
						
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
												</tr>
												
												<input type="hidden" value="" />
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->

						</div>
						<div class="chart tab-pane" id="sales-brand-chart" style="position: relative;">
							<div class="col-xs-6" id="sales-brand-chart-donut"></div>
							<div class="col-xs-6" id="sales-brand-chart-area"></div>
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

<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>

<script>
$(function () {
	
	// -------------------------------------------------------------------------
	// Sales Work - Chart
	// -------------------------------------------------------------------------
	
	// 화면 크기 조정 - Donut
	$('#sales-work-chart-donut').width($('#sales-work-chart').width() * 0.25);
	$('#sales-work-chart-donut').height(300);

	// 화면 크기 조정 - Area
	$('#sales-work-chart-area').width($('#sales-work-chart').width() * 0.65);
	$('#sales-work-chart-area').height(300);
	
	// 차트 데이터 처리 - Donut
	var sales_work_donut = new Array();
	<c:forEach items="${salesReport_work}" var="row">
		var json = new Object();
		json.name = "${row.work_nm}";
		json.sales = ${row.sales_1} + ${row.sales_2} + ${row.sales_3} + ${row.sales_4} + ${row.sales_5} + ${row.sales_6}
					 + ${row.sales_7} + ${row.sales_8} + ${row.sales_9} + ${row.sales_10} + ${row.sales_11} + ${row.sales_12};
		sales_work_donut.push(json);
	</c:forEach>
	
	// 차트 데이터 처리 - Area
	var sales_work_area = new Array();
	<c:forEach items="${salesReport_work}" var="row">
		var json = new Object();
		json.name = "${row.work_nm}";
		json.sales_1 = ${row.sales_1};
		json.sales_2 = ${row.sales_2};
		json.sales_3 = ${row.sales_3};
		json.sales_4 = ${row.sales_4};
		json.sales_5 = ${row.sales_5};
		json.sales_6 = ${row.sales_6};
		json.sales_7 = ${row.sales_7};
		json.sales_8 = ${row.sales_8};
		json.sales_9 = ${row.sales_9};
		json.sales_10 = ${row.sales_10};
		json.sales_11 = ${row.sales_11};
		json.sales_12 = ${row.sales_12};
		sales_work_area.push(json);
	</c:forEach>
	
	// 차트 데이터 그리기 - Donut
	var donut = new Morris.Donut({
		element: 'sales-work-chart-donut',
		resize: true,
		colors: ["#3c8dbc", "#f56954", "#00a65a"],
		data: [
			{label: sales_work_donut[1].name, value: Math.round(sales_work_donut[1].sales / sales_work_donut[0].sales * 100)},
			{label: sales_work_donut[2].name, value: Math.round(sales_work_donut[2].sales / sales_work_donut[0].sales * 100)},
			{label: sales_work_donut[3].name, value: Math.round(sales_work_donut[3].sales / sales_work_donut[0].sales * 100)}
		],
		hideHover: 'auto'
	});
	
	// 차트 데이터 그리기 - Area
	var area = new Morris.Area({
		element: 'sales-work-chart-area',
		resize: true,
		data: [
			{y: '01', item1: sales_work_area[0].sales_1, item2: sales_work_area[1].sales_1},
			{y: '02', item1: sales_work_area[0].sales_2, item2: sales_work_area[1].sales_2},
			{y: '03', item1: sales_work_area[0].sales_3, item2: sales_work_area[1].sales_3},
			{y: '04', item1: sales_work_area[0].sales_4, item2: sales_work_area[1].sales_4},
			{y: '05', item1: sales_work_area[0].sales_5, item2: sales_work_area[1].sales_5},
			{y: '06', item1: sales_work_area[0].sales_6, item2: sales_work_area[1].sales_6},
			{y: '07', item1: sales_work_area[0].sales_7, item2: sales_work_area[1].sales_7},
			{y: '08', item1: sales_work_area[0].sales_8, item2: sales_work_area[1].sales_8},
			{y: '09', item1: sales_work_area[0].sales_9, item2: sales_work_area[1].sales_9},
			{y: '10', item1: sales_work_area[0].sales_10, item2: sales_work_area[1].sales_10},
			{y: '11', item1: sales_work_area[0].sales_11, item2: sales_work_area[1].sales_11},
			{y: '12', item1: sales_work_area[0].sales_12, item2: sales_work_area[1].sales_12}
		],
		xkey: 'y',
		ykeys: ['item1', 'item2'],
		labels: [sales_work_area[0].name, sales_work_area[1].name],
		lineColors: ['#a0d0e0', '#3c8dbc'],
		hideHover: 'auto'
	});


	// -------------------------------------------------------------------------
	// Sales Company - Chart
	// -------------------------------------------------------------------------
	$('#sales-company-chart-donut').width($('#sales-company-chart').width() * 0.25);
	$('#sales-company-chart-donut').height(300);
	  
	$('#sales-company-chart-area').width($('#sales-company-chart').width() * 0.65);
	$('#sales-company-chart-area').height(300);
	
	//Donut Chart
	var donut = new Morris.Donut({
		element: 'sales-company-chart-donut',
		resize: true,
		colors: ["#3c8dbc", "#f56954", "#00a65a"],
		data: [
			{label: "Download Sales", value: 12},
			{label: "In-Store Sales", value: 30},
			{label: "Mail-Order Sales", value: 20}
		],
		hideHover: 'auto'
	});
   
	// Sales chart
	var area = new Morris.Area({
		element: 'sales-company-chart-area',
		resize: true,
		data: [
			{y: '2011 Q1', item1: 2666, item2: 2666},
			{y: '2011 Q2', item1: 2778, item2: 2294},
			{y: '2011 Q3', item1: 4912, item2: 1969},
			{y: '2011 Q4', item1: 3767, item2: 3597},
			{y: '2012 Q1', item1: 6810, item2: 1914},
			{y: '2012 Q2', item1: 5670, item2: 4293},
			{y: '2012 Q3', item1: 4820, item2: 3795},
			{y: '2012 Q4', item1: 15073, item2: 5967},
			{y: '2013 Q1', item1: 10687, item2: 4460},
			{y: '2013 Q2', item1: 8432, item2: 5713}
		],
		xkey: 'y',
		ykeys: ['item1', 'item2'],
		labels: ['Item 1', 'Item 2'],
		lineColors: ['#a0d0e0', '#3c8dbc'],
		hideHover: 'auto'
	});
	
	
	// -------------------------------------------------------------------------
	// Sales Brand - Chart
	// -------------------------------------------------------------------------
	$('#sales-brand-chart-donut').width($('#sales-brand-chart').width() * 0.25);
	$('#sales-brand-chart-donut').height(300);
	  
	$('#sales-brand-chart-area').width($('#sales-brand-chart').width() * 0.65);
	$('#sales-brand-chart-area').height(300);
	
	//Donut Chart
	var donut = new Morris.Donut({
		element: 'sales-brand-chart-donut',
		resize: true,
		colors: ["#3c8dbc", "#f56954", "#00a65a"],
		data: [
			{label: "Download Sales", value: 12},
			{label: "In-Store Sales", value: 30},
			{label: "Mail-Order Sales", value: 20}
		],
		hideHover: 'auto'
	});
   
	// Sales chart
	var area = new Morris.Area({
		element: 'sales-brand-chart-area',
		resize: true,
		data: [
			{y: '2011 Q1', item1: 2666, item2: 2666},
			{y: '2011 Q2', item1: 2778, item2: 2294},
			{y: '2011 Q3', item1: 4912, item2: 1969},
			{y: '2011 Q4', item1: 3767, item2: 3597},
			{y: '2012 Q1', item1: 6810, item2: 1914},
			{y: '2012 Q2', item1: 5670, item2: 4293},
			{y: '2012 Q3', item1: 4820, item2: 3795},
			{y: '2012 Q4', item1: 15073, item2: 5967},
			{y: '2013 Q1', item1: 10687, item2: 4460},
			{y: '2013 Q2', item1: 8432, item2: 5713}
		],
		xkey: 'y',
		ykeys: ['item1', 'item2'],
		labels: ['Item 1', 'Item 2'],
		lineColors: ['#a0d0e0', '#3c8dbc'],
		hideHover: 'auto'
	});
});


$('#fmBtnSalesInsert').click(function() {window.location = "/smb/SalesList.do"});

</script>

</body>
</html>
