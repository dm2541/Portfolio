<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록</title>
<link rel="stylesheet" href="css/style_list.css">
</head>
<body>
	<%@ include file="admin.jsp"%> <br>
	<form action="/productDelete.do" method="post">
		<table border="1">
			<thead>
				<tr>
					<th>선택</th>
					<th>번호</th>
					<th>제품코드</th>
					<th>제품이름</th>
					<th>제품가격</th>
					<th>카테고리</th>
					<th>관리자아이디</th>
					<th>제품이미지</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${productList}" varStatus="status">
					<tr>
						<td><input type="checkbox" name="product_code" value="${product.product_code}"></td>
						<td>${status.count}</td>
						<td><a href="/productUpdate.do?product_code=${product.product_code}">${product.product_code}</a></td>
						<td>${product.product_name}</td>
						<td>${product.product_price}</td>
						<td>${product.category}</td>
						<td>${product.sell_id }</td>
						<td><img src="${product.product_img}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="button"><button type="submit" style="margin-bottom:20px;">삭제</button></div>
	</form>
</body>
</html>