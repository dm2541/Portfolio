<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script>
	//상품 수정 버튼 클릭이벤트
$(document).ready(function()){
	$("#editBtn").click(function(){
		var product_name = $("#product_name").val();
		var product_price = $("#product_price").val();
		var product_type = $("#product_type").val();
		//상품 수정 폼 유효성 검사 
		
		if(product_name ==""){
			alert("삼품명을 입력해주세요");
			product_name.focus();
		}else if (product_price ==""){
			alret("상품가격을 입력해주세요");
			product_price.focus();
			}else if(product_type==""){
				alret("상품타입을 입력해주새요");
				product_type.focus();
			}
	document.form1.action="${path}/";
	document.form1.submit();
	
	});
	//상품삭제 버튼 
	$("#deleteBtn").click(function()){
		//상품 삭제 확인 
		if(confirm("상품을 삭제하시겠습니까?")){
			document.form1.action="${path}";
			document.form1.submit();
			
		}
	});
	//상품목록 버튼 이벤트 
	$("#listBtn").click(function()	{
		location.href="${path}";
	});
	
});

</script>
<h2>메뉴 수정 등록하기</h2>
<table border="1">
<tr>
<th>메뉴명</th>
<th>가격</th>
<th>삭제</th>
</tr>
<c:forEach var="row" items="${list}">

</c:forEach>
</table>



</body>
</html>