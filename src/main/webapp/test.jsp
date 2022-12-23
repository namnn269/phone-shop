<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	

	<c:if test="${username!=null }">
		<p> ${username} </p>
	</c:if>

	<% request.getCookies(); %>

	<c:forEach var="x" begin="1" end="10">
		<c:out value="${x}"></c:out>
	</c:forEach>

	<jsp:useBean id="account" class="funix.nam.model.Account" scope="application"></jsp:useBean>
	<jsp:setProperty property="name" name="account" value="nam2" />
	<jsp:setProperty property="password" name="account" value="password2" />

	<p>
		<jsp:getProperty property="name" name="account" />
	</p>

</body>
</html>