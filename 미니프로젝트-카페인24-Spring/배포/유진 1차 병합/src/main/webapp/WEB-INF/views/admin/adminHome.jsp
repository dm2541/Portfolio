<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<ul>
	<li><a href="">매장목록 </a></li>
</ul>
<body>

	<script>
		$(document).ready(function() {
			//상품등록 

			$("#addBtn").click(function() {
				var product_code = $("#product_code")
				var cafe_code = $("#cafe_code")
				var product_name = $("#product_name")
				var product_type = $("#product_type")
				var product_price = $("#product_price")

				if (product_code == "") {
					alert("상품코드를 입력해주세요");
					product_code.foucs();
				} else if (cafe_code == "") {
					alert("카페코드를 입력해주세요");
					cafe_code.foucs();
				} else if (product_name == "") {
					alert("상품이름을 입력해주세요");
					product_name.foucs();

				} else if (product_type == "") {
					alert("상품타입을 입력해주세요");
					product_type.foucs();
				} else if (product_price == "") {
					alert("싱품가격을 입력해주세요");
					product_price.foucs();
				}
				//상품 정보 전송 
				document.form1.action = "${path}/";
				document.form1.submit();
			});
			//매장 목록이동 
			$("#listBtn").click(function() {
				location.href = '${path}';
			});

		});
	</script>


	<h2>제품 등록</h2>
	<form id="form1" name="form1" enctype="multipart/form-data"
		method="post">
		<table border="1">

			<tr>
				<td>상품코드</td>
				<td><input type="text" name="product_code" id="product_code"></td>
			</tr>

			<tr>
				<td>카페코드</td>
				<td><input type="text" name="cafe_code" id="cafe_code"></td>
			</tr>

			<tr>
				<td>상품이름</td>
				<td><input type="text" name="product_name" id="product_name"></td>
			</tr>

			<tr>
				<td>상품타입</td>
				<td><input type="text" name="product_type" id="product_type"></td>
			</tr>

			<tr>
				<td>상품가격</td>
				<td><input type="text" name="product_price" id="product_price">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="등록"
					id="addBtn"> <input type="button" value="목록" id="lisBtn">
				</td>
		</table>
	</form>
</body>
</html>




