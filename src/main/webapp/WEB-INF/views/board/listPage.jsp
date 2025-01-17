<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script>
	var result = '${msg}';
	if (result == "success")
		alert('처리가 완료되었습니다.');
</script>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="<c:url value='../resources/dist/img/user2-160x160.jpg' />"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>Alexander Pierce</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..."> <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn"
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MAIN NAVIGATION</li>
			<li class="treeview"><a href="#"> <i class="fa fa-dashboard"></i>
					<span>Dashboard</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="../../index.html"><i class="fa fa-circle-o"></i>
							Dashboard v1</a></li>
					<li><a href="../../index2.html"><i class="fa fa-circle-o"></i>
							Dashboard v2</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i>
					<span>Layout Options</span> <span class="pull-right-container">
						<span class="label label-primary pull-right">4</span>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="../layout/top-nav.html"><i
							class="fa fa-circle-o"></i> Top Navigation</a></li>
					<li><a href="../layout/boxed.html"><i
							class="fa fa-circle-o"></i> Boxed</a></li>
					<li><a href="../layout/fixed.html"><i
							class="fa fa-circle-o"></i> Fixed</a></li>
					<li><a href="../layout/collapsed-sidebar.html"><i
							class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
				</ul></li>
			<li><a href="../widgets.html"> <i class="fa fa-th"></i> <span>Widgets</span>
					<span class="pull-right-container"> <small
						class="label pull-right bg-green">new</small>
				</span>
			</a></li>
			<li class="treeview"><a href="#"> <i class="fa fa-pie-chart"></i>
					<span>Charts</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="../charts/chartjs.html"><i
							class="fa fa-circle-o"></i> ChartJS</a></li>
					<li><a href="../charts/morris.html"><i
							class="fa fa-circle-o"></i> Morris</a></li>
					<li><a href="../charts/flot.html"><i
							class="fa fa-circle-o"></i> Flot</a></li>
					<li><a href="../charts/inline.html"><i
							class="fa fa-circle-o"></i> Inline charts</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
					<span>UI Elements</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="../UI/general.html"><i class="fa fa-circle-o"></i>
							General</a></li>
					<li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i>
							Icons</a></li>
					<li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i>
							Buttons</a></li>
					<li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i>
							Sliders</a></li>
					<li><a href="../UI/timeline.html"><i
							class="fa fa-circle-o"></i> Timeline</a></li>
					<li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i>
							Modals</a></li>
				</ul></li>
			<li class="treeview active"><a href="#"> <i
					class="fa fa-edit"></i> <span>Forms</span> <span
					class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="<c:url value='/board/register' />"><i
							class="fa fa-circle-o"></i> General Elements</a></li>
					<li class="active"><a href="<c:url value='/board/listAll' />"><i
							class="fa fa-circle-o"></i> Advanced Elements</a></li>
					<li><a href=""><i class="fa fa-circle-o"></i> Editors</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
					<span>Tables</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="../tables/simple.html"><i
							class="fa fa-circle-o"></i> Simple tables</a></li>
					<li><a href="../tables/data.html"><i
							class="fa fa-circle-o"></i> Data tables</a></li>
				</ul></li>
			<li><a href="../calendar.html"> <i class="fa fa-calendar"></i>
					<span>Calendar</span> <span class="pull-right-container"> <small
						class="label pull-right bg-red">3</small> <small
						class="label pull-right bg-blue">17</small>
				</span>
			</a></li>
			<li><a href="../mailbox/mailbox.html"> <i
					class="fa fa-envelope"></i> <span>Mailbox</span> <span
					class="pull-right-container"> <small
						class="label pull-right bg-yellow">12</small> <small
						class="label pull-right bg-green">16</small> <small
						class="label pull-right bg-red">5</small>
				</span>
			</a></li>
			<li class="treeview"><a href="#"> <i class="fa fa-folder"></i>
					<span>Examples</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="../examples/invoice.html"><i
							class="fa fa-circle-o"></i> Invoice</a></li>
					<li><a href="../examples/profile.html"><i
							class="fa fa-circle-o"></i> Profile</a></li>
					<li><a href="../examples/login.html"><i
							class="fa fa-circle-o"></i> Login</a></li>
					<li><a href="../examples/register.html"><i
							class="fa fa-circle-o"></i> Register</a></li>
					<li><a href="../examples/lockscreen.html"><i
							class="fa fa-circle-o"></i> Lockscreen</a></li>
					<li><a href="../examples/404.html"><i
							class="fa fa-circle-o"></i> 404 Error</a></li>
					<li><a href="../examples/500.html"><i
							class="fa fa-circle-o"></i> 500 Error</a></li>
					<li><a href="../examples/blank.html"><i
							class="fa fa-circle-o"></i> Blank Page</a></li>
					<li><a href="../examples/pace.html"><i
							class="fa fa-circle-o"></i> Pace Page</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-share"></i>
					<span>Multilevel</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
					<li class="treeview"><a href="#"><i class="fa fa-circle-o"></i>
							Level One <span class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span> </a>
						<ul class="treeview-menu">
							<li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
							<li class="treeview"><a href="#"><i
									class="fa fa-circle-o"></i> Level Two <span
									class="pull-right-container"> <i
										class="fa fa-angle-left pull-right"></i>
								</span> </a>
								<ul class="treeview-menu">
									<li><a href="#"><i class="fa fa-circle-o"></i> Level
											Three</a></li>
									<li><a href="#"><i class="fa fa-circle-o"></i> Level
											Three</a></li>
								</ul></li>
						</ul></li>
					<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
				</ul></li>
			<li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i>
					<span>Documentation</span></a></li>
			<li class="header">LABELS</li>
			<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
			<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
			<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			General Form Elements <small>Preview</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Forms</a></li>
			<li class="active">General Elements</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- right column -->
			<div class="col-md-12">
				<!-- Horizontal Form -->
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">List All Page</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th style="width: 10px;">BNO</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>REGDATE</th>
								<th style="width: 40px;">VIEWCNT</th>
							</tr>
							<c:forEach items="${list }" var="boardVO">
								<tr>
									<td>${boardVO.bNo }</td>
									<td>
									<!--  
									<a href="<c:url value='/board/read?bno=${boardVO.bNo}' />">${boardVO.title }</a>
									-->
									<a href="<c:url value='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bNo}' />">${boardVO.title }</a>
									</td>
									<td>${boardVO.writer }</td>
									<td><fmt:parseDate value='${boardVO.regDate }'
											var='regdate1' pattern="yyyy-mm-dd HH:mm" />
										<fmt:formatDate value="${regdate1}" pattern="yyyy-MM-dd HH:mm" /></td>
									<td><span class="badge bg-red">${boardVO.viewCnt }</span></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="box-footer">
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item "><a class="page-link"
										href="<c:url value='/board/listPage?page=${pageMaker.startPage -1 }'/>"
										tabindex="-1">&laquo;</a></li>
								</c:if>
								<c:if test="${not pageMaker.prev}">
									<li class="page-item disabled"><a class="page-link"
										href="#" tabindex="-1">&laquo;</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var='idx'>
									<li
										<c:out value="${pageMaker.cri.page==idx?'class =active page-item':'class =page-item' }"/>><a
										class="page-link"
										href="<c:url value='/board/listPage?page=${idx }'/>">${idx }</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link"
										href="<c:url value='/board/listPage?page=${pageMaker.endPage +1}'/>">&raquo;</a>
									</li>
								</c:if>
								<c:if test="${not pageMaker.next || pageMaker.endPage <= 0}">
									<li class="page-itemv disabled"><a class="page-link"
										href="#">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<%@include file="../include/footer.jsp"%>