<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세등록</title>
<link href="css/style_productList.css" rel="stylesheet">
</head>
<body>
	<%String img_path = (String)session.getAttribute("img_path"); %>
	<%@ include file="admin.jsp"%> <br>
	<div class="productBoxWrap">
		<div class="productBox">
		제품등록
		<form action="/productInsert.do" method="post">
			<span class="product_code"><input type="text" name="product_code" id="product_code" class="inputV3" placeholder="제품코드를 입력해 주세요."></span>
			<span class="product_name"><input type="text" name="product_name" id="product_name" class="inputV3" placeholder="제품이름을 입력해 주세요."></span>
			<span class="product_price"><input type="number" name="product_price" id="product_price" class="inputV3" placeholder="제품가격을 입력해 주세요."></span>
			<span class="category">
				<select class="inputV3" name="category" id="category">
					<option value="">카테고리</option>
					<option value="Outer">Outer</option>
					<option value="Top">Top</option>
					<option value="Bottom">Bottom</option>
					<option value="Etc">Etc</option>
				</select>
			</span>
			<span class="product_img"><img src="<%=img_path%>" style="width:100%; margin-top:20px;"></span>
			<span class="submit"><input type="submit" value="등록" style="margin-botton:20px"></span>
		</form>
		</div>
	</div>
</body>
</html>