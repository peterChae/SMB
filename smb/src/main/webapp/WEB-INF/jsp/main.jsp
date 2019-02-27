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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9a749ab366ad2be358f9cc9cc135906"></script>
	
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<%@ include file="common/header.jsp" %>
	<%@ include file="common/menu.jsp" %>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Reporting
				<small>Count</small>
			</h1>
		</section>

		<!-- Main content -->
		<section class="content">
			<!-- Small boxes (Stat box) -->
			<div class="row">
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-aqua">
						<div class="inner">
							<h3>${deliveryCount}</h3>
							<p>��޴��� ����</p>
						</div>
						<div class="icon">
							<i class="ion ion-bag"></i>
						</div>
						<a href="javascript:openDeliveryStoreList()" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-green">
						<div class="inner">
							<h3>${branchCount}</h3>
							<p>�귣�� ������</p>
						</div>
						<div class="icon">
							<i class="ion ion-stats-bars"></i>
						</div>
						<a href="javascript:openBranchList()" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-yellow">
						<div class="inner">
							<h3><span id="countMatchingBranch"></span></h3>
							<p>��Ī ������</p>
						</div>
						<div class="icon">
							<i class="ion ion-person-add"></i>
						</div>
						<a href="javascript:openMatchingList()" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-red">
						<div class="inner">
							<h3><span id="countUnMatchingBranch"></span></h3>
							<p>���Ī ������</p>
						</div>
						<div class="icon">
							<i class="ion ion-pie-graph"></i>
						</div>
						<a href="javascript:openUnMatchingList()" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
			</div>

			<!-- /.row -->
			<!-- Main row -->
			<div class="row">
				<!-- Left col -->
				<section class="col-md-12">
					<!-- Custom tabs (Charts with tabs)-->
					<div class="nav-tabs-custom">
						<!-- Tabs within a box -->
						<ul class="nav nav-tabs pull-right">
							<li><input type="button" id="map_search" class="btn btn-block btn-default btn-default" value="�˻�"></li>
							<li>
								<select name="distance" id="distance" class="form-control">
									<option value="2000">2Km</option>
									<option value="3000">3Km</option>
								</select>
							</li>							
							<li class="pull-left header"><i class="fa fa-inbox"></i>${brand}</li>
						</ul>
						<div class="tab-content no-padding">
							<div id="map" style="width:100%;height:600px;"></div>					
						</div>
					</div>
					<!-- /.nav-tabs-custom -->

				</section>
				<!-- /.Left col -->

			</div>
			<!-- /.row (main row) -->

		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script>
	var circles = [];
	var markerData = [];
	var branchData = [];
	var markers = [];
	var branchMarkers = [];
	var search_flag = false;

	var container = document.getElementById('map');
	var options = {
	    center: new daum.maps.LatLng(37.554381, 126.968193), // ������ �߽���ǥ
	    level: 9 // ������ Ȯ�� ����
	};
	var map = new daum.maps.Map(container, options);
	

	$('#map_search').click(function() {
		clearCircle(circles);
		clearBranchMarkers(branchMarkers);
		$.fn.GetMapList();
	});
	
	function openDeliveryStoreList() {
		window.open('/smb/gis/getAreaCountList.do?brand=${brand}' ,'window','width=700, height=400');
	}
	
	function openBranchList() {
		
	}
	
	function openMatchingList() {
		if(search_flag) {
			window.open('/smb/gis/getMatchingList.do?brand=${brand}&distance=' + $('select[name=distance]').val(), 'window', 'width=700, height=400');	
		} else {
			alert("�ݰ�˻� ���� ����� �����մϴ�.\n���� ��� �˻� ��ư�� �����ּ���.");
		}
	}

	function openUnMatchingList() {
		if(search_flag) {
			window.open('/smb/gis/getUnMatchingList.do?brand=${brand}&distance=' + $('select[name=distance]').val(), 'window', 'width=700, height=400');
		} else {
			alert("�ݰ�˻� ���� ����� �����մϴ�.\n���� ��� �˻� ��ư�� �����ּ���.");
		}
	}

	$.fn.GetMapList=function(){
		var brand = '${brand}';
		$.ajax({
			type : 'GET',
			data  : {distance : $('select[name=distance]').val(), brand : brand},
			dataType: "json",
			url : '/smb/gis/getDeliveryArea.do',
			contentType : 'application/json; charset=UTF-8',
			error : function(ajaxResult) {
				alert('����: ������ �ۼ��ſ� ������ �ֽ��ϴ�.');
			},
			success : function(ajaxResult) {
				$('#countMatchingBranch').html(ajaxResult.data.countMatchingBranch);
				$('#countUnMatchingBranch').html(ajaxResult.data.countUnMatchingBranch);
				setGISMarkup(ajaxResult.data.DeliveryStoreList,ajaxResult.data.distance,'D');
				setGISMarkup(ajaxResult.data.BranchList,null,'B');
				search_flag = true;
			}
		}); 
	};
	
	function setGISMarkup(paramList, distance, code) {
		markerData = [];
		branchData = [];

		for(var i = 0; i < paramList.length; i++) {
			var tmp;
			
			if(code == "D") {
				tmp = "CNT-Delivery"
				markerData.push(paramList[i]);
			} else {
				tmp = paramList[i].branch_name;
				branchData.push(paramList[i]);
			}
			
			addMarker(paramList[i].lat, paramList[i].lng, tmp, distance, code);
		}
	}
		
	function addMarker(lat, lng, store_name, distance, code) {
		if(code=="D"){
			// ��Ŀ �̹����� �̹��� �ּ��Դϴ�
			var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";  
			var latlng = new daum.maps.LatLng(lng, lat);
			 // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
		    var imageSize = new daum.maps.Size(12, 12); 
		    // ��Ŀ �̹����� �����մϴ�    
		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    // ��Ŀ�� �����մϴ�
		    var marker = new daum.maps.Marker({
		        map: map, // ��Ŀ�� ǥ���� ����
		        position: latlng, // ��Ŀ�� ǥ���� ��ġ
		        title : store_name, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
		        image : markerImage // ��Ŀ �̹��� 
		    });			
		    markers.push(marker);
		    setCircle(latlng, distance);
		} else {
			var latlng = new daum.maps.LatLng(lat, lng);
			var marker = new daum.maps.Marker({
		        map: map, // ��Ŀ�� ǥ���� ����
		        position: latlng, // ��Ŀ�� ǥ���� ��ġ
		        title : store_name
		    });	
			setBranchMarkers(marker);
			
			// ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
		    var infowindow = new daum.maps.InfoWindow({
		        content: store_name // ���������쿡 ǥ���� ����
		    });
			
		    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
	}
	
	function setBranchMarkers(marker){
 		// ������ ���� ǥ���մϴ� 
		marker.setMap(map); 
		branchMarkers.push(marker);
	}
	
	function setCircle(latlng, distance){
		circle = new daum.maps.Circle({
		    center : latlng,  // ���� �߽���ǥ �Դϴ� 
		    radius: distance, // ���� ������ ���� �������Դϴ� 
		    strokeWeight: 2, // ���� �β��Դϴ� 
		    strokeColor: '#75B8FA', // ���� �����Դϴ�
		    strokeOpacity: 1, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
		    strokeStyle: 'dashed', // ���� ��Ÿ�� �Դϴ�
		    fillColor: '#CFE7FF', // ä��� �����Դϴ�
		    fillOpacity: 0.7  // ä��� ������ �Դϴ�   
		}); 
    
 		// ������ ���� ǥ���մϴ� 
		circle.setMap(map); 
		circles.push(circle);
	}
	
	// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	function clearCircle(circles){
		for(var i=0;i<circles.length;i++){
			circles[i].setMap(null);
		}
	}
	
	function clearBranchMarkers(branchMarkers){
		for(var i=0;i<branchMarkers.length;i++){
			branchMarkers[i].setMap(null);
		}
	}
</script>

</body>
</html>

