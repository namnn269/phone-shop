<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/login.css"
	type="text/css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>Login form</title>
</head>
<body>

	<%
	String errorMsg = (String) request.getAttribute("error");
	errorMsg = errorMsg == null ? "" : errorMsg;

	String email = (String) request.getAttribute("email");

	Cookie[] cookies = request.getCookies();
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("username")) {
			email = cookie.getValue();
		}
	}
	email = email == null ? "" : email;
	%>

	<section class="vh-100">
		<div class="container-fluid h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-9 col-lg-6 col-xl-5">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
						class="img-fluid" alt="Sample image">
				</div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1" id="form">
					<form onsubmit="return checkEmpty()"
						action="/PRJ321x_Project_3_namnn18309/login" method="post">
						<!-- Email input -->
						<div class="form-outline mb-4">
							<label class="form-label" for="form3Example3">Email
								address</label> <input type="email" value="<%=email %>"
								class="form-control form-control-lg" id="email"
								placeholder="Enter a valid email address" name="emailForm" />
						</div>

						<!-- Password input -->
						<div class="form-outline mb-3">
							<label class="form-label" for="form3Example4">Password</label> <input
								type="password" class="form-control form-control-lg "
								id="password" placeholder="Enter password" name="passwordForm" />
						</div>

						<div class="d-flex justify-content-between align-items-center">
							<!-- Checkbox -->
							<div class="form-check mb-0">
								<input class="form-check-input me-2" type="checkbox"
									value="remember" id="form2Example3" name="check-remember" /> <label
									class="form-check-label" for="form2Example3"> Remember
									me </label>
							</div>
							<a href="#!" class="text-body">Forgot password?</a>
						</div>
						<p class="error"><%=errorMsg %>
							<span class="msg error"></span>
						</p>

						<div class="text-center text-lg-start mt-4 pt-2">
							<button type="submit" class="btn btn-primary btn-md sub-btn"
								style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>

							<a href="home.jsp" class="btn btn-danger btn-md cancel-btn"
								style="padding-left: 2.5rem; padding-right: 2.5rem;">Cancel</a>
						</div>
					</form>
				</div>
			</div>
		</div>

	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="static/js/CheckForm.js"></script>
</body>
</html>