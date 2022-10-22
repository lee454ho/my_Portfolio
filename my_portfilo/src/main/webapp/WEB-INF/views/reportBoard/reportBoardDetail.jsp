<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>DreamDream 신고합니다</title>
<link rel="shortcut icon" href="${path}/resources/image/siteLogopavi.ico">
<link href="${path}/resources/css/reportBoardDetailStyle.css?var=1" rel="stylesheet" type="text/css">

<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${path}/resources/js/magnify.js"></script>
<script src="${path}/resources/js/script.js"></script>
<script src="${path}/resources/js/html2canvas.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="container">
<%@include file="../include/menu.jsp" %>

			<div id="a11yMenu" class="a11y_menu" aria-label="접근성메뉴">
				<h2 class="blind">
					접근성메뉴<span><i class="fa-solid fa-x"></i></span>
				</h2>

				<ul id="ally_Menu_Ul">
					<li class="a11y_invert"><button id="setInvert"
							aria-pressed="false">
							<span>색상반전</span>
						</button></li>
					<li class="a11y_zoomin"><button id="setZoomin">
							<span>확대</span>
						</button></li>
					<li class="a11y_zoomout"><button id="setZoomout">
							<span>축소</span>
						</button></li>
					<li class="a11y_magnify"><button id="setMagnify"
							aria-pressed="false">
							<span>돋보기</span>
						</button></li>
				</ul>

				<dl aria-live="polite"></dl>
			</div>

			<div id="section">
				<div id="section_Con">
					<div class="section_Con_Ele1">
						<div>${data.category}</div>
						<div>${data.title}</div>
					</div>

					<div class="section_Con_Ele2">
						<div>${data.user_id}</div>
						<fmt:parseDate value="${data.regdate}"
							pattern="yyyy-MM-dd HH:mm:ss" var="date1" type="both" />
						<div>
							작성일자 :
							<fmt:formatDate value="${date1}" pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
					</div>

					<div class="section_Con_Ele3">
						<div>${data.content}</div>
					</div>
					<div>
						<a href="/board/merge/fileDownload.do?fileName=${data.file_name}">${data.file_name}</a>

					</div>
				</div>
			</div>

			<div id="article2">

				<c:if test="${loginUser eq data.user_id || auth == '[ROLE_ADMIN]'}">
					<div class="detailBtn_1">
						<a
							href="/board/merge/reportBoardDelete?rboard_id=${data.rboard_id}">글삭제</a>
					</div>

					<div class="detailBtn_1">
						<a
							href="/board/merge/reportBoardUpdate?rboard_id=${data.rboard_id}">글수정</a>
					</div>
				</c:if>
				<div class="detailBtn_2">
					<a href="/board/reportBoardList">목록</a>
				</div>
			</div>

			<div id="replyCon">
				<div></div>
				<div></div>
			</div>

			<div id="pageNation"></div>

			<div id="footer"></div>
		</div>
	</div>
	<div id="magnifyImg" class="magnify_area">
		<div id="magnifyLense" class="magnify_lense"></div>
	</div>

	<input type="hidden" value="${data.rboard_id}" />
</body>
<script src="https://kit.fontawesome.com/f9f8c57db8.js"
	crossorigin="anonymous"></script>
</html>