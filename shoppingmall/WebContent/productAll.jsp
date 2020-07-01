<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앙제품띠</title>
</head>
<body>
	<%
		Boolean isLogin = (Boolean)session.getAttribute("isLogin");
	%>
	<c:if test="${isLogin}">
		<%@ include file="mainLogin.jsp" %>
	</c:if>
	<c:if test="${!isLogin}">
		<%@ include file="main.jsp" %>
	</c:if>
	
</body>
</html>