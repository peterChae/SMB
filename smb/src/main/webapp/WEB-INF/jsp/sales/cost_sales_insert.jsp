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
			원가 등록
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
									<label>원가</label>
									<select id="fmCostList" class="form-control select2" style="width: 100%;">
									<c:forEach items="${costList}" var="row">
										<option value="${row.cost_id}">${row.cost_cate_nm} / ${row.cost_nm}</option>
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

							</div>
							
							<!-- /.col -->
							<div class="col-md-6">
								<div class="form-group">
									<!-- text input -->
									<div class="form-group">
										<label>지출금액</label>
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
                		<button type="submit" id="fmBtnCancel" class="btn btn-default">원가리스트 화면으로</button>
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
	$("input#fmCostMoney").mask('000,000,000,000,000', {reverse:true});
});

/**
 * 금액 마스킹 제거
 */
function removeMask(target) {
	if(target == null || target == "") return 0;
	else return target.replace(/,/gi, '');
}

/**
 * 저장버튼 클릭
 */
$('#fmBtnInsert').click(function() {
	// Invaid Check
	if($("input#fmCostMoney").val()=="") {
		alert('지출금액을 입력하세요');
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
			alert('에러: 데이터 송수신에 문제가 있습니다.');
		},
		success : function(ajaxResult) {
			if(confirm("저장되었습니다.\n추가로 입력할 데이터가 있습니까?")) {
				window.location = "/smb/CostSalesInsertForm.do"
			} else {
				window.location = "/smb/CostSalesList.do"
			}
		}
	}); 
});

/**
 * 취소버튼 클릭
 */
$('#fmBtnCancel').click(function() {
	window.location = "/smb/CostSalesList.do"	
});

</script>

</body>
</html>
