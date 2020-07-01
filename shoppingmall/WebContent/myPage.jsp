<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/magazine_common.css?20200304121800">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/store_common.css?20200304121800">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/guide.min.css?20200304121800">
<link type="text/css" rel="stylesheet"
	href="//static.msscdn.net/skin/musinsa/css/mypage.min.css?20200304121800">
</head>
<body>

	<div class="mypage-wrap">

		<div class="mypage-info mypage-musinsa">
			<div class="inner">
				<h1 class = "tit">
					<a href="mainLogin.jsp">MACHOMANZ</a>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마이페이지</p>
				</h1>
				<div class="my-profile">

					<div>
						<div class="img"></div>
					</div>
					<br>
					<br>
					<strong class="name">${customerList.cust_name}</strong> 
				</div>
			</div>
		</div>
		<form action = "update.do" method ="post">
		<div class="mypage-area">
			<section class="mypage-cont">
				<h1 class="hidden">회원 정보 변경</h1>

				<section class="n-section-block">
					<header class="n-section-title first">
						<h1 class="tit">
							기본 회원정보 <span>필수</span>								
									
							<input type = "submit" class="n-btn btn-sm btn-default" value = "회원정보변경" onclick = "alert('회원정보가 변경되었습니다.')"/>	
						</h1>						
						
					</header>
					
					<table class="n-table table-row my-info-modify">
						<colgroup>
							<col style="width: 190px">
							<col style="width: *">
							<col style="width: 50%">
						</colgroup>
						
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td colspan="2">
								<strong>
								<input type = "text" name = "cust_id" id = "cust_id" value = "${customerList.cust_id}" readonly = "readonly"/>
								</strong>
								</td>
							</tr>
							
							<tr>
								<th scope="row">이름(실명)</th>
								<td colspan="2">
								<strong>
								<input type = "text" name = "cust_name" id = "cust_name" value = "${customerList.cust_name}"/>
								</strong>
								</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td colspan="2">
								<strong>
								<input type = "text" name = "cust_addr" id = "cust_addr" value = "${customerList.cust_addr}"/>
								</strong>
								</td>
							</tr>
							
							<tr>
							<th scope="row">전화번호</th>
								<td colspan="2">
								<strong>
								<input type = "text" name = "cust_tel" id = "cust_tel" value = "${customerList.cust_tel}"/>
								</strong>
								</td>
							</tr>
						</tbody>
					</table>
					<ul class="n-info-txt">
						<li>아이디는 수정이 불가능합니다.</li>
						<li>주소와 전화번호를 입력하세요.</li>
					</ul>
					<p class="my-info-withdrawal">탈퇴를 원하시면 회원탈퇴 버튼을 눌러주세요 <a href="delete.do" class="n-btn btn-sm btn-default" onclick="alert('탈퇴가 완료되었습니다.')">회원탈퇴</a></p>
				</section>
			</section>
		</div>
		</form>
	</div>
	
</body>
</html>