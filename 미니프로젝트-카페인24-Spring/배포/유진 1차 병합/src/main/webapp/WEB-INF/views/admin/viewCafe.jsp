<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewCafe</title>
</head>
<body>
<form name="form1" method="post" enctype="multipart/form-data">	
	<DIV style="TEXT-ALIGN: center">
		<h2>수정 하기 &nbsp;&nbsp;&nbsp; <input type="button" value="메뉴등록" onclick="location.href='/ItemRegister/${cafe.cafe_code}'"> </h2>
		
	</DIV>
	<table border="1" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td>카페코드</td>
			<td><input type="text" name="cafe_code"
				value="${cafe.cafe_code }"></td>
		</tr>
		<tr>
			<td>카페명</td>
			<td><input type="text" name="cafe_name"
				value="${cafe.cafe_name }"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="cafe_addr"
				value="${cafe.cafe_addr }"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="cafe_tel" value="${cafe.cafe_tel }"></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><input type="file" name="cafe_Img"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				
					<input type="submit" value="등록" onclick="javascript: form.action= '/admin/modifyCafe.do'"/>
					<input type="submit" value="취소" onclick="javascript: form.action= '/admin/listCafe.do'"/>
			</td>
		</tr>
	</table>
	<br>
</form>

	<%@ include file="/WEB-INF/views/admin/review.jsp"%>

</body>
</html>