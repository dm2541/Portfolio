<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafeDetail</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
	${cafe.cafe_name} <br>
	${cafe.cafe_addr} <br>
	${cafe.cafe_tel} <br>
	${cafe.cafe_star} <br>
	<img src="/myapp/img/${cafe.cafe_img}" style="width:100px;height:100px;"> <br>
	<div id="wish_div">
		<button type="button" id="wish_btn">★ 즐겨찾기 추가</button>
	</div>
	<p>미리 주문하기(취소 불가)</p>
	<select name="product_choice">
		<option value="">메뉴 선택</option>
		<c:forEach items="${productList}" var="product">
			<option value="product_name">${product.product_name}</option>
		</c:forEach>
	</select>
</body>
<script>
	$(function() {
		insertWishList();
	}); // 첫 function() end
	
	function insertWishList() {		
		$('#wish_btn').on('click', function(event) {
			event.preventDefault();
			var wish = {
				user_id: '${user.user_id}',
				cafe_code: '${cafe.cafe_code}',
				cafe_name: '${cafe.cafe_name}',
				cafe_addr: '${cafe.cafe_addr}'
			};
			$.ajax({
				url: '/myapp/insertWishList.do',
				type: 'POST',
				data: wish,
				dataType: 'text',
				async: false,
				success: function(data) {
					console.log('insert : ' + data);
					if(data == 'success'){
						var delete_btn = '<button type="button" id="wish_delete_btn">★ 즐겨찾기 삭제</button>';
						alert('즐겨찾기에 추가 되었습니다.');
						$('#wish_btn').remove();
						$('#wish_div').html(delete_btn);
						deleteWishList();
					}
					else if (data == 'fail') alert('이미 추가하셨습니다.');
				},
				error: function(request, error, status) {
					console.log("code : " + request.status + "\n");
					console.log("msg : " + request.responseText + "\n");
					console.log("error : " + error + "\n");
					alert('fail! fail! fail! fail! fail! fail! fail! fail!');
				}
			});
		})
	}
	
	function deleteWishList(){
		$('#wish_delete_btn').on('click', function(event){
			event.preventDefault();
			$.ajax({
				url: '/myapp/deleteWishList.do',
				type: 'POST',
				data: {
					user_id: '${user.user_id}',
					cafe_code: '${cafe.cafe_code}'
				},
				dataType: 'text',
				success: function(data) {
					console.log('delete : ' + data);
					var add_btn = '<button type="button" id="wish_btn">★ 즐겨찾기 추가</button>';
					console.log('delete? : ' + data);
					alert('즐겨찾기에서 삭제 되었습니다.');
					$('#wish_delete_btn').remove();
					$('#wish_div').html(add_btn);
					insertWishList();
				},
				error: function(request, error, status) {
					console.log("code : " + request.status + "\n");
					console.log("msg : " + request.responseText + "\n");
					console.log("error : " + error + "\n");
					alert('delete fail');
				}
			})
		})
	}
</script>
</html>