<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품수정</title>
<link href="css/style_productList.css" rel="stylesheet">
</head>
<body>
	<%@ include file="admin.jsp" %>
	<div class="productBoxWrap">
		<div class="productBox">
		제품수정
		<form action="/productUpdateDetail.do" method="get">
			<span class="product_code"><input type="text" name="product_code" id="product_code" class="inputV3" value="${productBean.product_code}"></span>
			<span class="product_name"><input type="text" name="product_name" id="product_name" class="inputV3" value="${productBean.product_name}"></span>
			<span class="product_price"><input type="number" name="product_price" id="product_price" class="inputV3" value="${productBean.product_price}"></span>
			<span class="category">
				<input type="text" name="category" id="category" class="inputV3" value="${productBean.category}" readonly>
			</span>
			<span class="product_img"><img src="${productBean.product_img}" style="width:100%; margin-top:20px;"></span>
			<span class="submit"><input type="submit" value="수정" style="margin-botton:20px"></span>
		</form>
		</div>
	</div>

</body>
</html>