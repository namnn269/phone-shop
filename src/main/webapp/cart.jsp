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
<!-- CSS only -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>Chi tiết sản phẩm</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<c:set var="curCustomer" value="${curCustomer}"></c:set>
	<c:set var="cart" value="${curCart}"></c:set>

	<section class="h-100 h-custom" style="background-color: #d2c9ff;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12">
					<div class="card card-registration card-registration-2"
						style="border-radius: 15px;">
						<div class="card-body p-0">
							<div class="row g-0">
								<div class="col-lg-7">
									<div class="p-5">
										<div
											class="d-flex justify-content-between align-items-center mb-5">
											<h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
										</div>
										<hr class="my-4">
										<form action="update-cart" method="get">
											<c:forEach items="${cart.listItem}" var="detailOrder"
												varStatus="i">
												<div
													class="row mb-4 d-flex justify-content-between align-items-center">
													<div class="col-md-2 col-lg-2 col-xl-2">
														<img src="${detailOrder.product.imgSource }"
															class="img-fluid rounded-3" alt="Cotton T-shirt">
													</div>
													<div class="col-md-3 col-lg-3 col-xl-3">
														<h6 class="text-muted">${detailOrder.product.productName}</h6>
														<h6 class="text-black mb-0">${detailOrder.product.type}</h6>
													</div>
													<div class="col-md-3 col-lg-3 col-xl-2 d-flex">
														<button class="btn btn-link px-2 down-btn" type="button"
															onclick="this.parentNode.querySelector('input[type=number]').stepDown(), changeMoney()">
															<i class="fas fa-minus"></i>
														</button>
														<input type="hidden" name="id"
															value="${detailOrder.product.productId}" /> <input
															id="item${i.index}" min="0" name="quantity"
															value="${detailOrder.amount}" style="width: 50px"
															type="number"
															class="form-control form-control-sm input-quantity"
															onchange="changeMoney()" />
														<button class="btn btn-link px-2 up-btn" type="button"
															onclick="this.parentNode.querySelector('input[type=number]').stepUp(), changeMoney()">
															<i class="fas fa-plus"></i>
														</button>
													</div>
													<div
														class="col-md-3 col-lg-2 col-xl-2 offset-lg-1 total-money">
														<h6 class="mb-0 price">$${detailOrder.price}</h6>
													</div>
													<div class="col-md-1 col-lg-1 col-xl-1 text-end">
														<a
															href="delete-product-in-cart?id=${detailOrder.product.productId}"
															class="text-muted delete"><i class="fa fa-trash"
															aria-hidden="true"></i></a>
													</div>
												</div>
												<hr class="my-4">
											</c:forEach>
											<div class="col-md-12 col-lg-8 col-xl-5 offset-lg-3">
												<h5 class="mb-0">
													<c:if test="${curCart!=null && curCart.listItem.size()!=0}">
												Total: <span class="totalMoney">$${totalMoney}</span>
														<span><a href="">
																<button type="submit" class="btn btn-primary">Xác
																	nhận thay đổi</button>
														</a> </span>
													</c:if>
												</h5>
											</div>
										</form>
										<div class="pt-5">
											<h5 class="fw-bold mb-5"
												style="position: absolute; bottom: 0;">
												<a href="home.jsp"><i class="fas fa-angle-left me-2"></i>Back
													to shopping</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="col-lg-5 px-5 py-4">
									<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">Payment</h3>
									<form onsubmit='return checkFormUser()' class="mb-5"
										action="do-buy" method="post">
										<div class="form-outline mb-4">
											<input name="fullname" type="text" id="typeName"
												value="${curCustomer.name}"
												class="form-control form-control-lg" required="required" />
											<label class="form-label" for="typeName">Họ và tên <span
												style="color: red">*</span>
											</label>
										</div>
										<div class="form-outline mb-4">
											<input name="phonenumber" type="text" id="phonenum"
												value="${curCustomer.phone}"
												class="form-control form-control-lg" required="required" />
											<label class="form-label" for="phonenum">Số điện
												thoại <span style="color: red">*</span>
											</label>
											<p class="msg" style="color: red"></p>
										</div>
										<div class="form-outline mb-4">
											<input name="email" type="email" id="email"
												value="${curCustomer.userMail }"
												class="form-control form-control-lg" required="required" />
											<label class="form-label" for="email">Email <span
												style="color: red">*</span></label>
										</div>
										<div class="row">
											<div class="col-md-12 mb-4">
												<div class="form-outline">
													<input name="address" type="text" id="typeExp"
														class="form-control form-control-lg" id="exp"
														value="${curCustomer.address}" required="required" /> <label
														class="form-label" for="typeExp">Địa chỉ <span
														style="color: red">*</span></label>
												</div>
											</div>
										</div>
										<input type="hidden" name="register" value="no" />
										<button type="submit" class="btn btn-primary btn-block btn-lg">Buy
											now</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script src="static/js/cart.js"></script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>