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
	//��ǰ ���� ��ư Ŭ���̺�Ʈ
$(document).ready(function()){
	$("#editBtn").click(function(){
		var product_name = $("#product_name").val();
		var product_price = $("#product_price").val();
		var product_type = $("#product_type").val();
		//��ǰ ���� �� ��ȿ�� �˻� 
		
		if(product_name ==""){
			alert("��ǰ���� �Է����ּ���");
			product_name.focus();
		}else if (product_price ==""){
			alret("��ǰ������ �Է����ּ���");
			product_price.focus();
			}else if(product_type==""){
				alret("��ǰŸ���� �Է����ֻ���");
				product_type.focus();
			}
	document.form1.action="${path}/";
	document.form1.submit();
	
	});
	//��ǰ���� ��ư 
	$("#deleteBtn").click(function()){
		//��ǰ ���� Ȯ�� 
		if(confirm("��ǰ�� �����Ͻðڽ��ϱ�?")){
			document.form1.action="${path}";
			document.form1.submit();
			
		}
	});
	//��ǰ��� ��ư �̺�Ʈ 
	$("#listBtn").click(function()	{
		location.href="${path}";
	});
	
});

</script>
<h2>�޴� ���� ����ϱ�</h2>
<table border="1">
<tr>
<th>�޴���</th>
<th>����</th>
<th>����</th>
</tr>
<c:forEach var="row" items="${list}">

</c:forEach>
</table>



</body>
</html>