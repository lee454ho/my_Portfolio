<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DreamDream 자유게시판</title>
<link rel="shortcut icon" href="${path}/resources/image/siteLogopavi.ico">
<link href="${path}/resources/css/freeDetailStyle.css?var=1" rel="stylesheet" type="text/css">
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${path}/resources/js/magnify.js"></script>
<script src="${path}/resources/js/script.js"></script>
<script src="${path}/resources/js/html2canvas.js"></script>
</head>
<style>

  
</style>
<body>
<div id="wrap">
	<div id="container">
	<!-- 컨테이너  -->
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
        <!-- 데이터 리스트 section -->
        	<div id="section_Con">
        		<div class="section_Con_Ele1">
        			<div>${data.category}</div>
        			<div>${data.title}</div>
        		</div>
        		
        		<div class="section_Con_Ele2">
        			<div>${data.user_id}</div>
        			<fmt:parseDate value="${data.regdate}" pattern="yyyy-MM-dd HH:mm:ss" 
						var="date1" type="both" />
					<div>작성일자 : <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
        		</div>
        	
        		<div class="section_Con_Ele3">
        			<div>${data.content}</div>
        		</div>
        	</div>
        </div>
       
		<div id="article2">
		<!-- 버튼 -->
		<c:if test="${loginUser eq data.user_id  || auth == '[ROLE_ADMIN]'}">
			<div class="detailBtn_1">
				<a href="/board/merge/freeDelete?free_board_id=${data.free_board_id}">글 삭제</a>
			</div>
			
			<div class="detailBtn_1">
				<a href="/board/merge/freeUpdate?free_board_id=${data.free_board_id}">글 수정</a>
			</div>
		</c:if>
			
			<div class="detailBtn_2">
				<a href="/board/freeList">목록</a>
			</div>
			
			<div id="reply_Modal" class="detailBtn_2">
				<button>댓글작성</button>
			</div>
		</div>
		
		<div id="reply_ListCon">
		<!-- 댓글 리스트 div -->
		</div>
		
		<div id="reply_InsertWrap">
		<!-- 댓글 input -->
			<div id="reply_InsertCon">
				<div id="reply_title">
					<p>댓글</p>
				</div>
				<div id="reply_Content">
					<div>${data.content}</div>
				</div>
				<div id="reply_userID">
					<input type="text" name="reply_ID" id="reply_ID" value="${loginUser}" readonly >
				</div>
				<div id="reply_Content2">
					<textarea rows="5" cols="116" placeholder="내용"></textarea>
				</div>
				<div id="replyBtn">
					<button class="replyBtnEle insert">댓글 작성</button>
					<button class="replyBtnEle close">취소</button>
				</div>
			</div>
		</div>
		<div class="reply_not_div"></div>
		<!-- 댓글 데이터 없을 시 나오는 div -->
		<ul class="reply_content_ul">
		<!-- 댓글 데이터 리스트 ul -->
			<li>
				<div class="comment_wrap">
					<div class="reply_top">
						<span class="id_span"></span>
						<span class="date_span"></span>
						<c:if test="${loginUser eq data.user_id || auth == '[ROLE_ADMIN]'}">
							<a class="update_reply_btn">수정</a>
							<a class="delete_reply_btn">삭제</a>
						</c:if>
					</div>
					<div class="reply_bottom">
						<div class="reply_bottom_txt"></div>
						
					</div>	
				</div>
			</li>
		</ul>
			<div class="repy_pageInfo_div">
			<!-- 댓글 페이징 -->
				<ul class="pageMaker">
				</ul>
			</div>
        <div id="footer">

        </div>
	</div>
</div>	
    <div id="magnifyImg" class="magnify_area">
    <!-- 돋보기 -->
        <div id="magnifyLense" class="magnify_lense"></div>
	</div>

	<input type="hidden" value="${data.free_board_id}"/>
</body>
<script src="https://kit.fontawesome.com/f9f8c57db8.js" crossorigin="anonymous"></script>	

<script>
const cri = {
		//댓글 리스트 출력 데이터
		free_board_id : '${data.free_board_id}',
		pageNum : 1,
		amount : 5
}

////////////////////////////////////////////////////
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
///////////////////////////////////////////////

$(document).ready(function(){
	//댓글 리스트 출력 ajax
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});
	const free_board_id = '${data.free_board_id}';

	$.ajax({
		type:'GET',
		url:'/board/replyList',
		dataType:'JSON',
		data:{
			free_board_id:free_board_id,
			pageNum : 1,
			amount : 5,
		},
		success:function(obj){
			//댓글 리스트 출력 함수 호출
			makeReplyContent(obj);
		}
	})
		
});
$(document).on('click', '.delete_reply_btn', function(e){
	//댓글 삭제 버튼 클릭스 호출 ajax
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});

	e.preventDefault();
	let replyId = $(this).attr("href");	
	
	$.ajax({
		data : {
			replyId : replyId,
			free_board_id : '${data.free_board_id}'
		},
		url : 'merge/replyDelete',
		type : 'POST',
		success : function(result){
			//댓글 리스트 출력 함수 호출
			replyListInit();
			alert('삭제가 완료되엇습니다.');
		}
	});		
		
 });	
function updateBtn(replyId, user_id){
	//수정버튼 클릭시 ajax 호출 함수(해당 댓글 정보를 controller에 넘겨줌)
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});
	$.ajax({
		url:"reply/detail/"+replyId,
		success:function(result){
			$('#modifyReply'+replyId).css("display","block");
			//freeUpdateDetail.jsp를 view해주는 코드
			$('#modifyReply'+replyId).html(result);
		}
	});
}

$(".insert").on("click", function(e){
	//insert 버튼 클릭스 호출 ajax
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});
	const free_board_id = '${data.free_board_id}'
	const userID = $('#reply_ID').val();
	const content = $("textarea").val();
	$.ajax({
		type:'POST',
		url:'merge/replyInsert',
		data:{
			user_id:userID,
			content:content,
			free_board_id:free_board_id
		},
		success:function(data){
			//댓글 리스트 출력 함수 호출
			alert('댓글작성 성공')
			$('#reply_InsertWrap').css('display','none');
			replyListInit();
		},
		error: function (request, status, error) {

			alert("잘못된 접근 입니다. 관리자에게 문의하세요.");

		}	
	})
	
});

$(document).on('click', '.pageMaker_btn a', function(e){
	//페이지 번호 클릭시 페이징 함수 재호출
	e.preventDefault();
	
	let page = $(this).attr("href");	
	cri.pageNum = page;		
	
	
	replyListInit();
		
 });
let replyListInit = function(){
	//현재 페이지 정보를 담아 데이터 리스트를 출력하는 ajax 호출 함수
	$.getJSON("replyList", cri , function(obj){

		makeReplyContent(obj);
		
	});		
}
function makeReplyContent(obj){
	//ajax 데이터 리스트 출력 함수
	if(obj.list.length === 0){
		$(".reply_not_div").html('<span>댓글을 작성해보세요.</span>');
		$(".reply_content_ul").html('');
		$(".pageMaker").html('');
	}
	else{
		$(".reply_not_div").html('');
		let list = obj.list;
		let pf = obj.pageInfo;
		let free_board_id = '${data.free_board_id}'
		let reply_list = '';
		let loginUser = "${loginUser}";
		$(list).each(function(i,obj){
			reply_list += '<li>';
			reply_list += '<div class="comment_wrap">';
			reply_list += '<div class="reply_top">';
			reply_list += '<span class="id_span">'+ obj.user_id+'</span>';
			reply_list += '<span class="date_span">'+ obj.regDate +'</span>';
			if(loginUser == obj.user_id) {
				reply_list += '<button class="update_reply_btn" onclick=updateBtn('+obj.replyId + ',\''+ obj.user_id + ',\')>수정</button><a class="delete_reply_btn" href="'+ obj.replyId +'">삭제</a>';
			}
			reply_list += '</div>'; 
			reply_list += '<div class="reply_bottom">';
			reply_list += '<div class="reply_bottom_txt">'+ obj.content +'</div>';
			reply_list += '<div id="modifyReply'+this.replyId+'" class="modifyReply"></div>'
			reply_list += '</div>';
			reply_list += '</div>';
			reply_list += '</li>';
		});		
		
		$(".reply_content_ul").html(reply_list);		
		//페이지 이동 바 생성 함수
		let reply_pageMaker = '';
		if(pf.prev){
			let prev_num = pf.startPage -1;
			reply_pageMaker += '<li class="pageMaker_btn prev">';
			reply_pageMaker += '<a href="'+ prev_num +'">이전</a>';
			reply_pageMaker += '</li>';	
		}
		for(let i = pf.startPage; i < pf.endPage+1; i++){
			reply_pageMaker += '<li class="pageMaker_btn ';
			if(pf.cri.pageNum === i){
				reply_pageMaker += 'active';
			}
			reply_pageMaker += '">';
			reply_pageMaker += '<a href="'+i+'">'+i+'</a>';
			reply_pageMaker += '</li>';
		}
		if(pf.next){
			let next_num = pf.endPage +1;
			reply_pageMaker += '<li class="pageMaker_btn next">';
			reply_pageMaker += '<a href="'+ next_num +'">다음</a>';
			reply_pageMaker += '</li>';	
		}	
		
		
	$(".pageMaker").html(reply_pageMaker);			
	
	};

};



</script>
</html>