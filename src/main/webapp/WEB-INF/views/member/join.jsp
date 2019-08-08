<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Shop Homepage - Start Bootstrap Template</title>
	<!-- Bootstrap core CSS -->
	<link href="${pageContext.servletContext.contextPath }/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="${pageContext.servletContext.contextPath }/assets/css/shop-login.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
	<c:import url='/WEB-INF/views/includes/navigation.jsp'>
		<c:param name="active" value="login" />
	</c:import>
	<!-- /.Navigation -->

 	<div class="container">
 		<div class="card card-container">
        	<img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form method="post" action="/member/join" name="joinForm">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		                아이디 : <input type="text" id="id" name="id" /><br/>
		                비밀번호 : <input type="password" id="password" name="password" /><br/>
		                이름 : <input type="text" id="name" name="name" /><br/>
		                생년월일 : <input type="date" id="birth" name="birth" /><br/>
		                성별 : <input type="text" id="gender" name="gender" /><br/>
		                이메일 : <input type="email" id="email" name="email" /><br/>
		                전화번호 : <input type="text" id="phone" name="phone" /><br/>
		                주소 : <input type="text" id="address" name="address" />
      			<input type="submit" value="가입" />
            </form><!-- /form -->
        </div>
        <!-- /.card-container -->
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<c:import url='/WEB-INF/views/includes/footer.jsp' />
	<!-- /.Footer -->
</body>
</html>