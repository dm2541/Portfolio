<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<span class="cart_pagenation">장바구니</span> <span class="back_arrow"></span>
				<span class="cart_pagenation_on">결제</span>
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
						</tr>
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
										<td>${abc.product_price} </td>
										<td>${abc.count}개</td>	
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
					
		</div>


		<div class="mypage-wrap">

			<form action="update.do" method="post">
				<div class="mypage-area">
					<section class="mypage-cont">
					

						<section class="n-section-block">
							<header class="n-section-title first">
								<h1 class="tit">
									배송 정보 <span>(회원정보)</span>
								</h1>
							</header>

							<table class="n-table table-row my-info-modify">
								<colgroup>
									<col style="width: 190px">
									<col style="width: *">
									<col style="width: 50%">
								</colgroup>

								<tbody>
									<tr>
										<th scope="row">아이디</th>
										<td colspan="2"><strong> <input type="text"
												name="cust_id" id="cust_id" value="${customerList.cust_id}"
												readonly="readonly" />
										</strong></td>
									</tr>

									<tr>
										<th scope="row">이름(실명)</th>
										<td colspan="2"><strong> <input type="text"
												name="cust_name" id="cust_name"
												value="${customerList.cust_name}" />
										</strong></td>
									</tr>
									<tr>
										<th scope="row">주소</th>
										<td colspan="2"><strong> <input type="text"
												name="cust_addr" id="cust_addr"
												value="${customerList.cust_addr}" />
										</strong></td>
									</tr>

									<tr>
										<th scope="row">전화번호</th>
										<td colspan="2"><strong> <input type="text"
												name="cust_tel" id="cust_tel"
												value="${customerList.cust_tel}" />
										</strong></td>
									</tr>
								</tbody>
							</table>
						</section>
					</section>
				</div>
			</form>
		</div>

		<div class="m-btn-set cart_btn">
			<a href="/buy.do" class="m-btn btn-accent" onclick="alert('주문이 완료되었습니다.')">주문하기</a>
		</div>
	</div>
</body>
</html>