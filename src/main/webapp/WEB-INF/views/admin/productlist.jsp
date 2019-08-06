<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Shop Homepage - Start Bootstrap Template</title>
<script
	src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery.js"></script>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.servletContext.contextPath }/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="${pageContext.servletContext.contextPath }/assets/css/shop-homepage.css"
	rel="stylesheet">
<style>
.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 100px;
	padding: 5px;
}

label[for='gdsDes'] {
	display: block;
}

input {
	width: 250px;
}

textarea#gdsDes {
	width: 800px;
	height: 180px;
}
</style>
</head>
<body>
	<!-- Navigation -->
	<c:import url='/WEB-INF/views/includes/navigation.jsp'>
		<c:param name="active" value="shopping" />
	</c:import>
	<!-- /.Navigation -->

	<div class="container">
		<div class="row">

			<div class="col-lg-3">
				<h1 class="my-4">Admin</h1>
				<c:import url='/WEB-INF/views/admin/includes/menubar.jsp' />
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
				<div id="container_box">
					<h2>상품 목록</h2>
				</div>

				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>종류</th>
							<th>이름</th>
							<th>가격</th>
							<th>설명</th>
							<th>등록날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="list">
							<tr>
								<td>${list.no }</td>
								<td>${list.type }</td>
								<td><a href="${pageContext.servletContext.contextPath }/admin/product/${list.no }">${list.name }</a></td>
								<td>${list.price }</td>
								<td>${list.explanation }</td>
								<td>${list.regDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<c:import url='/WEB-INF/views/includes/footer.jsp' />
	<!-- /.Footer -->
</body>

</html>