<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<h3 class="box-title">SMB Sales Insert</h3>
					</div>
					<!-- /.box-header -->
	
					<div class="box-body">	
						<div class="row">
							<form id="frmInsSales" name="frmInsSales" role="form">
							<div class="col-md-6">
								<div class="form-group">
									<label>�������</label>
									<select id="fmWorkList" class="form-control select2" style="width: 100%;">
									<c:forEach items="${workList}" var="row">
										<option value="${row.work_id}">${row.work_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
								
								<div class="form-group">
									<label>�����ü</label>
									<select id="fmCmpyList" class="form-control select2" style="width: 100%;">
									<c:forEach items="${cmpyList}" var="row">
										<option value="${row.cmpy_id}">${row.cmpy_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
								
								<div class="form-group">
									<label>�귣��</label>
									<select id="fmBrandList" class="form-control select2" style="width: 100%;">
									<c:forEach items="${brandList}" var="row">
										<option value="${row.brand_id}">${row.brand_nm}</option>
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

								<div class="form-group">
									<label>����ȸ��</label>
									<select id="fmAmtTerm" class="form-control select2" style="width: 100%;">
										<option value="1" selected="selected">1ȸ�� (1 ~ 15)</option>
										<option value="2">2ȸ�� (15 ~ 31)</option>
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
										<input type="text" id="fmSalesMoney" class="form-control">
									</div>
									<div class="form-group">
										<label>���Աݾ�</label>
										<input type="text" id="fmAmtMoney" class="form-control">
									</div>
									<div class="form-group">
										<label>īī�� ���� �ݾ�</label>
										<input type="text" id="fmAmtKakaoMoney" class="form-control">
									</div>
									<div class="form-group">
										<label>�������</label>
										<input type="text" id="fmNetSalesMoney" class="form-control" disabled>
									</div>
									<div class="form-group">
										<label>���Ǽ�</label>
										<input type="text" id="fmTargetCount" class="form-control">
									</div>
									<div class="form-group">
										<label>����Ǽ�</label>
										<input type="text" id="fmPerformCount" class="form-control">
									</div>
									<div class="form-group">
										<label>ȯ�ұݾ�</label>
										<input type="text" id="fmRefundMoney" class="form-control">
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
                		<button type="submit" id="fmBtnCancel" class="btn btn-default">���⸮��Ʈ ȭ������</button>
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

<!-- ----------------------------------------------- -->
<!-- include Footer -->
<!-- ----------------------------------------------- -->
<%@ include file="../common/footer.jsp" %>
<!-- ----------------------------------------------- -->
<!-- ----------------------------------------------- -->

<!-- page script -->
<script>
/**
 * �ݾ� ����ŷ ó��
 */
$(function () {
	$("input#fmSalesMoney").mask('000,000,000,000,000', {reverse:true});
	$("input#fmAmtMoney").mask('000,000,000,000,000', {reverse:true});
	$("input#fmAmtKakaoMoney").mask('000,000,000,000,000', {reverse:true});
	$("input#fmNetSalesMoney").mask('000,000,000,000,000', {reverse:true});
	$("input#fmTargetCount").mask('000,000,000,000,000', {reverse:true});
	$("input#fmPerformCount").mask('000,000,000,000,000', {reverse:true});
	$("input#fmRefundMoney").mask('000,000,000,000,000', {reverse:true});
});

/**
 * �ݾ� ����ŷ ����
 */
function removeMask(target) {
	if(target == null || target == "") return 0;
	else return target.replace(/,/gi, '');
}


/**
 * ������ ���ϱ�
 */
$("input#fmSalesMoney").blur(function() {
	var sales_money = $("input#fmSalesMoney").val();
	var amt_money = $("input#fmAmtMoney").val();
	var amt_kakao_money = $("input#fmAmtKakaoMoney").val();
	$("input#fmNetSalesMoney").val(removeMask(sales_money) - removeMask(amt_money) - removeMask(amt_kakao_money));
});
$("input#fmAmtMoney").blur(function() {
	$("input#fmSalesMoney").blur();
});
$("input#fmAmtKakaoMoney").blur(function() {
	$("input#fmSalesMoney").blur();
});


/**
 * Select Box
 */
$("#fmWorkList").change(function() {
	var work_id = $("#fmWorkList option:selected").val();
	if(work_id == "w0001" || work_id == "w0002") {
		$('#fmBrandList option[value=kakao]').attr('selected','selected');
	}
});


/**
 * �����ư Ŭ��
 */
$('#fmBtnInsert').click(function() {
	// Invaid Check
	if($("input#fmSalesMoney").val()=="") {
		alert('����ݾ��� �Է��ϼ���');
		$("input#fmSalesMoney").focus();
		return ;
	} else if($("input#fmAmtMoney").val()=="") {
		alert('���Աݾ��� �Է��ϼ���');
		$("input#fmAmtMoney").focus();
		return ;
	} else if($("input#fmPerformCount").val()=="") {
		alert('����Ǽ��� �Է��ϼ���');
		$("input#fmPerformCount").focus();
		return ;
	} else if($("input#fmRefundMoney").val()=="") {
		alert('ȯ�ұݾ��� �Է��ϼ���');
		$("input#fmRefundMoney").focus();
		return ;
	}
	
	
	// Insert Data
	$.ajax({
		type : 'GET',
		data  : {work_id : $("#fmWorkList option:selected").val(),
				 cmpy_id : $("#fmCmpyList option:selected").val(),
				 brand_id : $("#fmBrandList option:selected").val(),
				 amt_year : $("#fmAmtYear option:selected").val(),
				 amt_month : $("#fmAmtMonth option:selected").val(),
				 amt_term : $("#fmAmtTerm option:selected").val(),
				 sales_money : removeMask($("input#fmSalesMoney").val()),
				 amt_money : removeMask($("input#fmAmtMoney").val()),
				 amt_kakao_money : removeMask($("input#fmAmtKakaoMoney").val()),
				 net_sales_money : removeMask($("input#fmNetSalesMoney").val()),
				 refund_money : removeMask($("input#fmRefundMoney").val()),
				 target_count : removeMask($("input#fmTargetCount").val()),
				 perform_count : removeMask($("input#fmPerformCount").val())
				},
		dataType: "json",
		url : '/smb/SalesInsert.do',
		contentType : 'application/json; charset=UTF-8',
		error : function(ajaxResult) {
			alert('����: ������ �ۼ��ſ� ������ �ֽ��ϴ�.');
		},
		success : function(ajaxResult) {
			if(confirm("����Ǿ����ϴ�.\n�߰��� �Է��� �����Ͱ� �ֽ��ϱ�?")) {
				window.location = "/smb/SalesInsertForm.do"
			} else {
				window.location = "/smb/SalesList.do"
			}
		}
	}); 
});

/**
 * ��ҹ�ư Ŭ��
 */
$('#fmBtnCancel').click(function() {
	window.location = "/smb/SalesList.do"	
});

</script>



</body>
</html>
