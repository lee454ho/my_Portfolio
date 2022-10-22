<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>DreamDream 신고합니다</title>
<link rel="shortcut icon" href="${path}/resources/image/siteLogopavi.ico">
<link href="${path}/resources/css/freeInsertStyle..css" rel="stylesheet" type="text/css">
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${path}/resources/js/magnify.js"></script>
<script src="${path}/resources/js/script.js"></script>
<script src="${path}/resources/js/html2canvas.js"></script>
</head>
<script>
	window.onload = function() {
		let title = document.querySelector('#title');
		let content = document.querySelector('#content');
		let user_id = document.querySelector('#user_id');
		let submit = document.querySelector("input[type='button']");
		let form1 = document.querySelector('form'); 
		

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
			
			form1.action = "/board/merge/reportBoardInsert?${_csrf.parameterName}=${_csrf.token}";
			form1.submit();

			});
		}
</script>

<body>
<div id="wrap">
	<div id="container">
<%@include file="../include/menu.jsp" %>
        
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
        	<div id="section_Con">
        		<form id="form1" name="form1" method="POST" enctype="multipart/form-data">
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        			<div class="section_Con_Select">
        			
        				<select name="category" id="category">
        					<option>시설 유/무</option>
        					<option>추가요청</option>
        					<option>건의사항</option>
        					<option>기타</option>
        				</select>
        			</div>

        			<div class="section_Con_Input">
						<input type="text" name="title" id="title" size="80" class="txtInput" placeholder="제목입력">
					</div>
				
					<div class="section_Con_Input">
						<input type="text" name="user_id" id="user_id" class="txtInput" value="${userid}" readonly>
					</div>
			
					<div class="section_Con_Input">
						<textarea rows="5" cols="80" id="content" name="content" class="txtInput" placeholder="내용입력" ></textarea>
					</div>
								파일 선택 : <input type="file" name="file">
					<div id="article2">
						<div>
							<a href="/board/reportBoardList">글 목록</a>
						</div>
			
						<div>	
							<input type="button" value="작성하기">
						</div>
					</div>
				</form>
        	</div>    
        </div>
 
<!--         	파일 업로드에서는 enctype(인코딩타입)을 multipart/form-data로 반드시 설정
	<form action="upload_ok" method="post" enctype="multipart/form-data">
		파일 선택 : <input type="file" name="file">
		<input type="submit" value="전송">
	</form> -->
	

        
        <div id="pageNation">
			
        </div>

        <div id="footer">

        </div>
	</div>
</div>	
    <div id="magnifyImg" class="magnify_area">
        <div id="magnifyLense" class="magnify_lense"></div>
	</div>
</body>
<script src="https://kit.fontawesome.com/f9f8c57db8.js" crossorigin="anonymous"></script>
</html>