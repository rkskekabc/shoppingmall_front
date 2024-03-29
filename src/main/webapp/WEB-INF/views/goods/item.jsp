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
		<c:param name="active" value="shopping" />
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

				<div class="card mt-4">
					<c:choose>
						<c:when test="${not empty goods.thumbnail}">
							<img class="card-img-top img-fluid"
								src="${goods.thumbnail }" alt="">
						</c:when>
						<c:otherwise>
							<img class="card-img-top img-fluid"
								src="http://placehold.it/900x400" alt="">
						</c:otherwise>
					</c:choose>
					<div class="card-body">
						<h3 class="card-title">${goods.name }</h3>
						<h4>&#8361; ${goods.price }</h4>
						<form:form id="form" action="/goods/cart" method="post">
							<input type="hidden" name="memberNo" value="${member.no }" />
							<select name="optionDetailNo">
								<c:forEach items="${detail }" var="var">
									<option value="${var.no }">${var.info }</option>
								</c:forEach>
							</select>
							<br/><br/>
							수량 : <input type="text" name="num" />
							<input type="hidden" name="price" value="${goods.price }" />
							<input type="submit" value="장바구니에 담기" />
						</form:form>
						<p class="card-text">
							${goods.explanation }
						</p>
						<span class="text-warning">&#9733; &#9733; &#9733; &#9733;
							&#9734;</span> 4.0 stars
					</div>
				</div>
				<br/>
				<br/>

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