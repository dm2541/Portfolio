<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
<link type="text/css" rel="stylesheet" charset="utf-8"
	href="//static.musinsa.com/mfile_outsrc/css/common/normalizer.css?v=9.21384">
<link type="text/css" rel="stylesheet" charset="utf-8"
	href="//static.musinsa.com/mfile_outsrc/css/common/header.css?v=9.21384">


<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/magazine_common.css?20200304121800">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/store_common.css?20200304121800">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/guide.min.css?20200304121800">
</head>
<body>

	<%@ include file="fixLogin.jsp"%>

	<div class="right_area" id="page_cart">
		<input type=hidden name="popup" /> <input type=hidden
			name="logged_in" value="" />
		<div class="right_contents">
			<div class="cart_process">
				<span class="cart_pagenation_on">장바구니</span> <span
					class="back_arrow"></span> <span class="cart_pagenation">결제</span>
			</div>
		</div>

		<div class="section_container_mypage">

			<p class="title_s">상품 목록</p>
			<!--cart products-->
			<table class="table_basic cart_table">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">이미지</th>
						<th scope="col">상품명</th>
						<th scope="col">상품코드</th>
						<th scope="col">판매가</th>
						<th scope="col">수량</th>
						<th scope="col">상품관리</th>
				</thead>
				<tbody>
					<c:if test="${empty cartList}">
						<tr>
							<td colspan="9" class="empty_cart">장바구니에 담긴 상품이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="abc" items="${cartList}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td><img src="${abc.product_img}" width=100px height=120px></td>
							<td>${abc.product_name}</td>
							<td>${abc.product_code}</td>
							<td>${abc.product_price}</td>
							<td>${abc.count}개</td>
							<td><a href="/cartDelete.do?num=${abc.num}">상품삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="table_basic cart_table">
				<tbody style="font-size: 20px;">
					<tr>
						<td>최종 결제금액 ${priceSum}원</td>
					</tr>
				</tbody>
			</table>
			<div style="float:center;"class="m-btn-set cart_btn"><a href="/buyList.jsp" class="m-btn btn-accent">결제하기</a></div>
		</div>		
	</div>
</body>
</html>