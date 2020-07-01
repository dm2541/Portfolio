<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<link rel="stylesheet" href="css/style_list.css">
</head>
<body>
	<%@ include file="admin.jsp"%>
	<br>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>회원아이디</th>
				<th>회원전화번호</th>
				<th>회원주소</th>
				<th>회원이름</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="customer" items="${customerList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${customer.cust_id}</td>
					<td>${customer.cust_tel}</td>
					<td>${customer.cust_addr}</td>
					<td>${customer.cust_name}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>