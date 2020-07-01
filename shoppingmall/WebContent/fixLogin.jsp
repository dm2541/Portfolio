<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" charset="utf-8"
	href="//static.musinsa.com/mfile_outsrc/css/common/normalizer.css?v=9.21384">
<link type="text/css" rel="stylesheet" charset="utf-8"
	href="//static.musinsa.com/mfile_outsrc/css/common/header.css?v=9.21384">
<link rel="shortcut icon" href="/favicon.ico?20200213"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/magazine_common.css?20191107_1">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/store_common.css?20200217">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/style.min.css?20200225">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/sub.css?20200226_1">
<link rel="stylesheet" type="text/css"
	href="//static.msscdn.net/skin/musinsa/css/media_query.css?20191218">
<link rel="shortcut icon" href="/favicon.ico?20200213"
	type="image/x-icon">
<link type="text/css" rel="stylesheet" href="css/style_nav.css">
</head>
<body>
	<div class="top-column column">
		<!--헤더 header start-->
		<div class="header clearfix">
			<div class="wrapper">
					<a href="/mainLogin.jsp"><h1>MACHOMANZ STORE</h1></a>
			</div>
			<div class="userMenu-wrapper toggleBox">
				<ul class="userMenu-list-notLogin userMenu-list clearfix">
					<li class="listItem loginBtn"><a href="/logout.do">${customerList.cust_name}님
							환영합니다.</a></li>
					<li class="listItem"><a href="/logout.do" title="로그아웃"><span>로그아웃</span></a></li>
					<li class="listItem"><a href="update.do" title="마이페이지"><span>마이페이지</span></a></li>
					<li class="listItem"><a href="/cartList.do" title="장바구니"><span>장바구니</span></a></li>
					<li class="listItem"><a href="qnaz.jsp" title="장바구니"><span>고객요청함</span></a></li>
					<li class="listItem"><span>&nbsp;&nbsp;EVENT. 신규 가입 시,
							10% 할인 이벤트 진행중</span></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="wrap page_brand_tab">
		<div class="right_area">
			<div class="division_box hover_box box_division_group">
				<p class="article_title">카테고리</p>
				<dl class="list_division_brand">
					<dt>
						<div>
							<a href="/productAll.jsp">전체</a>
						</div>
					</dt>
					<dd>
						<ul class="division_reset">
							<li><a href="/productItem.do?category_big=Top" onclick="">상의
									<span class="num"></span>
							</a></li>
							<li><a href="/productItem.do?category_big=Bottom" onclick="">하의
									<span class="num2"></span>
							</a></li>
							<li><a href="/productItem.do?category_big=Outer" onclick="">아우터
									<span class="num2"></span>
							</a></li>
							<li><a href="/productItem.do?category_big=Etc" onclick="">기타
									<span class="num2"></span>
							</a></li>
						</ul>
					</dd>
				</dl>
			</div>
		</div>
	</div>
</body>
</html>