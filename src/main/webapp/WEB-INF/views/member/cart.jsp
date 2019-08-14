<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Shop Homepage - Start Bootstrap Template</title>
	<!-- Bootstrap core CSS -->
	<link href="${pageContext.servletContext.contextPath }/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="${pageContext.servletContext.contextPath }/assets/css/shop-item.css" rel="stylesheet">
</head>

<body>
	<!-- Navigation -->
	<c:import url='/WEB-INF/views/includes/navigation.jsp'>
		<c:param name="active" value="cart" />
	</c:import>
	<!-- /.Navigation -->

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3">
				<h1 class="my-4">Shoppingmall</h1>
				<div class="list-group">
					<a href="#" class="list-group-item">상의</a>
					<a href="#" class="list-group-item">하의</a>
					<a href="#" class="list-group-item">신발</a>
				</div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
				<h2 class="my-4">장바구니 목록</h2>
				<table class="table">
					<thead>
						<th>상품명</th>
						<th>옵션</th>
						<th>수량</th>
						<th>가격</th>
					</thead>
					<c:forEach items="${list }" var="item">
						<tbody>
							<td>
								${item.dto.productName }
							</td>
							<td>
								${item.dto.optionParentName1 }:${item.dto.optionChildName1 } / ${item.dto.optionParentName2 }:${item.dto.optionChildName2 }
							</td>
							<td>
								${item.cart.num }
							</td>
							<td>
								${item.cart.price }
							</td>
						</tbody>
					</c:forEach>
				</table>
				<br/>
				<div style="text-align: center;">
					<form:form id="form" method="post" action="/member/order">
						<input type="hidden" name="memberNo" value="${member.no }" />
						<input type="submit" value="주문하기" />
					</form:form>
				</div>
				<br/><br/><br/><br/>
			</div>
			<!-- /.col-lg-9 -->

		</div>

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<c:import url='/WEB-INF/views/includes/footer.jsp' />
	<!-- /.Footer -->
</body>

</html>