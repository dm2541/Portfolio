<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<ul>
	<li><a href="">������ </a></li>
</ul>
<body>

	<script>
		$(document).ready(function() {
			//��ǰ��� 

			$("#addBtn").click(function() {
				var product_code = $("#product_code")
				var cafe_code = $("#cafe_code")
				var product_name = $("#product_name")
				var product_type = $("#product_type")
				var product_price = $("#product_price")

				if (product_code == "") {
					alert("��ǰ�ڵ带 �Է����ּ���");
					product_code.foucs();
				} else if (cafe_code == "") {
					alert("ī���ڵ带 �Է����ּ���");
					cafe_code.foucs();
				} else if (product_name == "") {
					alert("��ǰ�̸��� �Է����ּ���");
					product_name.foucs();

				} else if (product_type == "") {
					alert("��ǰŸ���� �Է����ּ���");
					product_type.foucs();
				} else if (product_price == "") {
					alert("��ǰ������ �Է����ּ���");
					product_price.foucs();
				}
				//��ǰ ���� ���� 
				document.form1.action = "${path}/";
				document.form1.submit();
			});
			//���� ����̵� 
			$("#listBtn").click(function() {
				location.href = '${path}';
			});

		});
	</script>


	<h2>��ǰ ���</h2>
	<form id="form1" name="form1" enctype="multipart/form-data"
		method="post">
		<table border="1">

			<tr>
				<td>��ǰ�ڵ�</td>
				<td><input type="text" name="product_code" id="product_code"></td>
			</tr>

			<tr>
				<td>ī���ڵ�</td>
				<td><input type="text" name="cafe_code" id="cafe_code"></td>
			</tr>

			<tr>
				<td>��ǰ�̸�</td>
				<td><input type="text" name="product_name" id="product_name"></td>
			</tr>

			<tr>
				<td>��ǰŸ��</td>
				<td><input type="text" name="product_type" id="product_type"></td>
			</tr>

			<tr>
				<td>��ǰ����</td>
				<td><input type="text" name="product_price" id="product_price">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="���"
					id="addBtn"> <input type="button" value="���" id="lisBtn">
				</td>
		</table>
	</form>
</body>
</html>




