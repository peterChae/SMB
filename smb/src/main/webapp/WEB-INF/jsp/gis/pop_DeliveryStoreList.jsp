<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all-skins.min.css">

<!-- Main content -->
<section class="content">	
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">지역별 지점 현황</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="example1" class="table table-bordered table-striped">
						<thead>
						<tr>
							<th>지역</th>
							<th>지점수</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${areaCountMap}" var="row">
						<tr>
							<td>${row.si}</td>
							<td>${row.count}</td>
						</tr>
						</c:forEach>
						</tbody>					 
					</table>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
