<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<c:choose>
       			<c:when test="${msg}">
           			<li class="header">MAIN NAVIGATION</li>
					<li><a href="#"><i class="fa fa-lock"></i><span> LOGOUT</span></a></li>
					<li><a href="#"><i class="fa fa-book"></i><span> GIS</span></a></li>
       			</c:when>
       			<c:otherwise>
           			<li class="header">MAIN NAVIGATION</li>
					<li><a href="#"><i class="fa fa-lock"></i><span> LOGIN</span></a></li>
					<li><a href="#"><i class="fa fa-book"></i><span> GIS</span></a></li>
       			</c:otherwise>
   			</c:choose>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>