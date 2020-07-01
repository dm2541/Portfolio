<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<!-- <script type="text/javascript">
	function rowAdd() {
		/* $().append('<li><a href-"#">END</a></li>')	 */
		var objRow;
		objRow = document.all("tblShow").insertRow();

		var objCell_id = objRow.insertCell();
		objCell_id.innerHTML = "<input type='text' id='row_id' name='row_id' size='10' value=''/>";

		//가격 

		var objCell_price = objRow.insertCell();
		objCell_price.innerHTML = "<input type='text' id='row_price' name='row_price' size='10' value=''/>";

		function delete_row() {
			var my_tbody = document.getElementById('tblShow');
			if (my_tbody.rows.length < 1)
				return;
			// my_tbody.deleteRow(0); // 상단부터 삭제
			my_tbody.deleteRow(my_tbody.rows.length - 1); // 하단부터 삭제
		}

	}
</script> -->

<head>
<meta charset="Content=Type" content="text/html" charset="UTF-8">
<title>adminHome_lcy</title>
</head>


<body>
	<h1>메뉴 수정/등록하기</h1>

	<input type="button" id="addBtn" name="addBtn" value="추가하기"
		onclick="rowAdd()">
	<input type="button" id="delete_row" value="삭제하기" onclick="rowDelete()">

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
	<button type="button" onClick="location.href='ItemRegister.do'">수정</button>
	<button
		onclick="window.open('adderss',window_name,'width=430,height=500,location=no, scrollbars=yes');">취소</button>







</body>
<!-- <button type="button">취소</button> -->


</html>