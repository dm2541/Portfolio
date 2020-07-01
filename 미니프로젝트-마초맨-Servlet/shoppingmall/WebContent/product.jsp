<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<link rel="shortcut icon" href="/favicon.ico?20200213"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/magazine_common.css?20191107_1">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/store_common.css?20200217">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/style.min.css?20200225">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/sub.css?20200226_1">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/media_query.css?20191218">
</head>
<body>
	<%
		Boolean isLogin = (Boolean) session.getAttribute("isLogin");
	%>
	<c:if test="${isLogin}">
		<%@ include file="fixLogin.jsp"%>
	</c:if>
	<c:if test="${!isLogin}">
		<%@ include file="fix.jsp"%>
	</c:if>
	<div class="wrap page_brand_tab">
		<div class="right_area">
			<form name="" method="get" action="">
				<div class="list-box box">
					<ul
						class="snap-article-list boxed-article-list article-list center list goods_small_media8"
						id="searchList">

						<c:forEach var="product" items="${categoryProductList}">
							<li class="li_box" style="height: 250px; margin: 10px;">
								<div class="li_inner" style="height: 250px;">
									<div class="list_img">
										<a
											href="/product_detail.do?product_code=${product.product_code}"
											class="img-block"> <img class="O_Alpha"
											src="${product.product_img}" 
											style="display: block;">
										</a>
									</div>
									<div class="article_info">
										<p class="list_info">
											<a
												href="/product_detail.do?product_code=${product.product_code}"
												title="${product.product_name} / ${product.product_code}">
												${product.product_name} / ${product.product_code}</a>
										</p>
										<p class="price">
											<fmt:formatNumber var="price" value="${product.product_price}" />
											<del>${price}원</del>
											<c:set var="sale" value="${product.product_price*0.9}" />
											<fmt:formatNumber var="salePrice" value="${sale}" />
											${salePrice}원
										</p>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</form>
		</div>
	</div>
</body>
</body>
</html>