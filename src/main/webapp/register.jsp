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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>Chi tiết sản phẩm</title>
</head>
<body>

	<section class="vh-100" style="background-color: #eee;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<a class="btn btn-secondary btn-md" href="list-product">Go
								Home</a>
							<div class="row justify-content-center">
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign
										up</p>
									<form onsubmit="return checkRegister()" class="mx-1 mx-md-4"
										action="register" method="post">

										<div class="d-flex flex-row align-items-center mb-4">
											<div class="form-outline flex-fill mb-0">
												<input type="text" id="form3Example1c" class="form-control"
													value="${fullnameregister }" name="fullnameregister"
													required="required" /> <label class="form-label"
													for="form3Example1c">Họ tên</label>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<div class="form-outline flex-fill mb-0">
												<input onkeyup="checkRegister()" type="text" id="phone" class="form-control"
													value="${phoneregister }" name="phoneregister"
													required="required" /> <label class="form-label"
													for="phone">Số điện thoại</label>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<div class="form-outline flex-fill mb-0">
												<input type="text" id="address" class="form-control"
													value="${addressregister }" name="addressregister"
													required="required" /> <label class="form-label"
													for="address">Địa chỉ</label>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<div class="form-outline flex-fill mb-0">
												<input type="email" id="form3Example3c" class="form-control"
													value="${emailregister }" name="emailregister"
													required="required" /> <label class="form-label"
													for="form3Example3c">Email</label>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<div class="form-outline flex-fill mb-0">
												<input type="password" id="password" class="form-control"
													name="passwordregister" required="required"
													onkeyup="checkRegister()" /> <label class="form-label"
													for="password">Mật khẩu</label>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<div class="form-outline flex-fill mb-0">
												<input type="password" id="password2" class="form-control"
													name="passwordregister2" required="required"
													onkeyup="checkRegister()" /> <label class="form-label"
													for="password2">Nhập lại mật khẩu</label>
											</div>
										</div>
										<p class="msg" style="color: red">${registererror}</p>
										
										<input type="hidden" name="register" value="yes"/>

										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button type="submit" class="btn btn-primary btn-lg">Register</button>
										</div>


									</form>

								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
										class="img-fluid" alt="Sample image">

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="static/js/checkRegister.js"></script>
</body>
</html>