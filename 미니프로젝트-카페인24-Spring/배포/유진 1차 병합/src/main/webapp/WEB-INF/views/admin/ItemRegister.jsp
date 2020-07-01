<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>메뉴 수정/등록하기</h1>



	<table border="1">
		<thead>
			<tr>
				<th>메뉴명</th>
				<th>가격</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody id="tblShow"></tbody>

		<c:forEach items="${productList}" var="product">
			<tr>
				<td>${product.product_name}</td>
				<td>${product.product_price}</td>
				<td><a href="#" class="delete-link">삭제</a></td>

			</tr>
		</c:forEach>

	</table>

	<form action="/productInsert.do">
	      상품코드 : <input type="text" name="product_code"> <br>
	      카페코드 : <input type="text" name="cafe_code" value="${cafe_code}" readonly="readonly"> <br>
	      상품가격 : <input type="number" name="product_price"> <br>
	      상품이름 : <input type="text" name="product_name"> <br>
	    
      <select name="product_type">
         <option value=0>HOT</option>
         <option value=1>ICE</option>
      </select>
	   
	   <input type="submit" value="등록">
	   
   </form>

	
		<!-- 	<form role="form" method="post" autocomplete="off" action="Item.do"> -->

			
	
	<!-- dao service 컨트롤러 작업해야함 -->
</body>
</html>