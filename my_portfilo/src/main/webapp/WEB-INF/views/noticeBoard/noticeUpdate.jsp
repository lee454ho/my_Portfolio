<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DreamDream 공지사항</title>
<link rel="shortcut icon" href="${path}/resources/image/siteLogopavi.ico">
<link href="${path}/resources/css/freeInsertStyle..css?var=1" rel="stylesheet" type="text/css">
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
		let submitBtn = document.querySelector("#submitBtn");
		let form1 = document.querySelector('form'); 
		let category = document.querySelector('#category');
		let file_name = document.querySelector('#file_name');
		let filedelete = document.querySelector('#filedelete');
		let nboard_id = '${data.nboard_id}';
		////////////////////////////////////////////////////
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		///////////////////////////////////////////////
		
		submitBtn.addEventListener('click',function(){
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
			form1.action = "/board/merge/noticeUpdate?${_csrf.parameterName}=${_csrf.token}";
			form1.submit();
			});
		filedelete.addEventListener('click',function(){
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
				});
			
			$.ajax({
				url : "/board/merge/DeleteAttachFile",
				type : "GET",
				data : {"nboard_id":nboard_id},
				
				success : function(){
					alert("파일 삭제 완료");
					$("p").remove("#beforeDelFile");
				}
				
			})
			
		})
		
		}
	$(document).ready(function(){
		$('#category').val('${data.category}');
		
		})

		

	
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
        		<input type="hidden" name="nboard_id" value="${data.nboard_id}">
        			<div class="section_Con_Select">
        				<select name="category" id="category" >
        					<option>공지사항</option>

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
					
					<div style="margin-left: 10%">
						<p id="beforeDelFile">현재 파일: <a href="fileDownload.do?fileName=${data.file_name}" id="filename">${data.file_name}</a></p> 
						 <button type="button" id="filedelete">첨부파일삭제</button>

						<br>
						변경할 파일 선택 : <input type="file" name="file">
					</div>
					
					<div id="article2">
						<div>
							<a href="/board/noticeList">글 목록</a>
						</div>
			
						<div>	
							<input type="button" value="작성하기" id="submitBtn">
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
        <div id="magnifyLense" class="magnify_lense"></div>
	</div>	
</body>
<script src="https://kit.fontawesome.com/f9f8c57db8.js" crossorigin="anonymous"></script>
</html>