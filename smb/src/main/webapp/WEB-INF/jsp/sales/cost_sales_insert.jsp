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
			���� ���
			<small>Insert</small>
		</h1>
	</section>

	<!-- Main content -->	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">SMB Cost Insert</h3>
					</div>
					<!-- /.box-header -->
	
					<div class="box-body">	
						<div class="row">
							<form id="frmInsCost" name="frmInsCost" role="form">
							<div class="col-md-6">
								<div class="form-group">
									<label>����</label>
									<select id="fmCostList" class="form-control select2" style="width: 100%;">
									<c:forEach items="${costList}" var="row">
										<option value="${row.cost_id}">${row.cost_cate_nm} / ${row.cost_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
								
								<div class="form-group">
									<label>����⵵</label>
									<select id="fmAmtYear" class="form-control select2" style="width: 100%;">
										<option value="2018">2018��</option>
										<option value="2019" selected="selected">2019��</option>
									</select>
								</div>
								<!-- /.form-group -->

								<div class="form-group">
									<label>�����</label>
									<select id="fmAmtMonth" class="form-control select2" style="width: 100%;">
										<option value="01">1��</option>
										<option value="02">2��</option>
										<option value="03">3��</option>
										<option value="04">4��</option>
										<option value="05">5��</option>
										<option value="06">6��</option>
										<option value="07">7��</option>
										<option value="08">8��</option>
										<option value="09">9��</option>
										<option value="10">10��</option>
										<option value="11">11��</option>
										<option value="12">12��</option>
									</select>
								</div>
								<!-- /.form-group -->

							</div>
							
							<!-- /.col -->
							<div class="col-md-6">
								<div class="form-group">
									<!-- text input -->
									<div class="form-group">
										<label>����ݾ�</label>
										<input type="text" id="fmCostMoney" class="form-control">
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
					
					<div align="right" class="box-footer">
                		<button type="submit" id="fmBtnCancel" class="btn btn-default">��������Ʈ ȭ������</button>
                		<button type="submit" id="fmBtnInsert" class="btn btn-info">������ ����</button>
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
 * �ݾ� ����ŷ ó��
 */
$(function () {
	$("input#fmCostMoney").mask('000,000,000,000,000', {reverse:true});
});

/**
 * �ݾ� ����ŷ ����
 */
function removeMask(target) {
	if(target == null || target == "") return 0;
	else return target.replace(/,/gi, '');
}

/**
 * �����ư Ŭ��
 */
$('#fmBtnInsert').click(function() {
	// Invaid Check
	if($("input#fmCostMoney").val()=="") {
		alert('����ݾ��� �Է��ϼ���');
		$("input#fmCostMoney").focus();
		return ;
	}
	
	
	// Insert Data
	$.ajax({
		type : 'GET',
		data  : {cost_id : $("#fmCostList option:selected").val(),
				 amt_year : $("#fmAmtYear option:selected").val(),
				 amt_month : $("#fmAmtMonth option:selected").val(),
				 cost_money : removeMask($("input#fmCostMoney").val()),
				},
		dataType: "json",
		url : '/smb/CostSalesInsert.do',
		contentType : 'application/json; charset=UTF-8',
		error : function(ajaxResult) {
			alert('����: ������ �ۼ��ſ� ������ �ֽ��ϴ�.');
		},
		success : function(ajaxResult) {
			if(confirm("����Ǿ����ϴ�.\n�߰��� �Է��� �����Ͱ� �ֽ��ϱ�?")) {
				window.location = "/smb/CostSalesInsertForm.do"
			} else {
				window.location = "/smb/CostSalesList.do"
			}
		}
	}); 
});

/**
 * ��ҹ�ư Ŭ��
 */
$('#fmBtnCancel').click(function() {
	window.location = "/smb/CostSalesList.do"	
});

</script>

</body>
</html>
