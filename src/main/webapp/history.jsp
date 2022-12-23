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
<title>History</title>
</head>

<body>







	<section class="h-100 h-custom" style="background-color: #d2c9ff;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12">
					<div class="card card-registration card-registration-2"
						style="border-radius: 15px;">
						<div class="card-body p-0">
							<div class="row g-0">
								<div class="col-lg-12">
									<div class="p-5">
										<div
											class="d-flex justify-content-between align-items-center mb-5">
											<h1 class="fw-bold mb-0 text-black">History</h1>
										</div>
										<hr class="my-4">


										<c:set var="listHistoryOders" value="${historyOrders}"></c:set>
										<c:forEach items="${listHistoryOders}" var="historyOrder"
											varStatus="i">
											<div
												class="row mb-4 d-flex justify-content-between align-items-center">
												<div class="col-md-2 col-lg-2 col-xl-2">
													<img src="${historyOrder.imgSource }"
														class="img-fluid rounded-5" alt="Cotton T-shirt">
												</div>
												<div class="col-md-3 col-lg-3 col-xl-3">
													<h6 class="text-muted">${historyOrder.name}</h6>
													<h6 class="text-black mb-0">${historyOrder.type}</h6>
												</div>
												<div class="col-md-1 col-lg-1 col-xl-1 d-flex">

													<p style="width: 50px"
														class="form-control form-control-sm input-quantity">
														${historyOrder.amount}</p>
												</div>
												<div style="margin-bottom: 16px;"
													class="col-md-2 col-lg-2 col-xl-2 offset-lg-1 total-money">
													<h6 class="mb-0 price">$${historyOrder.price}</h6>
												</div>
												<div class="col-md-3 col-lg-3 col-xl-3 d-flex">
													<p>${historyOrder.date }</p>
												</div>
											</div>
											<hr class="my-4">
										</c:forEach>





										<div class="pt-5">
											<h5 class="fw-bold mb-5"
												style="position: absolute; bottom: 0;">
												<a href="home.jsp"><i class="fas fa-angle-left me-2"></i>Back
													to shopping</a>
											</h5>
										</div>
									</div>
								</div>





							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>