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

	<script src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery.js" ></script>
	<script>
		function categoryChange(index){
			var cate2Arr = new Array();
			var cate2Obj = new Object();
			var jsonData = JSON.parse('${childCategories }');
			
			for(var i=0; i<jsonData.length; i++){
				cate2Obj = new Object();
				cate2Obj.no = jsonData[i].no;
				cate2Obj.name = jsonData[i].name;
				cate2Obj.parentNo = jsonData[i].parentNo;
				
				cate2Arr.push(cate2Obj);
			}
			
			var cate2Select = $("select.category2").eq(index);
			cate2Select.removeAttr("disabled");
			cate2Select.children().remove();
			
			var selectVal = $("select.category1:eq(" + index + ") option:selected").val();
			if(selectVal == 0){
				cate2Select.children().remove();
				cate2Select.append("<option value='0'>선택</option>");
				cate2Select.attr("disabled", "disabled");
			} else {
				for(var i = 0; i < cate2Arr.length; i++) {
					if(selectVal == cate2Arr[i].parentNo) {
						cate2Select.append("<option value='" + cate2Arr[i].no + "'>" + cate2Arr[i].name + "</option>");
					}
				}
			}
		}
		
		
		function optionParentChange(index, num){
			var optionChild1Arr = new Array();
			var optionChild1Obj = new Object();
			var jsonData = JSON.parse('${optionChilds }');
			
			for(var i=0; i<jsonData.length; i++){
				optionChild1Obj = new Object();
				optionChild1Obj.no = jsonData[i].no;
				optionChild1Obj.name = jsonData[i].name;
				optionChild1Obj.optionParentNo = jsonData[i].optionParentNo;
				
				optionChild1Arr.push(optionChild1Obj);
			}
		
			var optionChild1Select = $("select.optionChild" + num).eq(index);
			optionChild1Select.removeAttr("disabled");
			optionChild1Select.children().remove();
			
			var selectVal = $("select.optionParent" + num + ":eq(" + index + ") option:selected").val();
		
			if(selectVal == 0){
				optionChild1Select.children().remove();
				optionChild1Select.append("<option value='0'>선택</option>");
				optionChild1Select.attr("disabled", "disabled");
			} else {
				for(var i = 0; i < optionChild1Arr.length; i++) {
					if(selectVal == optionChild1Arr[i].optionParentNo) {
						optionChild1Select.append("<option value='" + optionChild1Arr[i].no + "'>" + optionChild1Arr[i].name + "</option>");
					}
				}
			}
		}
	</script>
</head>

<body id="page-top">

  <c:import url='/WEB-INF/views/admin/includes/navigation.jsp' />

  <div id="wrapper">

    <!-- Sidebar -->
	<c:import url='/WEB-INF/views/admin/includes/menubar.jsp'>
		<c:param name="active" value="option" />
	</c:import>

    <div id="content-wrapper">

      <div class="container-fluid">
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	${vo.name } - 상품옵션 관리</div>
          <div class="card-body">
            <div class="table-responsive">
				<c:if test="${result == 'success' }">
					등록 성공
				</c:if>
				<c:if test="${result == 'fail' }">
					등록 실패
				</c:if>
				
				<form:form id="form" method="post" action="/admin/optiondetail" modelAttribute="optionDetailInfoDtoForm" >
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>상위카테고리</th>
								<th>하위카테고리</th>
								<th>옵션명1</th>
								<th>옵션값1</th>
								<th>옵션명2</th>
								<th>옵션값2</th>
								<th>재고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${optionDetailInfoDtoForm.optionDetailInfoDtos}" var="optionDetailInfoDto" varStatus="status">
								<tr>
									<td>
										<select class="category1" onchange="categoryChange(${status.index})">
											<option value="0">선택</option>
											<c:forEach items="${parentCategories }" var="parentCategory">
												<option value="${parentCategory.no }">${parentCategory.name }</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<select class="category2" name="optionDetailInfoDtos[${status.index}].categoryNo" disabled>
											<option value="0">선택</option>
										</select>
									</td>
									<td>
										<select class="optionParent1" name="optionDetailInfoDtos[${status.index}].optionParentNo1" onchange="optionParentChange(${status.index}, 1)">
											<option value="0">선택</option>
											<c:forEach items="${optionParents }" var="optionParent">
												<option value="${optionParent.no }">${optionParent.name }</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<select class="optionChild1" name="optionDetailInfoDtos[${status.index}].optionChildNo1" disabled>
											<option value="0">선택</option>
										</select>
									</td>
									<td>
										<select class="optionParent2" name="optionDetailInfoDtos[${status.index}].optionParentNo2" onchange="optionParentChange(${status.index}, 2)">
											<option value="0">선택</option>
											<c:forEach items="${optionParents }" var="optionParent">
												<option value="${optionParent.no }">${optionParent.name }</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<select class="optionChild2" name="optionDetailInfoDtos[${status.index}].optionChildNo2">
											<option value="0">선택</option>
										</select>
									</td>
									<td><input name="optionDetailInfoDtos[${status.index}].stock" value="${optionDetailInfoDto.stock}"/></td>
								</tr>
								<form:hidden path="optionDetailInfoDtos[${status.index}].productNo" name="productNo" id="productNo" value="${vo.no }" />
							</c:forEach>
						</tbody>
					</table>
					<input type="submit" value="저장" />
				</form:form>
				
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="margin-top: 100px">
					<thead>
						<tr>
							<th>카테고리명</th>
							<th>옵션명1</th>
							<th>옵션값1</th>
							<th>옵션명2</th>
							<th>옵션값2</th>
							<th>재고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${optionDetailInfoDtoList }" var="list">
							<tr>
								<td>${list.categoryName }</td>
								<td>${list.optionParentName1 }</td>
								<td>${list.optionChildName1 }</td>
								<td>${list.optionParentName2 }</td>
								<td>${list.optionChildName2 }</td>
								<td>${list.stock }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
