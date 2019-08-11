<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Tables</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.servletContext.contextPath }/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.servletContext.contextPath }/assets/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.servletContext.contextPath }/assets/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

  <c:import url='/WEB-INF/views/admin/includes/navigation.jsp' />

  <div id="wrapper">

    <!-- Sidebar -->
	<c:import url='/WEB-INF/views/admin/includes/menubar.jsp'>
		<c:param name="active" value="productadd" />
	</c:import>

    <div id="content-wrapper">

      <div class="container-fluid">
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	상품 등록</div>
          <div class="card-body">
            <div class="table-responsive">
				<c:if test="${result == 'success' }">
					<div class="alert alert-success" role="alert">
					  등록 성공
					</div>
				</c:if>
				<c:if test="${result == 'fail' }">
					<div class="alert alert-danger" role="alert">
					  등록 실패
					</div>
				</c:if>
				
				<form id="form" method="post" action="/admin/product?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
					<div class="inputArea">
						<label for="type">상품종류</label>
						<input type="text" id="type" name="type" />
					</div>

					<div class="inputArea">
						<label for="name">상품명</label>
						<input type="text" id="name" name="name" />
					</div>

					<div class="inputArea">
						<label for="price">상품가격</label>
						<input type="text" id="price" name="price" />
					</div>

					<div class="inputArea">
						<label for="price">썸네일</label>
						<input type="file" id="thumbnail" name="thumbnail" />
					</div>

					<div class="inputArea">
						<label for="explanation">상품설명</label>
						<textarea rows="5" cols="50" id="explanation" name="explanation"></textarea>
					</div>

					<div class="inputArea">
						<input type="submit" id="register_Btn" class="btn btn-primary" value="등록" />
					</div>
				</form>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

        <p class="small text-center text-muted my-5">
          <em>More table examples coming soon...</em>
        </p>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>

</body>

</html>
