<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../static/css/admin.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>Quản trị admin</title>
</head>
<body>
	<%
	String username = (String) session.getAttribute("user");
	username = username == null ? "" : username;
	%>
	<nav class="navbar navbar-default no-margin">

		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header fixed-brand">

			<a class="navbar-brand" href="#"><i class="fa fa-rocket fa-4"></i>
				Welcome <br> <%=username%></a>
		</div>

		<!-- bs-example-navbar-collapse-1 -->
		<form action="../logout" method="post">
			<input type="hidden" name="action" value="logout" />
			<button type="submit" class="btn btn-primary ">Log out</button>
		</form>
	</nav>
	<div id="wrapper">
		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav nav-pills nav-stacked" id="menu">
				<li class="active"><a href="#"><span
						class="fa-stack fa-lg pull-left"><i
							class="fa fa-dashboard fa-stack-1x "></i></span> Dashboard</a></li>
				<li class="active"><a href="#"><span
						class="fa-stack fa-lg pull-left"><i
							class="fa fa-dashboard fa-stack-1x "></i></span> Staff Manager</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid xyz">
				<div class="row">
					<div class="col-lg-12">
						<table class="table ">
							<thead>
								<tr>
									<th scope="col" class="col-1">ID</th>
									<th scope="col" class="col-3">Name</th>
									<th scope="col" class="col-3">Student ID</th>
									<th scope="col" class="col-3">Class</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Member 1</td>
									<td>Member code 1</td>
									<td>class 1</td>
								</tr>

								<tr class="table-secondary">
									<th scope="row">2</th>
									<td>Member 2</td>
									<td>Member code 2</td>
									<td>Class 2</td>
								</tr>
								<tr>
									<th scope="row">1</th>
									<td>Member 1</td>
									<td>Member code 1</td>
									<td>class 1</td>
								</tr>

								<tr class="table-secondary">
									<th scope="row">2</th>
									<td>Member 2</td>
									<td>Member code 2</td>
									<td>Class 2</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->
	</div>
	<script type="text/javascript" src="../static/js/admin.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>