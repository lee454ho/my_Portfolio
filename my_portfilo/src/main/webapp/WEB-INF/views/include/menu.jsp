<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

.header_container{
	width:100%;
	position:sticky;
	top:0px;
	background-color: #fff;
	z-index: 10001;
} 
.header_list{
	display: flex;
	border-bottom: 1px solid lightgray;
}

.header_regist {
	text-align: right;
	margin-top: 10px;
	font-weight: bold;
	font-size: 1.3rem;
}

.header_regist a{
	padding: 10px 15px;
	color: black;
}

.header_logo img {
	position: absolute;
	top: 10px;
	left: 20px;
	width: 150px;
	height: 140px;

}

.header_menu {
	width: 100%;
	height: 100px;
	display: flex;
	justify-content: center;
	align-items: center;
	list-style: none;
	font-size: 1.5rem;
}

.header_menu li {
	padding: 0 30px;
}

</style>
<body>
	<div class="header_container">
		<div>
			<sec:authorize access="isAnonymous()">
			<div class="header_regist">
				<a href="/login">로그인</a>
			</div>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
			<div class="header_regist">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a href="/admin/main">관리자 페이지</a>
				</sec:authorize>
				<a href="/logout.do">로그아웃</a>
			</div>
			</sec:authorize>
		</div>
		<div class="header_list" style="width: 100%">
			<a class="header_logo" href="/"><img src="${path}/resources/image/siteLogo.png" alt=""></a>
			<ul class="header_menu">
				<li><a href="/board/travelLeg">여행지추천</a></li>
				<li><a href="/board/facilityList">편의시설 조회</a></li>
				<li><a href="/board/card">급식카드 가맹점</a></li>
				<li><a href="/board/freeList">자유게시판</a></li>
				<li><a href="/board/reportBoardList">신고게시판</a></li>
				<li><a href="/board/noticeList">공지사항</a></li>
			</ul>
		</div>
	</div>
</body>
</html>
