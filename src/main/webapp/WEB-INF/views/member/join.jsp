<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
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
	<style>
		@media(min-width: 768px) {
		  .field-label-responsive {
		    padding-top: .5rem;
		    text-align: right;
		  }
		}
	</style>
</head>
<body>
	<!-- Navigation -->
	<c:import url='/WEB-INF/views/includes/navigation.jsp'>
		<c:param name="active" value="join" />
	</c:import>
	<!-- /.Navigation -->

 	<div class="container">
		<form:form class="form-horizontal" role="form" method="POST" action="/member/join">
	        <div class="row">
	            <div class="col-md-3"></div>
	            <div class="col-md-6">
	                <h2>Register New User</h2>
	                <hr>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-3 field-label-responsive">
	                <label for="email">아이디</label>
	            </div>
	            <div class="col-md-6">
	                <div class="form-group">
	                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
	                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
	                        <input type="text" name="id" class="form-control" id="id"
	                               placeholder="아이디" required autofocus>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="form-control-feedback">
	                        <span class="text-danger align-middle">
	                            <!-- Put e-mail validation error messages here -->
	                        </span>
	                </div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-3 field-label-responsive">
	                <label for="password">비밀번호</label>
	            </div>
	            <div class="col-md-6">
	                <div class="form-group has-danger">
	                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
	                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
	                        <input type="password" name="password" class="form-control" id="password"
	                               placeholder="Password" required>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="form-control-feedback">
	                        <span class="text-danger align-middle">
	                        </span>
	                </div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-3 field-label-responsive">
	                <label for="name">이름</label>
	            </div>
	            <div class="col-md-6">
	                <div class="form-group">
	                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
	                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
	                        <input type="text" name="name" class="form-control" id="name"
	                               placeholder="이름" required autofocus>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="form-control-feedback">
	                        <span class="text-danger align-middle">
	                            <!-- Put name validation error messages here -->
	                        </span>
	                </div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-3 field-label-responsive">
	                <label for="name">생년월일</label>
	            </div>
	            <div class="col-md-6">
	                <div class="form-group">
	                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
	                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
	                        <input type="date" name="birth" class="form-control" id="birth"
	                               required autofocus>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="form-control-feedback">
	                        <span class="text-danger align-middle">
	                            <!-- Put name validation error messages here -->
	                        </span>
	                </div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-3 field-label-responsive">
	                <label for="name">성별</label>
	            </div>
	            <div class="col-md-6">
	                <div class="form-group">
	                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
	                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
	                        <div class="form-check-inline">
		                        <input type="radio" class="form-check-input" name="gender" value="m"> 남
		                        <input type="radio" class="form-check-input" name="gender" value="f" style="margin-left: 20px"> 여
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="form-control-feedback">
	                        <span class="text-danger align-middle">
	                            <!-- Put name validation error messages here -->
	                        </span>
	                </div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-3 field-label-responsive">
	                <label for="name">이메일</label>
	            </div>
	            <div class="col-md-6">
	                <div class="form-group">
	                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
	                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
	                        <input type="text" name="email" class="form-control" id="email"
	                               placeholder="이메일" required autofocus>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="form-control-feedback">
	                        <span class="text-danger align-middle">
	                            <!-- Put name validation error messages here -->
	                        </span>
	                </div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-3 field-label-responsive">
	                <label for="name">전화번호</label>
	            </div>
	            <div class="col-md-6">
	                <div class="form-group">
	                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
	                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
	                        <input type="text" name="phone" class="form-control" id="phone"
	                               placeholder="전화번호" required autofocus>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="form-control-feedback">
	                        <span class="text-danger align-middle">
	                            <!-- Put name validation error messages here -->
	                        </span>
	                </div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-3 field-label-responsive">
	                <label for="name">주소</label>
	            </div>
	            <div class="col-md-6">
	                <div class="form-group">
	                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
	                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
	                        <input type="text" name="address" class="form-control" id="address"
	                               placeholder="주소" required autofocus>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="form-control-feedback">
	                        <span class="text-danger align-middle">
	                            <!-- Put name validation error messages here -->
	                        </span>
	                </div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-5"></div>
	            <div class="col-md-5">
	                <button type="submit" class="btn btn-success"><i class="fa fa-user-plus"></i> 가입</button>
	            </div>
	        </div>
	    </form:form>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<c:import url='/WEB-INF/views/includes/footer.jsp' />
	<!-- /.Footer -->
</body>
</html>