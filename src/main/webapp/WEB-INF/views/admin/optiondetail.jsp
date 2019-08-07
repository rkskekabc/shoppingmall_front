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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Shop Homepage - Start Bootstrap Template</title>
<script src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery.js" ></script>
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
					<h2>${vo.name }</h2>
				</div>
				<form:form id="form" method="post" action="/admin/optiondetail" modelAttribute="optionDetailInfoDtoForm" >
					<table>
						<tr>
							<th>상위카테고리</th>
							<th>하위카테고리</th>
							<th>옵션명1</th>
							<th>옵션값1</th>
							<th>옵션명2</th>
							<th>옵션값2</th>
							<th>재고</th>
						</tr>
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
					</table>
					<input type="submit" value="저장" />
				</form:form>
				
				<table>
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