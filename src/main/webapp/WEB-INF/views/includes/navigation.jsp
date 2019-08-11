<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
    function formSubmit() {
                document.getElementById("logoutForm").submit();
    }
</script>
<form action="/logout" method="post" id="logoutForm">
            <input type="hidden"
                    name="${_csrf.parameterName}"
                    value="${_csrf.token}" />
</form>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="#">&nbsp;</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<sec:authentication var="user" property="principal" />
			<ul class="navbar-nav ml-auto">
				<c:choose>
					<c:when test='${param.active == "login" }'>
						<sec:authorize access="isAuthenticated()">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/main">${user.username }님 안녕하세요.</a>
							</li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/admin">관리자 화면</a>
							</li>
						</sec:authorize>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.servletContext.contextPath }/main">홈</a>
						</li>
						<sec:authorize access="isAnonymous()">
							<li class="nav-item active">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/member/login">로그인<span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/member/join">회원가입</a>
							</li>
						</sec:authorize>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.servletContext.contextPath }/cs">고객센터</a>
						</li>
						<sec:authorize access="isAuthenticated()">
							<a class="nav-link" href="javascript:formSubmit()">로그아웃</a>
						</sec:authorize>
					</c:when>
					<c:when test='${param.active == "join" }'>
						<sec:authorize access="isAuthenticated()">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/main">${user.username }님 안녕하세요.</a>
							</li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/admin">관리자 화면</a>
							</li>
						</sec:authorize>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.servletContext.contextPath }/main">홈</a>
						</li>
						<sec:authorize access="isAnonymous()">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/member/login">로그인</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/member/join">회원가입<span class="sr-only">(current)</span></a>
							</li>
						</sec:authorize>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.servletContext.contextPath }/cs">고객센터</a>
						</li>
						<sec:authorize access="isAuthenticated()">
							<a class="nav-link" href="javascript:formSubmit()">로그아웃</a>
						</sec:authorize>
					</c:when>
					<c:when test='${param.active == "cs" }'>
						<sec:authorize access="isAuthenticated()">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/main">${user.username }님 안녕하세요.</a>
							</li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/admin">관리자 화면</a>
							</li>
						</sec:authorize>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.servletContext.contextPath }/main">홈</a>
						</li>
						<sec:authorize access="isAnonymous()">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/member/login">로그인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/member/join">회원가입</a>
							</li>
						</sec:authorize>
						<li class="nav-item active">
							<a class="nav-link" href="${pageContext.servletContext.contextPath }/cs">고객센터<span class="sr-only">(current)</span></a>
						</li>
						<sec:authorize access="isAuthenticated()">
							<a class="nav-link" href="javascript:formSubmit()">로그아웃</a>
						</sec:authorize>
					</c:when>					
					<c:otherwise>
						<sec:authorize access="isAuthenticated()">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/main">${user.username }님 안녕하세요.</a>
							</li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/admin">관리자 화면</a>
							</li>
						</sec:authorize>
						<li class="nav-item active">
							<a class="nav-link" href="${pageContext.servletContext.contextPath }/main">홈<span class="sr-only">(current)</span></a>
						</li>
						<sec:authorize access="isAnonymous()">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/member/login">로그인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.servletContext.contextPath }/member/join">회원가입</a>
							</li>
						</sec:authorize>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.servletContext.contextPath }/cs">고객센터</a>
						</li>
						<sec:authorize access="isAuthenticated()">
							<a class="nav-link" href="javascript:formSubmit()">로그아웃</a>
						</sec:authorize>
					</c:otherwise>				
				</c:choose>
			</ul>
		</div>
	</div>
</nav>