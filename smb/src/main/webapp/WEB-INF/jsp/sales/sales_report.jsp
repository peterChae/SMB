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
						<li class="active"><a href="#sales-cost-list" data-toggle="tab">List</a></li>
						<li><a id="sales_cost_link" href="#sales-cost-chart" data-toggle="tab">Chart</a></li>
						<li class="pull-left header"><i class="fa fa-inbox"></i> 원가 리포트</li>
					</ul>
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="sales-cost-list" style="position: relative;">
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
									<c:forEach items="${salesReport_cost}" var="row">
									
										<c:set var="work_id" value="${row.cost_id}" scope="session"/>
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
													<td>${row.cost_nm}</td>
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

						<div class="chart tab-pane" id="sales-cost-chart" style="position: relative;">
							<section class="content">
								<div class="row">
									<div class="col-md-4">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">${amt_year}년 누적 데이터</h3>
											</div>
											<div class="box-body">
												<div class="chart">
													<canvas id="sales-cost-chart-donut"></canvas>
												</div>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<!-- /.col (LEFT) -->
									
									<div class="col-md-8">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">월별 데이터</h3>
											</div>
											<div class="box-body">
												<div class="chart">
												<canvas id="sales-cost-chart-area"></canvas>
												</div>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<!-- /.col (RIGHT) -->
								</div>
								<!-- /.row -->
							</section>
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
						<li class="active"><a href="#sales-work-list" data-toggle="tab">List</a></li>
						<li><a id="sales_work_link" href="#sales-work-chart" data-toggle="tab">Chart</a></li>
						<li class="pull-left header"><i class="fa fa-inbox"></i> 업무별 실적</li>
					</ul>
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="sales-work-list" style="position: relative;">
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

						<div class="chart tab-pane" id="sales-work-chart" style="position: relative;">
							<section class="content">
								<div class="row">
									<div class="col-md-4">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">${amt_year}년 누적 데이터</h3>
											</div>
											<div class="box-body">
												<div class="chart">
													<canvas id="sales-work-chart-donut"></canvas>
												</div>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<!-- /.col (LEFT) -->
									
									<div class="col-md-8">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">월별 데이터</h3>
											</div>
											<div class="box-body">
												<div class="chart">
												<canvas id="sales-work-chart-area"></canvas>
												</div>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<!-- /.col (RIGHT) -->
								</div>
								<!-- /.row -->
							</section>
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
						<li><a id="sales_company_link" href="#sales-company-chart" data-toggle="tab">Chart</a></li>
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
							<section class="content">
								<div class="row">
									<div class="col-md-4">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">${amt_year}년 누적 데이터</h3>
											</div>
											<div class="box-body">
												<div class="chart">
													<canvas id="sales-company-chart-donut"></canvas>
												</div>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<!-- /.col (LEFT) -->
									
									<div class="col-md-4">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">카카오 매출 누적 데이터</h3>
											</div>
											<div class="box-body">
												<div class="chart">
												<canvas id="sales-company-chart-donut2"></canvas>
												</div>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<!-- /.col (MID) -->
									
									<div class="col-md-4">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">기업물류 매출 누적 데이터</h3>
											</div>
											<div class="box-body">
												<div class="chart">
												<canvas id="sales-company-chart-donut3"></canvas>
												</div>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<!-- /.col (RIGHT) -->
								</div>
								<!-- /.row -->
							</section>						
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
						<li><a id="sales_brand_link" href="#sales-brand-chart" data-toggle="tab">Chart</a></li>
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
							<section class="content">
								<div class="row">
									<div class="col-md-4">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">${amt_year}년 누적 데이터</h3>
											</div>
											<div class="box-body">
												<div class="chart">
													<canvas id="sales-brand-chart-donut"></canvas>
												</div>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<!-- /.col (LEFT) -->

									<div class="col-md-4">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">브랜드별 매출 (카카오 제외)</h3>
											</div>
											<div class="box-body">
												<div class="chart">
												<canvas id="sales-brand-chart-donut2"></canvas>
												</div>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<!-- /.col (RIGHT) -->
									
									<div class="col-md-4">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">브랜드별 수행건수 (카카오 제외)</h3>
											</div>
											<div class="box-body">
												<div class="chart">
												<canvas id="sales-brand-chart-donut3"></canvas>
												</div>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<!-- /.col (RIGHT) -->
								</div>
								<!-- /.row -->
							</section>
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

<!-- Fast Click -->
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>

<script>
$(function () {
	// Html Load
});


/**
 * Chart Link Click - Chart Canvas Redraw
 */
$('#sales_cost_link').click(function() { setTimeout(getSalesCostChart, 100); });
$('#sales_work_link').click(function() { setTimeout(getSalesWorkChart, 100); });
$('#sales_company_link').click(function() {	setTimeout(getSalesCompanyChart, 100); });
$('#sales_brand_link').click(function() { setTimeout(getSalesBrandChart, 100); });


/**
 * Sales Work Chart
 */
function getSalesCostChart() {
	$('#sales-cost-chart-donut').height(300);
	$('#sales-cost-chart-area').height(300);
	
	var sales_cost_donut_canvas = $("#sales-cost-chart-donut").get(0).getContext("2d");
	var sales_cost_donut_data   = setDonutChartData('sales_cost');
	
	donutChartDraw(sales_cost_donut_canvas, sales_cost_donut_data);
}


/**
 * Sales Work Chart
 */
function getSalesWorkChart() {
	$('#sales-work-chart-donut').height(300);
	$('#sales-work-chart-area').height(300);
	
	var sales_work_donut_canvas = $("#sales-work-chart-donut").get(0).getContext("2d");
	var sales_work_donut_data   = setDonutChartData('sales_work');
	
	var sales_work_area_canvas  = $("#sales-work-chart-area").get(0).getContext("2d");
	var sales_work_area_data    = setAreaChartData('sales_work');
	
	donutChartDraw(sales_work_donut_canvas, sales_work_donut_data);
	areaChartDraw(sales_work_area_canvas, sales_work_area_data);
}


/**
 * Sales Company Chart
 */
function getSalesCompanyChart() {
	$('#sales-company-chart-donut').height(300);
	$('#sales-company-chart-donut2').height(300);
	$('#sales-company-chart-donut3').height(300);
	
	var sales_company_donut_canvas = $("#sales-company-chart-donut").get(0).getContext("2d");
	var sales_company_donut_data   = setDonutChartData('sales_company');
	
	donutChartDraw(sales_company_donut_canvas, sales_company_donut_data);
}


/**
 * Sales Brand Chart
 */
function getSalesBrandChart() {
	$('#sales-brand-chart-donut').height(300);
	$('#sales-brand-chart-donut2').height(300);
	$('#sales-brand-chart-donut3').height(300);
	
	var sales_brand_donut_canvas = $("#sales-brand-chart-donut").get(0).getContext("2d");
	var sales_brand_donut_data   = setDonutChartData('sales_brand');
	
	donutChartDraw(sales_brand_donut_canvas, sales_brand_donut_data);
}


/**
 * Donut Chart Data Setting
 */
function setDonutChartData(data)
{
	var tmp_arr = new Array();
	var tmp_data; 
	
	// -----------------------------------------------------------------------------------------
	// Sales Cost 
	// -----------------------------------------------------------------------------------------
	if(data == "sales_cost") {
		<c:forEach items="${salesReport_cost}" var="row">
			var json = new Object();
			json.name = "${row.cost_nm}";
			json.sales = ${row.sales_1} + ${row.sales_2} + ${row.sales_3} + ${row.sales_4} + ${row.sales_5} + ${row.sales_6}
						 + ${row.sales_7} + ${row.sales_8} + ${row.sales_9} + ${row.sales_10} + ${row.sales_11} + ${row.sales_12};
			tmp_arr.push(json);
		</c:forEach>
		
		tmp_data = [
			{
				label: tmp_arr[1].name + " (" + Math.round(tmp_arr[1].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[1].sales,
				color: "#ffcd00",
				highlight: "#ffcd00"
			},
			{
				label: tmp_arr[2].name + " (" + Math.round(tmp_arr[2].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[2].sales,
				color: "#00a65a",
				highlight: "#00a65a"
			},
			{
				label: tmp_arr[3].name + " (" + Math.round(tmp_arr[3].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[3].sales,
				color: "#f39c12",
				highlight: "#f39c12"
			},
			{
				label: tmp_arr[4].name + " (" + Math.round(tmp_arr[4].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[4].sales,
				color: "#00c0ef",
				highlight: "#00c0ef"
			},
			{
				label: tmp_arr[5].name + " (" + Math.round(tmp_arr[5].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[5].sales,
				color: "#3c8dbc",
				highlight: "#3c8dbc"
			},
			{
				label: tmp_arr[6].name + " (" + Math.round(tmp_arr[6].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[6].sales,
				color: "#f56954",
				highlight: "#f56954"
			}
		];
	}
	
	// -----------------------------------------------------------------------------------------
	// Sales Work 
	// -----------------------------------------------------------------------------------------
	else if(data == "sales_work") {
		<c:forEach items="${salesReport_work}" var="row">
			var json = new Object();
			json.name = "${row.work_nm}";
			json.sales = ${row.sales_1} + ${row.sales_2} + ${row.sales_3} + ${row.sales_4} + ${row.sales_5} + ${row.sales_6}
						 + ${row.sales_7} + ${row.sales_8} + ${row.sales_9} + ${row.sales_10} + ${row.sales_11} + ${row.sales_12};
			tmp_arr.push(json);
		</c:forEach>
		
		tmp_data = [
			{
				label: tmp_arr[1].name + " (" + Math.round(tmp_arr[1].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[1].sales,
				color: "#ffcd00",
				highlight: "#ffcd00"
			},
			{
				label: tmp_arr[2].name + " (" + Math.round(tmp_arr[2].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[2].sales,
				color: "#00a65a",
				highlight: "#00a65a"
			},
			{
				label: tmp_arr[3].name + " (" + Math.round(tmp_arr[3].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[3].sales,
				color: "#f39c12",
				highlight: "#f39c12"
			}
		];
	}
	
	// -----------------------------------------------------------------------------------------
	// Sales Company 
	// -----------------------------------------------------------------------------------------
	else if(data == "sales_company") {
		<c:forEach items="${salesReport_company}" var="row">
			var json = new Object();
			json.name = "${row.cmpy_nm}";
			json.sales = ${row.sales_1} + ${row.sales_2} + ${row.sales_3} + ${row.sales_4} + ${row.sales_5} + ${row.sales_6}
						 + ${row.sales_7} + ${row.sales_8} + ${row.sales_9} + ${row.sales_10} + ${row.sales_11} + ${row.sales_12};
			tmp_arr.push(json);
		</c:forEach>
		
		tmp_data = [
			{
				label: tmp_arr[1].name + " (" + Math.round(tmp_arr[1].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[1].sales,
		        color: "#d2d6de",
		        highlight: "#d2d6de",
			},
			{
				label: tmp_arr[2].name + " (" + Math.round(tmp_arr[2].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[2].sales,
				color: "#00a65a",
				highlight: "#00a65a"
			},
			{
				label: tmp_arr[3].name + " (" + Math.round(tmp_arr[3].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[3].sales,
		        color: "#f39c12",
		        highlight: "#f39c12",
			},
			{
				label: tmp_arr[4].name + " (" + Math.round(tmp_arr[4].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[4].sales,
		        color: "#00c0ef",
		        highlight: "#00c0ef",
			},
			{
				label: tmp_arr[5].name + " (" + Math.round(tmp_arr[5].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[5].sales,
		        color: "#3c8dbc",
		        highlight: "#3c8dbc",
			},
			{
				label: tmp_arr[6].name + " (" + Math.round(tmp_arr[6].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[6].sales,
		        color: "#f56954",
		        highlight: "#f56954",
			},
			{
				label: tmp_arr[7].name + " (" + Math.round(tmp_arr[7].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[7].sales,
		        color: "#00a65a",
		        highlight: "#00a65a",
			},
			{
				label: tmp_arr[8].name + " (" + Math.round(tmp_arr[8].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[8].sales,
		        color: "#f39c12",
		        highlight: "#f39c12",
			},
			{
				label: tmp_arr[9].name + " (" + Math.round(tmp_arr[9].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[9].sales,
		        color: "#00c0ef",
		        highlight: "#00c0ef",
			},
			{
				label: tmp_arr[10].name + " (" + Math.round(tmp_arr[10].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[10].sales,
		        color: "#3c8dbc",
		        highlight: "#3c8dbc",
			},
		];
	}
	
	// -----------------------------------------------------------------------------------------
	// Sales Company 
	// -----------------------------------------------------------------------------------------
	else if(data == "sales_brand") {
		<c:forEach items="${salesReport_brand}" var="row">
			var json = new Object();
			json.name = "${row.brand_nm}";
			json.sales = ${row.sales_1} + ${row.sales_2} + ${row.sales_3} + ${row.sales_4} + ${row.sales_5} + ${row.sales_6}
						 + ${row.sales_7} + ${row.sales_8} + ${row.sales_9} + ${row.sales_10} + ${row.sales_11} + ${row.sales_12};
			tmp_arr.push(json);
		</c:forEach>
		
		tmp_data = [
			{
				label: tmp_arr[1].name + " (" + Math.round(tmp_arr[1].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[1].sales,
				color: "#ffcd00",
				highlight: "#ffcd00"
			},
			{
				label: tmp_arr[2].name + " (" + Math.round(tmp_arr[2].sales / tmp_arr[0].sales * 100) + "%)",
				value: tmp_arr[2].sales,
				color: "#00a65a",
				highlight: "#00a65a"
			}
		];
	}
	
	return tmp_data;
}


/**
 * Area Chart Data Setting
 */
function setAreaChartData(data)
{
	if(data == "sales_work") {
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
		
		var tmp_data = {
			labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			datasets: [
				{
					label: sales_work_area[0].name,
					fillColor: "rgba(210, 214, 222, 1)",
					strokeColor: "rgba(210, 214, 222, 1)",
					pointColor: "rgba(210, 214, 222, 1)",
					pointStrokeColor: "#c1c7d1",
					pointHighlightFill: "#fff",
					pointHighlightStroke: "rgba(220,220,220,1)",
					data: [
						sales_work_area[0].sales_1, 
						sales_work_area[0].sales_2, 
						sales_work_area[0].sales_3, 
						sales_work_area[0].sales_4, 
						sales_work_area[0].sales_5, 
						sales_work_area[0].sales_6, 
						sales_work_area[0].sales_7, 
						sales_work_area[0].sales_8, 
						sales_work_area[0].sales_9, 
						sales_work_area[0].sales_10,
						sales_work_area[0].sales_11,
						sales_work_area[0].sales_12
					]
				},
				{
					label: sales_work_area[1].name,
					fillColor: "rgba(60,141,188,0.9)",
					strokeColor: "rgba(60,141,188,0.8)",
					pointColor: "#3b8bba",
					pointStrokeColor: "rgba(60,141,188,1)",
					pointHighlightFill: "#fff",
					pointHighlightStroke: "rgba(60,141,188,1)",
					data: [
						sales_work_area[1].sales_1, 
						sales_work_area[1].sales_2, 
						sales_work_area[1].sales_3, 
						sales_work_area[1].sales_4, 
						sales_work_area[1].sales_5, 
						sales_work_area[1].sales_6, 
						sales_work_area[1].sales_7, 
						sales_work_area[1].sales_8, 
						sales_work_area[1].sales_9, 
						sales_work_area[1].sales_10,
						sales_work_area[1].sales_11,
						sales_work_area[1].sales_12
					]
				},
				{
					label: sales_work_area[2].name,
					fillColor: "rgba(243,156,18,0.9)",
					strokeColor: "rgba(243,156,18,0.8)",
					pointColor: "#f39c12",
					pointStrokeColor: "rgba(243,156,18,1)",
					pointHighlightFill: "#fff",
					pointHighlightStroke: "rgba(243,156,18,1)",
					data: [
						sales_work_area[2].sales_1, 
						sales_work_area[2].sales_2, 
						sales_work_area[2].sales_3, 
						sales_work_area[2].sales_4, 
						sales_work_area[2].sales_5, 
						sales_work_area[2].sales_6, 
						sales_work_area[2].sales_7, 
						sales_work_area[2].sales_8, 
						sales_work_area[2].sales_9, 
						sales_work_area[2].sales_10,
						sales_work_area[2].sales_11,
						sales_work_area[2].sales_12
					]
				},
				{
					label: sales_work_area[3].name,
					fillColor: "rgba(0,192,239,0.9)",
					strokeColor: "rgba(0,192,239,0.8)",
					pointColor: "#00c0ef",
					pointStrokeColor: "rgba(0,192,239,1)",
					pointHighlightFill: "#fff",
					pointHighlightStroke: "rgba(0,192,239,1)",
					data: [
						sales_work_area[3].sales_1, 
						sales_work_area[3].sales_2, 
						sales_work_area[3].sales_3, 
						sales_work_area[3].sales_4, 
						sales_work_area[3].sales_5, 
						sales_work_area[3].sales_6, 
						sales_work_area[3].sales_7, 
						sales_work_area[3].sales_8, 
						sales_work_area[3].sales_9, 
						sales_work_area[3].sales_10,
						sales_work_area[3].sales_11,
						sales_work_area[3].sales_12
					]
				}
			]
		}
	}
	
	return tmp_data;
}


/**
 * Donut Chart Draw
 */
function donutChartDraw(canvas, data) {
	var pieChartCanvas = canvas;
	var pieChart = new Chart(pieChartCanvas);
	var PieData = data;

	var pieOptions = {
		segmentShowStroke: true,
		segmentStrokeColor: "#fff",
		segmentStrokeWidth: 2,
		percentageInnerCutout: 50, // This is 0 for Pie charts
		animationSteps: 40,
		animationEasing: "easeOutBounce",
		animateRotate: true,
		animateScale: false,
		responsive: true,
		maintainAspectRatio: true,
	};
	pieChart.Doughnut(PieData, pieOptions);	
}


/**
 * Area Chart Draw
 */
function areaChartDraw(canvas, data) {
	var areaChartCanvas = canvas;
	var areaChart = new Chart(areaChartCanvas);

	var areaChartData = data;

	var areaChartOptions = {
		showScale: true,
		scaleShowGridLines: false,
		scaleGridLineColor: "rgba(0,0,0,.05)",
		scaleGridLineWidth: 1,
		scaleShowHorizontalLines: true,
		scaleShowVerticalLines: true,
		bezierCurve: true,
		bezierCurveTension: 0.3,
		pointDot: false,
		pointDotRadius: 4,
		pointDotStrokeWidth: 1,
		pointHitDetectionRadius: 20,
		datasetStroke: true,
		datasetStrokeWidth: 2,
		datasetFill: true,
		maintainAspectRatio: true,
		responsive: true
	};
	areaChart.Line(areaChartData, areaChartOptions);
}


$('#fmBtnSalesInsert').click(function() {
	window.location = "/smb/SalesList.do"
});

</script>

</body>
</html>
