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
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객요청함</p>
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
		<div class="mypage-area">
			<section class="mypage-cont">
				<h1 class="hidden">고객 요청함</h1>
				<section class="n-section-block">
					<header class="n-section-title first">
						<h1 class="tit">
							고객 요청함 
							
							<a href="mainLogin.jsp">
							<input type = "submit" class="n-btn btn-sm btn-default" value = "요청전송" onclick="alert('전송하시겠습니까?')"/>
							</a>	
							
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
								<th scope="row">비밀번호</th>
								<td colspan="2">
								<strong>
								<input type = "password" placeholder="비밀번호를 입력해 주세요."/>
								</strong>
								</td>
							</tr>
							<tr>
								<th scope="row">제품명</th>
								<td colspan="2">
								<strong>
								<input type = "text" placeholder="제품명을 입력해 주세요."/>
								</strong>
								</td>
							</tr>
							
							<tr>
							<th scope="row">요청 사항</th>
								<td colspan="2">
								<strong>
								<input type = "text" placeholder="요청 사항을 입력해 주세요."/>
								</strong>
								</td>
							</tr>
						</tbody>
					</table>
					<ul class="n-info-txt">
						<li>제품명과 요청사항을 입력하세요.</li>
					</ul>				
					
				</section>
			</section>
		</div>		
	</div>
</body>
</html>