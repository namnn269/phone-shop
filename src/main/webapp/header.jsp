<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="static/css/header.css" />
  </head>
  <body>
    <header>
      <% String url = request.getScheme() + "://" + request.getServerName() +
      ":" + request.getServerPort() + request.getContextPath(); %>
      <!-- Background image -->
      <div
        class="p-5 text-center bg-image"
        style="
          background-image: url('<%=url%>/static/img/header.jpg');
          height: 400px;
        "
      >
        <div class="mask" style="background-color: rgba(0, 0, 0, 0.6)">
          <div class="d-flex justify-content-center align-items-center h-200">
            <div class="text-white">
              <h1 class="mb-3">Thế Giới Di Động</h1>
              <h4 class="mb-3">Trải Nghiệm Công Nghệ</h4>
              <!-- <a class="btn btn-outline-light btn-lg" href="#!" role="button">Call
							to action</a> -->
            </div>
          </div>
        </div>
      </div>
      <!-- Background image -->
    </header>

    <!-- navbar-search -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <img
                class="logo-nav"
                alt=""
                src="<%=url%>/static/img/logo/logo.png"
              />
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="home.jsp"
                >Home</a
              >
            </li>
            <li class="nav-item"><a class="nav-link" href="#">Product</a></li>
            <li class="nav-item"><a class="nav-link" href="#">About us</a></li>
          </ul>

          <form action="search-product" method="post" class="d-flex">
            <input
              class="form-control me-2"
              type="search"
              placeholder="Search"
              value="${keySearch}"
              name="searchForm"
              aria-label="Search"
            />
            <button class="btn btn-primary" type="submit">Search</button>
          </form>
          <a href="login.jsp" class="btn btn-outline-primary">Log in</a>
          <a href="register.jsp" class="btn btn-outline-primary">Register</a>

          <form action="logout" method="post">
            <input type="hidden" name="action" value="logout" />
            <button class="btn btn-outline-primary">Logout</button>
          </form>
        </div>
      </div>
    </nav>
    <!-- navbar-search -->
  </body>
</html>
