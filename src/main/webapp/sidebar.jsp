<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<body>
	<c:set var="curCus" value="${curCustomer}"></c:set>
	<div class=col-3>


		<form class="d-flex flex-column  mb-3" action="history" method="post">
			<a href="cart.jsp" class="cart">
				<button class="btn btn-outline-dark btn-cart" type="button">
					<i class="fa fa-shopping-cart" style="font-size: 100px"></i> Cart
				</button>
			</a>
			<c:if test="${curCus!=null}">
				<button class="btn btn-outline-primary card-text">Lịch sử
					mua hàng</button>
			</c:if>
		</form>

		<div class="card mb-3">
			<h3 class="card-body">Shopping cart</h3>
			<img class="card-body"
				src="https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-600x600.jpg"
				class="card-img-top" alt="Wild Landscape" /> <img class="card-body"
				src="https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg"
				class="card-img-top" alt="Wild Landscape" /> <img class="card-body"
				src="https://cdn.tgdd.vn/Products/Images/42/210654/iphone-11-pro-max-512gb-gold-600x600.jpg"
				class="card-img-top" alt="Wild Landscape" />
			
		</div>


	</div>
</body>
