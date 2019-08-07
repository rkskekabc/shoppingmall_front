<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="list-group">
	<a href="${pageContext.servletContext.contextPath }/admin/category" class="list-group-item">카테고리 관리</a>
	<a href="${pageContext.servletContext.contextPath }/admin/productoption" class="list-group-item">옵션 관리</a>
	<a href="${pageContext.servletContext.contextPath }/admin/product" class="list-group-item">상품 목록</a>
	<a href="${pageContext.servletContext.contextPath }/admin/product/add" class="list-group-item">상품 등록</a>
	<a href="#" class="list-group-item">회원 목록</a>
</div>