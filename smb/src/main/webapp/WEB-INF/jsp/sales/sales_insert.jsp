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
			매출 등록
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
									<label>진행업무</label>
									<select id="fmWorkList" class="form-control select2" style="width: 100%;">
									<c:forEach items="${workList}" var="row">
										<option value="${row.work_id}">${row.work_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
								
								<div class="form-group">
									<label>수행업체</label>
									<select id="fmCmpyList" class="form-control select2" style="width: 100%;">
									<c:forEach items="${cmpyList}" var="row">
										<option value="${row.cmpy_id}">${row.cmpy_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
								
								<div class="form-group">
									<label>브랜드</label>
									<select id="fmBrandList" class="form-control select2" style="width: 100%;">
									<c:forEach items="${brandList}" var="row">
										<option value="${row.brand_id}">${row.brand_nm}</option>
									</c:forEach>
									</select>
								</div>
								<!-- /.form-group -->
								
								<div class="form-group">
									<label>매출년도</label>
									<select id="fmAmtYear" class="form-control select2" style="width: 100%;">
										<option value="2018">2018년</option>
										<option value="2019" selected="selected">2019년</option>
									</select>
								</div>
								<!-- /.form-group -->

								<div class="form-group">
									<label>매출월</label>
									<select id="fmAmtMonth" class="form-control select2" style="width: 100%;">
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
									<select id="fmAmtTerm" class="form-control select2" style="width: 100%;">
										<option value="1" selected="selected">1회차 (1 ~ 15)</option>
										<option value="2">2회차 (15 ~ 31)</option>
									</select>
								</div>
								<!-- /.form-group -->
							</div>
							
							<!-- /.col -->
							<div class="col-md-6">
								<div class="form-group">
									<!-- text input -->
									<div class="form-group">
										<label>매출금액</label>
										<input type="text" id="fmSalesMoney" class="form-control">
									</div>
									<div class="form-group">
										<label>매입금액</label>
										<input type="text" id="fmAmtMoney" class="form-control">
									</div>
									<div class="form-group">
										<label>카카오 정산 금액</label>
										<input type="text" id="fmAmtKakaoMoney" class="form-control">
									</div>
									<div class="form-group">
										<label>순매출액</label>
										<input type="text" id="fmNetSalesMoney" class="form-control" disabled>
									</div>
									<div class="form-group">
										<label>대상건수</label>
										<input type="text" id="fmTargetCount" class="form-control">
									</div>
									<div class="form-group">
										<label>수행건수</label>
										<input type="text" id="fmPerformCount" class="form-control">
									</div>
									<div class="form-group">
										<label>환불금액</label>
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
                		<button type="submit" id="fmBtnCancel" class="btn btn-default">매출리스트 화면으로</button>
                		<button type="submit" id="fmBtnInsert" class="btn btn-info">데이터 저장</button>
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
 * 금액 마스킹 처리
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
 * 금액 마스킹 제거
 */
function removeMask(target) {
	if(target == null || target == "") return 0;
	else return target.replace(/,/gi, '');
}


/**
 * 순매출 구하기
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
 * 저장버튼 클릭
 */
$('#fmBtnInsert').click(function() {
	// Invaid Check
	if($("input#fmSalesMoney").val()=="") {
		alert('매출금액을 입력하세요');
		$("input#fmSalesMoney").focus();
		return ;
	} else if($("input#fmAmtMoney").val()=="") {
		alert('매입금액을 입력하세요');
		$("input#fmAmtMoney").focus();
		return ;
	} else if($("input#fmPerformCount").val()=="") {
		alert('수행건수를 입력하세요');
		$("input#fmPerformCount").focus();
		return ;
	} else if($("input#fmRefundMoney").val()=="") {
		alert('환불금액을 입력하세요');
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
			alert('에러: 데이터 송수신에 문제가 있습니다.');
		},
		success : function(ajaxResult) {
			if(confirm("저장되었습니다.\n추가로 입력할 데이터가 있습니까?")) {
				window.location = "/smb/SalesInsertForm.do"
			} else {
				window.location = "/smb/SalesList.do"
			}
		}
	}); 
});

/**
 * 취소버튼 클릭
 */
$('#fmBtnCancel').click(function() {
	window.location = "/smb/SalesList.do"	
});

</script>



</body>
</html>
