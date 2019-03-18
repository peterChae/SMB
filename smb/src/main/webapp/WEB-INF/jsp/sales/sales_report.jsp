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
						<li class="active"><a href="#sales-report-list" data-toggle="tab">List</a></li>
						<li><a id="sales_report_link" href="#sales-report-chart" data-toggle="tab">Chart</a></li>
						<li class="pull-left header"><i class="fa fa-inbox"></i> Sales Report</li>
					</ul>
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="sales-report-list" style="position: relative;">
							<!-- /.box-header -->
							<div class="box-body">
								<table id="salesList" class="table">
									<tr align="center" bgcolor="#0070C0">
										<td><report_title>항목</report_title></td>
										<c:forEach var="i" begin="1" end="12" step="1">
											<td width="7%"><report_title>${i}월</report_title></td>
										</c:forEach>
									</tr>
									<c:forEach items="${salesReport}" var="row">
										<c:set var="rep_id" value="${row.rep_id}" scope="session"/>
										<c:choose>
											<c:when test="${rep_id eq 'business_profit_rate'}">
												<tr align="center" bgcolor="#ffff00">
													<td><total_title>${row.rep_nm}</total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_1}" type="percent" pattern="0.0%" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_2}" type="percent" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_3}" type="percent" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_4}" type="percent" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_5}" type="percent" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_6}" type="percent" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_7}" type="percent" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_8}" type="percent" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_9}" type="percent" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_10}" type="percent" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_11}" type="percent" /></total_title></td>
													<td><total_title><fmt:formatNumber value="${row.sales_12}" type="percent" /></total_title></td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr align="center" bgcolor="#ffff00">
													<td><total_title>${row.rep_nm}</total_title></td>
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
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->						
						</div>

						<div class="chart tab-pane" id="sales-report-chart" style="position: relative;">
							<section class="content">
								<div class="row">
									<div class="col-md-6">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">${amt_year}년 매출총이익</h3>
											</div>
											<div class="box-body">
												<div class="chart">
													<canvas id="sales-report-chart-line"></canvas>
												</div>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<!-- /.col (LEFT) -->
									
									<div class="col-md-6">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">${amt_year}년 월별 영업이익률 (%)</h3>
											</div>
											<div class="box-body">
												<div class="chart">
													<canvas id="sales-report-chart-line2"></canvas>
												</div>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<!-- /.col (RIGHT) -->
									
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
						<li class="active"><a href="#sales-cost-list" data-toggle="tab">List</a></li>
						<li><a id="sales_cost_link" href="#sales-cost-chart" data-toggle="tab">Chart</a></li>
						<li class="pull-left header"><i class="fa fa-inbox"></i> 비용 리포트</li>
					</ul>
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="sales-cost-list" style="position: relative;">
							<!-- /.box-header -->
							<div class="box-body">
								<table id="salesList" class="table">
									<tr align="center" bgcolor="#0070C0">
										<td><report_title>비용항목</report_title></td>
										<c:forEach var="i" begin="1" end="12" step="1">
											<td width="7%"><report_title>${i}월</report_title></td>
										</c:forEach>
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
						<li class="pull-left header"><i class="fa fa-inbox"></i> 매출 리포트 - 업무별</li>
					</ul>
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="sales-work-list" style="position: relative;">
							<!-- /.box-header -->
							<div class="box-body">
								<table id="salesList" class="table">
									<tr align="center" bgcolor="#0070C0">
										<td><report_title>업무명</report_title></td>
										<c:forEach var="i" begin="1" end="12" step="1">
											<td width="7%"><report_title>${i}월</report_title></td>
										</c:forEach>
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
												<h3 class="box-title">월별 매출 데이터</h3>
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
						<li class="pull-left header"><i class="fa fa-inbox"></i> 매출 리포트 - 수행업체별</li>
					</ul>
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="sales-company-list" style="position: relative;">
							<!-- /.box-header -->
							<div class="box-body">
								<table id="salesList" class="table">
									<tr align="center" bgcolor="#0070C0">
										<td><report_title>수행업체</report_title></td>
										<c:forEach var="i" begin="1" end="12" step="1">
											<td width="7%"><report_title>${i}월</report_title></td>
										</c:forEach>
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
									
									<div class="col-md-8">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">월별 카카오 주문하기 수금율 (%)</h3>
											</div>
											<div class="box-body">
												<div class="chart">
												<canvas id="sales-company-chart-line"></canvas>
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
						<li class="pull-left header"><i class="fa fa-inbox"></i> 매출 리포트 - 브랜드별</li>
					</ul>
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="sales-brand-list" style="position: relative;">
							<!-- /.box-header -->
							<div class="box-body">
								<table id="salesList" class="table">
									<tr align="center" bgcolor="#0070C0">
										<td><report_title>브랜드</report_title></td>
										<c:forEach var="i" begin="1" end="12" step="1">
											<td width="7%"><report_title>${i}월</report_title></td>
										</c:forEach>
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
									<div class="col-md-6">
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

									<div class="col-md-6">
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

<!-- ----------------------------------------------- -->
<!-- include Footer -->
<!-- ----------------------------------------------- -->
<%@ include file="../common/footer.jsp" %>
<!-- ----------------------------------------------- -->
<!-- ----------------------------------------------- -->

<script>

/**
 * Color Value
 */

var chart_color = new Array();
$(function () {
	chart_color[0] = "#f39c12";
	chart_color[1] = "#ffcd00";
	chart_color[2] = "#00a65a";
	chart_color[3] = "#3c8dbc";
	chart_color[4] = "#00c0ef";
	chart_color[5] = "#f56954";
	chart_color[6] = "#d2d6de";
	chart_color[7] = "#00a65a";
	chart_color[8] = "#f39c12";
	chart_color[9] = "#3c8dbc";
	chart_color[10] = "#d2d6de";
});


/**
 * Chart Link Click - Chart Canvas Redraw
 */
$('#sales_report_link').click(function() { setTimeout(getSalesReportChart, 100); });
$('#sales_cost_link').click(function() { setTimeout(getSalesCostChart, 100); });
$('#sales_work_link').click(function() { setTimeout(getSalesWorkChart, 100); });
$('#sales_company_link').click(function() {	setTimeout(getSalesCompanyChart, 100); });
$('#sales_brand_link').click(function() { setTimeout(getSalesBrandChart, 100); });


/**
 * Sales Report Chart
 */
function getSalesReportChart() {
	$('#sales-report-chart-line').height(300);
	$('#sales-report-chart-line2').height(300);
	
	var sales_report_canvas = $("#sales-report-chart-line").get(0).getContext("2d");
	var sales_report_data   = setAreaChartData('sales_report');
	
	var sales_report_canvas2 = $("#sales-report-chart-line2").get(0).getContext("2d");
	var sales_report_data2   = setAreaChartData('sales_report2');

	lineChartDraw(sales_report_canvas, sales_report_data);
	lineChartDraw(sales_report_canvas2, sales_report_data2);
}

/**
 * Sales Cost Chart
 */
function getSalesCostChart() {
	$('#sales-cost-chart-donut').height(300);
	
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
	$('#sales-company-chart-line').height(300);
	
	var sales_company_donut_canvas = $("#sales-company-chart-donut").get(0).getContext("2d");
	var sales_company_donut_data   = setDonutChartData('sales_company');
	
	var sales_company_line_canvas = $("#sales-company-chart-line").get(0).getContext("2d");
	donutChartDraw(sales_company_donut_canvas, sales_company_donut_data);
	
	// 수금 데이터 Select
	$.ajax({
		type : 'GET',
		data  : {amt_year : '${amt_year}'},
		dataType: "json",
		url : '/smb/getPerformRate.do',
		contentType : 'application/json; charset=UTF-8',
		error : function(ajaxResult) {
			alert('에러: 데이터 송수신에 문제가 있습니다.');
		},
		success : function(ajaxResult) {
			var tmp_arr = new Array();
			for(var i=0; i<ajaxResult.data.performRate_list.length; i++) {
				var json = new Object();
				json.name = "수금율";
				json.sales_1 = ajaxResult.data.performRate_list[i].sales_1;
				json.sales_2 = ajaxResult.data.performRate_list[i].sales_2;
				json.sales_3 = ajaxResult.data.performRate_list[i].sales_3;
				tmp_arr.push(json);
			}
			lineChartDraw($("#sales-company-chart-line").get(0).getContext("2d"), makeData_Area(tmp_arr));
		}
	}); 
}


/**
 * Sales Brand Chart
 */
function getSalesBrandChart() {
	$('#sales-brand-chart-donut').height(300);
	$('#sales-brand-chart-donut2').height(300);
	
	var sales_brand_donut_canvas = $("#sales-brand-chart-donut").get(0).getContext("2d");
	var sales_brand_donut_data   = setDonutChartData('sales_brand');
	
	var sales_brand_donut_canvas2 = $("#sales-brand-chart-donut2").get(0).getContext("2d");
	var sales_brand_donut_data2   = setDonutChartData('sales_brand2');

	donutChartDraw(sales_brand_donut_canvas, sales_brand_donut_data);
	donutChartDraw(sales_brand_donut_canvas2, sales_brand_donut_data2);
}


/**
 * Donut Chart Data Setting
 */
function setDonutChartData(data)
{
	var tmp_arr = new Array();
	var tmp_data = new Array(); 
	
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
	}
	
	// -----------------------------------------------------------------------------------------
	// Sales Brand 
	// -----------------------------------------------------------------------------------------
	else if(data == "sales_brand") {
		<c:forEach items="${salesReport_brand}" var="row">
			var json = new Object();
			json.name = "${row.brand_nm}";
			json.sales = ${row.sales_1} + ${row.sales_2} + ${row.sales_3} + ${row.sales_4} + ${row.sales_5} + ${row.sales_6}
						 + ${row.sales_7} + ${row.sales_8} + ${row.sales_9} + ${row.sales_10} + ${row.sales_11} + ${row.sales_12};
			tmp_arr.push(json);
		</c:forEach>
	}
	
	// -----------------------------------------------------------------------------------------
	// Sales Brand 2
	// -----------------------------------------------------------------------------------------
	else if(data == "sales_brand2") {
		
		// 전체 합계 금액 구하기
		var total_value = 0;
		<c:forEach items="${salesReport_brand}" var="row">
			<c:choose>
				<c:when test="${row.brand_id ne 'total' && row.brand_id ne 'kakao'}">
					total_value += ${row.sales_1} + ${row.sales_2} + ${row.sales_3} + ${row.sales_4} + ${row.sales_5} + ${row.sales_6}
								 + ${row.sales_7} + ${row.sales_8} + ${row.sales_9} + ${row.sales_10} + ${row.sales_11} + ${row.sales_12};
				</c:when>
			</c:choose>
		</c:forEach>
		
		var json_total = new Object();
		json_total.name = "합계";
		json_total.sales = total_value;
		tmp_arr.push(json_total);
		
		// 합계를 제외한 나머지 데이터 누적
		<c:forEach items="${salesReport_brand}" var="row">
			<c:choose>
				<c:when test="${row.brand_id ne 'kakao'}">
					var json = new Object();
					json.name = "${row.brand_nm}";
					json.sales = ${row.sales_1} + ${row.sales_2} + ${row.sales_3} + ${row.sales_4} + ${row.sales_5} + ${row.sales_6}
								 + ${row.sales_7} + ${row.sales_8} + ${row.sales_9} + ${row.sales_10} + ${row.sales_11} + ${row.sales_12};
					tmp_arr.push(json);
				</c:when>
			</c:choose>
		</c:forEach>
	}

	// -----------------------------------------------------------------------------------------
	// Chart Data Setting 
	// -----------------------------------------------------------------------------------------
	for(var i=0; i<tmp_arr.length; i++) {
		if(tmp_arr[i].name != "합계") {	
			var tmp_var = 
					{
						label: tmp_arr[i].name + " (" + Math.round(tmp_arr[i].sales / tmp_arr[0].sales * 100) + "%)",
						value: tmp_arr[i].sales,
						color: chart_color[i],
						highlight: chart_color[i]
					};
			tmp_data.push(tmp_var);
		}
	}
	
	return tmp_data;
}


/**
 * Area Chart Data Setting
 */
function setAreaChartData(data)
{
	var tmp_arr = new Array();
		
	// -----------------------------------------------------------------------------------------
	// Sales Report 
	// -----------------------------------------------------------------------------------------
	if(data == "sales_report") {
		<c:forEach items="${salesReport}" var="row">
			<c:choose>
				<c:when test="${row.rep_id eq 'gross_margin'}">
					var json = new Object();
					json.name = "${row.rep_nm}";
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
					tmp_arr.push(json);
				</c:when>
			</c:choose>
		</c:forEach>
	}
	
	// -----------------------------------------------------------------------------------------
	// Sales Report 
	// -----------------------------------------------------------------------------------------
	else if(data == "sales_report2") {
		<c:forEach items="${salesReport}" var="row">
			<c:choose>
				<c:when test="${row.rep_id eq 'business_profit_rate'}">
					var json = new Object();
					json.name = "${row.rep_nm}";
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
					tmp_arr.push(json);
				</c:when>
			</c:choose>
		</c:forEach>
	}

	// -----------------------------------------------------------------------------------------
	// Sales Work 
	// -----------------------------------------------------------------------------------------
	else if(data == "sales_work") {
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
			tmp_arr.push(json);
		</c:forEach>
	}
	
	// -----------------------------------------------------------------------------------------
	// Perform Rate 
	// -----------------------------------------------------------------------------------------
	else if(data == "perform_rate") {
		<c:forEach items="${performRate_list}" var="row">
			var json = new Object();
			json.name = "수금율";
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
			tmp_arr.push(json);
		</c:forEach>
	}
	
	return makeData_Area(tmp_arr);
}


/**
 * Chart Data Setting
 */
function makeData_Area(tmp_arr) {
	var tmp_data = new Array();
	var tmp_dataset = new Array();
	var tmp_var;

	for(var i=0; i<tmp_arr.length; i++) {
		tmp_var =
			{
				label: tmp_arr[i].name,
				fillColor: chart_color[i],
				strokeColor: chart_color[i],
				pointColor: chart_color[i],
				pointStrokeColor: chart_color[i],
				pointHighlightFill: "#fff",
				pointHighlightStroke: chart_color[i],
				data: [
					tmp_arr[i].sales_1, 
					tmp_arr[i].sales_2, 
					tmp_arr[i].sales_3, 
					tmp_arr[i].sales_4, 
					tmp_arr[i].sales_5, 
					tmp_arr[i].sales_6, 
					tmp_arr[i].sales_7, 
					tmp_arr[i].sales_8, 
					tmp_arr[i].sales_9, 
					tmp_arr[i].sales_10,
					tmp_arr[i].sales_11,
					tmp_arr[i].sales_12
				]
			};
		tmp_dataset.push(tmp_var);
	}
	tmp_data.labels = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
	tmp_data.datasets = tmp_dataset;
	
	return tmp_data;
}


/**
 * Donut Chart Draw
 */
function donutChartDraw(canvas, data) {
	var pieChartCanvas = canvas;
	var pieChart = new Chart(pieChartCanvas);
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
	pieChart.Doughnut(data, pieOptions);	
}


/**
 * Area Chart Draw
 */
function areaChartDraw(canvas, data) {
	var areaChartCanvas = canvas;
	var areaChart = new Chart(areaChartCanvas);
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
	areaChart.Line(data, areaChartOptions);
}


/**
 * Line Chart Draw
 */
function lineChartDraw(canvas, data) {
	var lineChartCanvas = canvas;
	var lineChart = new Chart(lineChartCanvas);
	var lineChartOptions = {
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
	
	lineChartOptions.datasetFill = false;
	lineChart.Line(data, lineChartOptions);	
}


$('#fmBtnSalesInsert').click(function() {
	window.location = "/smb/SalesList.do"
});

</script>

</body>
</html>
