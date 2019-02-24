<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>CNTT | GIS-MATCHING SYSTEM</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all-skins.min.css">
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
			매출 등록
			<small>Register</small>
		</h1>
	</section>

	<!-- Main content -->	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">SMB Sales Register</h3>
					</div>
					<!-- /.box-header -->
	
					<div class="box-body">	
						<div class="row">
							<form id="frmInsSales" name="frmInsSales" role="form">
							<div class="col-md-6">
								<div class="form-group">
									<label>진행업무</label>
									<select id="select_work" class="form-control select2" style="width: 100%;">
									<c:forEach items="${workList}" var="row">
										<option value="${row.work_id}">${row.work_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
								
								<div class="form-group">
									<label>수행업체</label>
									<select id="select_cmpy" class="form-control select2" style="width: 100%;">
									<c:forEach items="${cmpyList}" var="row">
										<option value="${row.cmpy_id}">${row.cmpy_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
								
								<div class="form-group">
									<label>브랜드</label>
									<select id="select_brand" class="form-control select2" style="width: 100%;">
									<c:forEach items="${brandList}" var="row">
										<option value="${row.brand_id}">${row.brand_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
							</div>
							
							<!-- /.col -->
							<div class="col-md-6">
								<div class="form-group">
									<label>매출년도</label>
									<select id="select_year" class="form-control select2" style="width: 100%;">
										<option value="2018">2018년</option>
										<option value="2019" selected="selected">2019년</option>
									</select>
								</div>
								<!-- /.form-group -->

								<div class="form-group">
									<label>매출월</label>
									<select id="select_month" class="form-control select2" style="width: 100%;">
										<option value="01">1월</option>
										<option value="02">2월</option>
										<option value="03">3월</option>
										<option value="04">4월</option>
										<option value="05">5월</option>
										<option value="06">6월</option>
										<option value="07">7월</option>
										<option value="08">8월</option>
										<option value="09">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option>
									</select>
								</div>
								<!-- /.form-group -->

								<div class="form-group">
									<label>매출회차</label>
									<select id="select_term" class="form-control select2" style="width: 100%;">
										<option value="1" selected="selected">1회차 (1 ~ 15)</option>
										<option value="2">2회차 (15 ~ 31)</option>
									</select>
								</div>
								<!-- /.form-group -->

								<div class="form-group">
									<!-- text input -->
									<div class="form-group">
										<label>매출금액</label>
										<input type="text" id="sales_money" class="form-control">
									</div>
									<div class="form-group">
										<label>매입금액</label>
										<input type="text" id="amt_money" class="form-control">
									</div>
									<div class="form-group">
										<label>카카오 정산 금액</label>
										<input type="text" id="amt_kakao_money" class="form-control">
									</div>
									<div class="form-group">
										<label>순매출액</label>
										<input type="text" id="net_sales_money" class="form-control" disabled>
									</div>
									<div class="form-group">
										<label>수행건수</label>
										<input type="text" id="perform_count" class="form-control">
									</div>
									<div class="form-group">
										<label>환불금액</label>
										<input type="text" id="refund_money" class="form-control">
									</div>
								</div>
								<!-- /.form-group -->
							</div>
							<!-- /.col -->
						</form>
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
					
					<div class="box-footer">
                		<button type="submit" id="btn_cancel" class="btn btn-default">취소</button>
                		<button type="submit" id="btn_insert" class="btn btn-info pull-right">저장</button>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<!-- Maks -->
<script src="${pageContext.request.contextPath}/js/jquery.mask.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.mask.min.js"></script>

<!-- page script -->
<script>
/**
 * 금액 마스킹 처리
 */
$(function () {
	$("input#sales_money").mask('000,000,000,000,000', {reverse:true});
	$("input#amt_money").mask('000,000,000,000,000', {reverse:true});
	$("input#amt_kakao_money").mask('000,000,000,000,000', {reverse:true});
	$("input#net_sales_money").mask('000,000,000,000,000', {reverse:true});
	$("input#perform_count").mask('000,000,000,000,000', {reverse:true});
	$("input#refund_money").mask('000,000,000,000,000', {reverse:true});
});

/**
 * 금액 마스킹 제거
 */
function removeMask(target) {
	if(target == null) return 0;
	else return target.replace(/,/gi, '');
}


/**
 * 순매출 구하기
 */
$("input#sales_money").blur(function() {
	var sales_money = $("input#sales_money").val();
	var amt_money   = $("input#amt_money").val();
	$("input#net_sales_money").val(removeMask(sales_money) - removeMask(amt_money));
});
$("input#amt_money").blur(function() {
	$("input#sales_money").blur();
});


/**
 * Select Box
 */
$("#select_work").change(function() {
	var work_id = $("#select_work option:selected").val();
	if(work_id == "w0001" || work_id == "w0002") {
		$('#select_brand option[value=kakao]').attr('selected','selected');
	}
});


/**
 * 저장버튼 클릭
 */
$('#btn_insert').click(function() {
	
	// Invaid Check
	if($("input#sales_money").val()=="") {
		alert('매출금액을 입력하세요');
		$("input#sales_money").focus();
		return ;
	} else if($("input#amt_money").val()=="") {
		alert('매입금액을 입력하세요');
		$("input#amt_money").focus();
		return ;
	} else if($("input#perform_count").val()=="") {
		alert('수행건수를 입력하세요');
		$("input#perform_count").focus();
		return ;
	} else if($("input#refund_money").val()=="") {
		alert('환불금액을 입력하세요');
		$("input#refund_money").focus();
		return ;
	}

	// Insert Data
	$.ajax({
		type : 'GET',
		data  : {work_id : $("#select_work option:selected").val(),
				 cmpy_id : $("#select_cmpy option:selected").val(),
				 brand_id : $("#select_brand option:selected").val(),
				 amt_year : $("#select_year option:selected").val(),
				 amt_month : $("#select_month option:selected").val(),
				 amt_term : $("#select_term option:selected").val(),
				 sales_money : removeMask($("input#sales_money").val()),
				 amt_money : removeMask($("input#amt_money").val()),
				 amt_kakao_money : removeMask($("input#amt_kakao_money").val()),
				 net_sales_money : removeMask($("input#net_sales_money").val()),
				 refund_money : removeMask($("input#refund_money").val()),
				 perform_count : removeMask($("input#perform_count").val())
				},
		dataType: "json",
		url : '/smb/insertSales.do',
		contentType : 'application/json; charset=UTF-8',
		error : function(ajaxResult) {
			alert('에러: 데이터 송수신에 문제가 있습니다.');
		},
		success : function(ajaxResult) {
			if(confirm("저장되었습니다.\n추가로 입력할 데이터가 있습니까?")) {
				window.location = "/smb/insSales.do"
			} else {
				window.location = "/smb/initSales.do"
			}
		}
	}); 

	
});

/**
 * 취소버튼 클릭
 */
$('#btn_cancel').click(function() {
	window.location = "/smb/initSales.do"	
});

</script>



</body>
</html>
