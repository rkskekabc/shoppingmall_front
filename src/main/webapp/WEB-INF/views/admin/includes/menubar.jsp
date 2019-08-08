<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Sidebar -->
<ul class="sidebar navbar-nav">
	<c:choose>
		<c:when test='${param.active =="category" }'>
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/category">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>카테고리 관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/productoption">
					<i class="fas fa-fw fa-folder"></i> <span>옵션 관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/product">
					<i class="fas fa-fw fa-folder"></i> <span>상품 목록</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/product/add">
					<i class="fas fa-fw fa-chart-area"></i> <span>상품 등록</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>회원 목록</span>
			</a></li>
		</c:when>
		<c:when test='${param.active =="option" }'>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/category">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>카테고리 관리</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/productoption">
					<i class="fas fa-fw fa-folder"></i> <span>옵션 관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/product">
					<i class="fas fa-fw fa-folder"></i> <span>상품 목록</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/product/add">
					<i class="fas fa-fw fa-chart-area"></i> <span>상품 등록</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>회원 목록</span>
			</a></li>
		</c:when>
		<c:when test='${param.active =="productlist" }'>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/category">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>카테고리 관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/productoption">
					<i class="fas fa-fw fa-folder"></i> <span>옵션 관리</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/product">
					<i class="fas fa-fw fa-folder"></i> <span>상품 목록</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/product/add">
					<i class="fas fa-fw fa-chart-area"></i> <span>상품 등록</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>회원 목록</span>
			</a></li>
		</c:when>
		<c:when test='${param.active =="productadd" }'>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/category">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>카테고리 관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/productoption">
					<i class="fas fa-fw fa-folder"></i> <span>옵션 관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/product">
					<i class="fas fa-fw fa-folder"></i> <span>상품 목록</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/product/add">
					<i class="fas fa-fw fa-chart-area"></i> <span>상품 등록</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>회원 목록</span>
			</a></li>
		</c:when>
		<c:when test='${param.active =="member" }'>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/category">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>카테고리 관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/productoption">
					<i class="fas fa-fw fa-folder"></i> <span>옵션 관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/product">
					<i class="fas fa-fw fa-folder"></i> <span>상품 목록</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.servletContext.contextPath }/admin/product/add">
					<i class="fas fa-fw fa-chart-area"></i> <span>상품 등록</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>회원 목록</span>
			</a></li>
		</c:when>
	</c:choose>
</ul>