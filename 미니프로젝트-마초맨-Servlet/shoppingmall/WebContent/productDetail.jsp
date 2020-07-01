<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세페이지</title>
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/magazine_common.css?20191107_1">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/store_common.css?20200217">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/guide.min.css?20200303">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/sub.css?20200302">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/media_query.css?20191218">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/new.css?20191216">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/jqModal.css?20160119">
</head>
<body>
	<%@ include file="fixLogin.jsp"%>
	<div class="right_contents section_product_summary">
		<div class="product_left">
			<div id="detail_bigimg" class="product_img_basic">
				<div class="product-img">
					<img src="${productBean.product_img}" width="400" title="" id="bigimg">
					<span class="vertical_standard"></span>
				</div>

				<div class="box-btn-smartsearch">
					<a class="btn-smartsearch"> <img
						src="//image.msscdn.net/skin/musinsa/images/icon_smart.gif">
						<img
						src="//image.msscdn.net/skin/musinsa/images/btn_smartsearch.png?20181026">
					</a>
				</div>
			</div>
		</div>

		<div id="product_order_info" class="product_right product_order_info"
			style="padding-left: 12px">
			<div class="explan_product product_info_section">
				<h4 class="title-box font-mss">
					Product Info<span class="korSub">제품정보</span>
				</h4>
				<ul class="product_article">
					<li>
						<p class="product_article_tit">
							<span>-</span>이름 <span class="txt_unit2">/</span> 품번
						</p>
						<p class="product_article_contents">
							<strong><a href="/app/brand/goods_list/nike">${productBean.product_name} </a>
								<span class="txt_unit2">/</span> ${productBean.product_code} </strong>
						</p>
					</li>
				</ul>
			</div>

			<div class="explan_product price_info_section">
				<h4 class="title-box font-mss">
					Price Info<span class="korSub">가격정보</span>
				</h4>
				<ul class="product_article">
					<li id="normal_price" style="display: none;">49900</li>
					<li class="box_info_products">
						<p class="product_article_tit">
							<span>-</span>마초맨 판매가
						</p>
						<p class="product_article_contents">
							<span class="product_article_price" id="goods_price"> 
								<fmt:formatNumber var="price" value="${productBean.product_price}"/>
							<del>${price}</del>
							</span>
							<strong>원</strong> 
							<span class="txt_timesale" id="time_sale_725707"></span>
						</p>
					</li>
					<li class="box_info_products">
						<p class="product_article_tit">
							<span>-</span>마초맨 세일가
						</p>
						<p class="product_article_contents">
							<span class="product_article_price" id="sale_price">
								<fmt:formatNumber var="sale" value="${productBean.product_price*0.9}"/>
								${sale}
							</span> 
							<strong>원</strong> 
							<img src="//image.msscdn.net/skin/musinsa/images/sale_arrow.png"> <span class="txt_kor_discount">10%
								<fmt:formatNumber var="salePrice" value="${productBean.product_price*0.1}"/>
								(-${salePrice}) 할인
							</span>
						</p>
					</li>
				</ul>
				<div class="textbox_red">스토어는 전 상품 무료배송입니다.</div>
				<div class="textbox_black">
					<a href="#">10%할인 이벤트 중!</a>
				</div>

				<form method="get" action="/cartInsert.do">
				<div id="goods_opt_area" class="option_cont">
					<select id="option1" name="count" class="option1">
						<option value="0" selected="selected">수량</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
				</div>
				<div class="box-btn-buy wrap-btn-buy">
					<div class="btn_buy">
						<input class="btn_black" type="submit" value="장바구니"/>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>