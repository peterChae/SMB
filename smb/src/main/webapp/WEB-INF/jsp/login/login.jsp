<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>CNTT | ADMIN SYSTEM</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
</head>

<body class="hold-transition login-page">
<div class="login-box">
	<div class="login-logo">
		<a href="../../index2.html"><b>Admin</b> CNT Delivery</a>
	</div>
	<!-- /.login-logo -->
	
	<div class="login-box-body">
		<p class="login-box-msg">Sign in to start your session</p>
		<form id="frmLogin" action="j_spring_security_check" method="POST">
			<div class="form-group has-feedback">
				<input type="text" id="user_id" class="form-control" placeholder="ID">
				<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" id="user_pw" class="form-control" placeholder="Password">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="row">
				<div class="col-xs-8">
				</div>
				<!-- /.col -->
				
				<div class="col-xs-4">
					<button type="button" id="btnlogin" class="btn btn-primary btn-block btn-flat">Sign In</button>
				</div>
				<!-- /.col -->
			</div>
		</form>
	</div>
	<!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script>
$('#btnlogin').click(function() {
	if($("input#user_id").val() == "") {
		alert('ID를 입력하세요');
		$("input#user_id").focus();
		return ;
	} else if($("input#user_pw").val() == "") {
		alert('비밀번호를 입력하세요');
		$("input#user_pw").focus();
		return ;
	} else {
		$('#frmLogin').submit();
	}
});
</script>

</body>
</html>
