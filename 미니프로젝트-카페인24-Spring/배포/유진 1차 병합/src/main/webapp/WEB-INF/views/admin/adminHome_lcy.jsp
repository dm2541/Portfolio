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

		//���� 

		var objCell_price = objRow.insertCell();
		objCell_price.innerHTML = "<input type='text' id='row_price' name='row_price' size='10' value=''/>";

		function delete_row() {
			var my_tbody = document.getElementById('tblShow');
			if (my_tbody.rows.length < 1)
				return;
			// my_tbody.deleteRow(0); // ��ܺ��� ����
			my_tbody.deleteRow(my_tbody.rows.length - 1); // �ϴܺ��� ����
		}

	}
</script> -->

<head>
<meta charset="Content=Type" content="text/html" charset="UTF-8">
<title>adminHome_lcy</title>
</head>


<body>
	<h1>�޴� ����/����ϱ�</h1>

	<input type="button" id="addBtn" name="addBtn" value="�߰��ϱ�"
		onclick="rowAdd()">
	<input type="button" id="delete_row" value="�����ϱ�" onclick="rowDelete()">

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
	<button type="button" onClick="location.href='ItemRegister.do'">����</button>
	<button
		onclick="window.open('adderss',window_name,'width=430,height=500,location=no, scrollbars=yes');">���</button>







</body>
<!-- <button type="button">���</button> -->


</html>