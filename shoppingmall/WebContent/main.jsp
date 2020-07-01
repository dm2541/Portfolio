<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="google-site-verification"
	content="NqB0BDAEWJTvAPCCxzrckJYnS7-xJILFU40FvSmh5S8">
<title>마초맨 - 스트릿패션, 패션잡지, 멀티샵, 중고장터</title>
<link type="text/css" rel="stylesheet" charset="utf-8"
	href="//static.musinsa.com/mfile_outsrc/css/common/normalizer.css?v=9.21384">
<link type="text/css" rel="stylesheet" charset="utf-8"
	href="//static.musinsa.com/mfile_outsrc/css/common/header.css?v=9.21384">
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
<link rel="shortcut icon" href="/favicon.ico?20200213"
	type="image/x-icon">
</head>
<body>
	<%@ include file="fix.jsp" %>

	<div class="wrap page_brand_tab">
		<div class="right_area">
			<form name="" method="get" action="">
				<div class="list-box box">
					<ul
						class="snap-article-list boxed-article-list article-list center list goods_small_media8"
						id="searchList">

						<c:forEach var="product" items="${productList}">
							<li class="li_box" style="height: 250px; margin: 10px;">
								<div class="li_inner" style="height: 250px;">
									<div class="list_img">
										<a
											href="/product_detail.do?product_code=${product.product_code}"
											class="img-block"> 
											<img src="${product.product_img}" style="display: block;">
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
											<fmt:formatNumber var="price"
												value="${product.product_price}" />
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
</html>