<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
 
    String name = "";
    if(principal != null) {
        name = auth.getName();
    }
%>

<sec:authorize access="isAuthenticated()">
    <h5><%=name %>님, 반갑습니다.</h5>
    <form action="/logout" method="POST">
    </form>
</sec:authorize>

<!DOCTYPE html>    
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>CNTT | ADMIN</title>
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
    
	<header class="main-header">
		<a href="../../index2.html" class="logo">
			<span class="logo-mini"><b>A</b>LT</span>
			<span class="logo-lg"><b>Admin</b> CNT</span>
		</a>
		<nav class="navbar navbar-static-top">
			<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
				<span class="sr-only">Toggle navigation</span>
			</a>
			
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<li>
						<form id="logout-form" action='/Logout.do' method="POST">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        					<button type="submit">LOGOUT</button>
						</form>
					</li>
				</ul>
			</div>
		</nav>
	</header>

	<!-- =============================================== -->

	<aside class="main-sidebar">
		<section class="sidebar">
			<ul class="sidebar-menu">
				<li class="header">MAIN NAVIGATION</li>
				<li class="treeview">
					<a href="#">
						<i class="fa fa-dashboard"></i> <span>GIS</span>
							<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="../../index.html"><i class="fa fa-circle-o"></i> BergerKing</a></li>
						<li><a href="../../index2.html"><i class="fa fa-circle-o"></i> DropTop</a></li>
					</ul>
				</li>
	
				<li class="treeview">
					<a href="#">
						<i class="fa fa-pie-chart"></i>
						<span>매출관리</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="/smb/SalesList.do"><i class="fa fa-circle-o"></i> 매출리스트</a></li>
						<li><a href="/smb/CostSalesList.do"><i class="fa fa-circle-o"></i> 원가리스트</a></li>
					</ul>
				</li>
			</ul>
		</section>
	</aside>
<!-- =============================================== -->
