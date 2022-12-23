<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="static/css/common.css">
<link rel="stylesheet" href="static/css/detail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<title>Chi tiết sản phẩm</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<c:set var="detail" value="${detailProduct}" scope="page"></c:set>
	<!-- Navigation-->
	<form class="d-flex flex-row-reverse mt-5" action="">
		<a href="cart.jsp">
			<button class="btn btn-outline-dark btn-cart" type="button">
				<i class="fa fa-shopping-cart" style="font-size: 100px"></i> Cart
			</button>
		</a>
	</form>


	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0" src="${detail.imgSource}"
						alt="${img.productName}" />
				</div>
				<div class="col-md-6">
					<h2 class="display-5 fw-bolder">${detail.productName}</h2>
					<div class="fs-5 mb-5">
						<span class="">$${detail.price}</span>
					</div>
					<p class="lead">${detail.description}</p>
					<form action="/PRJ321x_Project_3_namnn18309/cart-controller"
						method="post">
						<input type="hidden" value="${detail.productId}" name="productId" />
						<div class="d-flex">
							<input class="form-control text-center me-3" id="inputQuantity"
								type="number" min="1" value="1" name="quantity" style="max-width: 3rem" />
							<button class="btn btn-outline-dark flex-shrink-0" type="submit">
								<i class="bi-cart-fill me-1"></i> Add to cart
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="static/js/detail.js"></script>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>