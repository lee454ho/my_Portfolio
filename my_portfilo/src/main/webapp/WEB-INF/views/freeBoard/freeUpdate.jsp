<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DreamDream 자유게시판</title>
<link rel="shortcut icon" href="${path}/resources/image/siteLogopavi.ico">
<link href="${path}/resources/css/freeInsertStyle..css?var=1" rel="stylesheet" type="text/css">
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${path}/resources/js/magnify.js"></script>
<script src="${path}/resources/js/script.js"></script>
<script src="${path}/resources/js/html2canvas.js"></script>
</head>
<script>
	window.onload = function() {
		//form 데이터를 넘겨주는 함수
		let title = document.querySelector('#title');
		let content = document.querySelector('#content');
		let user_id = document.querySelector('#user_id');
		let submit = document.querySelector("input[type='button']");
		let form1 = document.querySelector('form'); 
		let category = document.querySelector('#category');

		submit.addEventListener('click',function(){
			if(title.value === ""){
				alert('제목을 입력해주세요.');
				title.focus();
				return false;
			};
			if(user_id.value === ""){
				alert('아이디를 입력해주세요.');
				user_id.focus();
				return false;	
			};
			if(content.value === ""){
				alert('내용을 입력해주세요.');
				content.focus();
				return false;	
			};
			form1.action = "/board/merge/freeUpdate?${_csrf.parameterName}=${_csrf.token}";
			form1.submit();
			});
		}
	$(document).ready(function(){
		$('#category').val('${data.category}');
	})
	
</script>
<body>
<div id="wrap">
	<div id="container">
	<!-- 컨테이너 -->
	<%@include file="../include/menu.jsp" %>
	<!-- 헤더 -->
        
        <div id="a11yMenu" class="a11y_menu" aria-label="접근성메뉴">
        <!-- 접근성 메뉴 -->
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
        <!-- input section  -->
        	<div id="section_Con">
        		<form id="form1" name="form1" method="POST">
        		<input type="hidden" name="free_board_id" value="${data.free_board_id}">
        			<div class="section_Con_Select">
        				<select name="category" id="category" >
        					<option>전체</option>
        					<option>시각장애인</option>
        					<option>청각장애인</option>
        					<option>지체장애인</option>
        				</select>
        			</div>

        			<div class="section_Con_Input">
						<input type="text" name="title" id="title" size="80" class="txtInput" value="${data.title}">
					</div>
				
					<div class="section_Con_Input">
						<input type="text" name="user_id" id="user_id" class="txtInput" value="${data.user_id}">
					</div>
			
					<div class="section_Con_Input">
						<textarea rows="5" cols="80" id="content" name="content" class="txtInput">${data.content}</textarea>
					</div>
					
					<div id="article2">
					<!-- 버튼 -->
						<div>
							<a href="/board/freeList">글 목록</a>
						</div>
			
						<div>	
							<input type="button" value="작성하기">
						</div>
					</div>
				</form>
        	</div>    
        </div>
        
        <div id="pageNation">
			
        </div>

        <div id="footer">

        </div>
	</div>
</div>
 	<div id="magnifyImg" class="magnify_area">
 	<!-- 돋보기 -->
        <div id="magnifyLense" class="magnify_lense"></div>
	</div>	
</body>
<script src="https://kit.fontawesome.com/f9f8c57db8.js" crossorigin="anonymous"></script>
</html>