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
	<h1>�޴� ����/����ϱ�</h1>



	<table border="1">
		<thead>
			<tr>
				<th>�޴���</th>
				<th>����</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody id="tblShow"></tbody>

		<c:forEach items="${productList}" var="product">
			<tr>
				<td>${product.product_name}</td>
				<td>${product.product_price}</td>
				<td><a href="#" class="delete-link">����</a></td>

			</tr>
		</c:forEach>

	</table>

	<form action="/productInsert.do">
	      ��ǰ�ڵ� : <input type="text" name="product_code"> <br>
	      ī���ڵ� : <input type="text" name="cafe_code" value="${cafe_code}" readonly="readonly"> <br>
	      ��ǰ���� : <input type="number" name="product_price"> <br>
	      ��ǰ�̸� : <input type="text" name="product_name"> <br>
	    
      <select name="product_type">
         <option value=0>HOT</option>
         <option value=1>ICE</option>
      </select>
	   
	   <input type="submit" value="���">
	   
   </form>

	
		<!-- 	<form role="form" method="post" autocomplete="off" action="Item.do"> -->

			
	
	<!-- dao service ��Ʈ�ѷ� �۾��ؾ��� -->
</body>
</html>