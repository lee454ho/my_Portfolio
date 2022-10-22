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
	<link href="${path}/resources/css/freeListStyle.css" rel="stylesheet" type="text/css">
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
  	<script src="${path}/resources/js/magnify.js"></script>	
  	<script src="${path}/resources/js/script.js"></script>
	<script src="${path}/resources/js/html2canvas.js"></script>
</head>
<body>
<div id="wrap">
	<div id="container">
	
        <%@include file="../include/menu.jsp" %>

        <div id="article">
            <div>
                <h1>신고게시판</h1>
                
                <div id="article-search">
                	<div id="article-serch-wrap">
                		<select name="type" id="search_option">
                			<option value=""<c:out value="${pageMaker.cri.type == 'null' ? 'selected' : ''}"/> >전체</option>
                			<option value="C"<c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/> >카테고리</option>
							<option value="W"<c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/> >작성자</option>
							<option value="T"<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/> >제목</option>
        	       		</select>
							
						<input type="text" name="keyword" value="${pageMaker.cri.keyword}" onkeyup="inputEnter();">
							
						<button type="button" id="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
					</div>
                </div>
            </div>
        </div>
        
        <div id="a11yMenu" class="a11y_menu" aria-label="접근성메뉴">
			<h2 class="blind">접근성메뉴<span><i class="fa-solid fa-x"></i></span></h2>
        	
        	<ul id="ally_Menu_Ul">
        		<li class="a11y_invert"><button id="setInvert" aria-pressed="false"><span>색상반전</span></button></li>
				<li class="a11y_zoomin"><button id="setZoomin"><span>확대</span></button></li>
				<li class="a11y_zoomout"><button id="setZoomout"><span>축소</span></button></li>
				<li class="a11y_magnify"><button id="setMagnify" aria-pressed="false"><span>돋보기</span></button></li>
			</ul>
			
			<dl aria-live="polite"></dl> 
		</div>
			
        <div id="section">
            <table>
               <thead>
                    <tr>
                        <th class="table_no">번호</th>
                        <th class="table_cate">카테고리</th>
                        <th class="table_title">제목</th>
                        <th class="table_writer">작성자</th>
                        <th class="table_regdate">작성일</th>
                    </tr>
                </thead>
                
                <tbody>
                	<c:forEach var="row" items="${boardList}">
						<tr>
							<td class="table_no">${row.rboard_id}</td>
							<td class="table_cate">${row.category}</td>
							<td class="table_title"><a href="/board/reportBoardDetail?rboard_id=${row.rboard_id}">${row.title}</a></td>
							<td class="table_writer">${row.user_id}</td>
							<td><fmt:formatDate pattern="yyyy/MM/dd" value="${row.regdate}"/></td>
						</tr>		
					</c:forEach>
                </tbody>
            </table>
        </div>
		
		<div id="article2">
			<div>	
				<a href="/board/merge/reportBoardInsert">글 쓰기</a>
			</div>
		</div>
        
        <div id="pageNation">
        	 <ul class="pageInfo" id="pageInfo">
                <c:if test="${pageMaker.prev}">
                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">이전</a></li>
                </c:if>
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num? 'active':''}"><a href="${num}">${num}</a></li>
                </c:forEach>
                <c:if test="${pageMaker.next}">
                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">다음</a></li>
                </c:if>
            </ul>
        </div>
        
        <form id="moveForm" method="GET">
        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        	<input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
        	<input type="hidden" name="type" value="${pageMaker.cri.type}">
        </form>

        <div id="footer">

        </div>
	</div>
</div>	
    <div id="magnifyImg" class="magnify_area">
        <div id="magnifyLense" class="magnify_lense"></div>
	</div>
</body>
<script src="https://kit.fontawesome.com/f9f8c57db8.js" crossorigin="anonymous"></script>
<script>
	let moveForm = $("#moveForm");
	
	$('.pageInfo a').on('click', function(e) {
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/board/reportBoardList");
		moveForm.submit();
	});
	
	$('#searchBtn').on('click', function(e) {
		e.preventDefault();
		let val = $("input[name='keyword']").val();
		let type = $('#search_option').val();
		moveForm.find("input[name=type]").val(type);
		moveForm.find("input[name=keyword]").val(val);
		moveForm.find("input[name='pageNum']").val(1)
		moveForm.submit();
	});
	
	
	function inputEnter(){
		if(window.event.keyCode == 13){
			let val = $("input[name='keyword']").val();
			let type = $('#search_option').val();
			moveForm.find("input[name=type]").val(type);
			moveForm.find("input[name=keyword]").val(val);
			moveForm.find("input[name='pageNum']").val(1)
			moveForm.submit();
		} 
	}
	
</script>
</html>