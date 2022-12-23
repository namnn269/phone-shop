<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="static/css/common.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>Home</title>
</head>

<body>
	
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container-fluid main">
		<c:set var="curCus" value="${curCustomer}"></c:set>
		<c:if test="${curCus!=null}">
			<p class="card-text">Welcome ${curCus.name}</p>
		</c:if>
		<div class="row justify-content-md-center">
			<c:set var="quantity" value="${quantitySearch}"></c:set>
			<c:if test="${quantity==0}">
				<h3>Không tìm thấy sản phẩm phù hợp!</h3>
			</c:if>
			<div class="col-9">
				<div class="container">
					<!-- so hang -->
					<div class="row">
						<c:if test="${listProduct==null}">
							<jsp:forward page="/"></jsp:forward>
						</c:if>
						<c:forEach items="${listProduct}" var="p" varStatus="rowIndex">
							<div class="col-sm-4">
								<div class="card mb-3">
									<a
										href="/PRJ321x_Project_3_namnn18309/deltail-controller?productId=${p.productId }"><img
										src="${p.imgSource }" class="card-img-top img-product"
										alt="Wild Landscape" /></a>

									<div class="card-body">
										<h5 class="card-title">${p.type }</h5>
										<p class="card-text">${p.productName}</p>
										<p class="card-text">
											<small class="price">${p.price} $</small>
										</p>
									</div>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>

				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:set var="index" value="${active}"></c:set>
						<c:set var="search1" value="${search1}"></c:set>
						<c:if test="${search1=='no1'}">
							<li class="page-item"><a class="page-link"
								href="/PRJ321x_Project_3_namnn18309/list-product?iPage=${index==1?1:index-1}">Previous</a></li>

							<c:forEach var="i3" begin="1" end="${totalPage}">
								<li class="page-item ${i3==index?'active':'' }"><a
									class="page-link"
									href="
								/PRJ321x_Project_3_namnn18309/list-product?iPage=${i3}">${i3}</a></li>
							</c:forEach>
							<li class="page-item"><a class="page-link"
								href="/PRJ321x_Project_3_namnn18309/list-product?iPage=${index==totalPage?totalPage:index+1}">Next</a></li>
						</c:if>
					</ul>
				</nav>


			</div>
			<jsp:include page="sidebar.jsp"></jsp:include>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>