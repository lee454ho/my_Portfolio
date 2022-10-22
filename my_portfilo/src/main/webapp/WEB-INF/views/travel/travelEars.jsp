<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${path}/resources/image/siteLogopavi.ico">
<link href="${path}/resources/css/style.css?var=1" rel="stylesheet" type="text/css">
  <script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
  <script src="${path}/resources/js/script.js"></script>
  <script src="${path}/resources/js/magnify.js"></script>
  <script src="${path}/resources/js/html2canvas.js"></script>
	<title>DreamDream 여행지</title>
</head>

<body>
<div id="wrap">
   <!-- 컨테이너 -->
    <div id="container">
        <!-- 헤더 -->        
    <%@include file="../include/menu.jsp" %>
    <!-- 접근성 메뉴 -->
        <div id="a11yMenu" class="a11y_menu" aria-label="접근성메뉴">
			<h2 class="blind">접근성메뉴<span><i class="fa-solid fa-x"></i></span></h2>
        	
        	<ul>
        		<li class="a11y_invert"><button id="setInvert" aria-pressed="false"><span>색상반전</span></button></li>
				<li class="a11y_zoomin"><button id="setZoomin"><span>확대</span></button></li>
				<li class="a11y_zoomout"><button id="setZoomout"><span>축소</span></button></li>
				<li class="a11y_magnify"><button id="setMagnify" aria-pressed="false"><span>돋보기</span></button></li>
			</ul>
			
			<dl aria-live="polite"></dl> 
		</div>	
        <!-- 카테고리선텍 div -->
        <div id="category">
        	<div id="search_Con">
        			<select name="type" id="search_option">
        					<option value="">검색</option>
                			<option value="D">전체</option>
                			<option value="A">시/도</option>
							<option value="B">구/군</option>
							<option value="C">관광지명</option>
        	       	</select>
        			
        			<input type="text" name="search" id="search" onkeyup="inputEnter();" placeholder="관광지를 검색해보세요">
					<button type="button" id="searchBtn" ><i class="fa-solid fa-magnifying-glass"></i></button>
        		</div>
            <div class="category_Con">
                <div class="category_Ele cateEle_1">
                    <input type="radio" name="type" id="radio1" class="radio">
                    
                    <label for="radio1" class="label1">
                    <a href="/board/travelLeg">
                        <i class="fa-solid fa-wheelchair"></i>
                        <span>지체장애</span>
                        </a>
                    </label>
                </div>

                <div class="category_Ele cateEle_2">
                    <input type="radio" name="type" id="radio2"class="radio">
                    
                    <label for="radio2" class="label1">
                    <a href="/board/travelEars">
                        <i class="fa-solid fa-ear-deaf" style="color:#000;"></i>
                        
                        <span style="color:#000; border-bottom: 3px solid #000;">청각장애</span>
                        </a>
                    </label>
                </div>

                <div class="category_Ele cateEle_3">
                    <input type="radio" name="type" id="radio3"class="radio">
                    
                    <label for="radio3" class="label1">
                    <a href="/board/travelEyes">
                        <i class="fa-solid fa-eye-low-vision"></i>
                        
                        <span>시각장애</span>
                        </a>
                    </label>
                </div>
            </div>
			<!-- 카테고리 bar -->
            <div class="category_Bar"></div>
			<!-- 카테고리 선택 -->
            <div class="category_Con2">
            	<ul class="category_Con2_ul">
					<li class='category_Ele2'>
						<input type="checkbox" name="chkArr" id="chkArr1" value="A">
						<label for="chkArr1" class="labelActive"><i class="fa-solid fa-square-parking"></i><span>주차안내</span></label>
					</li>

					<li class='category_Ele2'>
						<input type="checkbox" name="chkArr" id="chkArr2" class="btnActive" value="B">
						<label for="chkArr2" class="labelActive"><i class="fa-solid fa-clipboard"></i><span>수화안내</span></label>
					</li>

					<li class='category_Ele2'>
						<input type="checkbox" name="chkArr" id="chkArr3" class="btnActive" value="C">
						<label for="chkArr3" class="labelActive"><i class="fa-solid fa-desktop"></i><span>영상자막안내</span></label>
					</li>

					<li class='category_Ele2'>
						<input type="checkbox" name="chkArr" id="chkArr4" class="btnActive" value="D">
						<label for="chkArr4" class="labelActive"><i class="fa-solid fa-user"></i><span>안내요원</span></label>
					</li>
					
					<li class='category_Ele2'>
						<input type="checkbox" name="chkArr" id="chkArr5" class="btnActive" value="E">
						<label for="chkArr5" class="labelActive"><i class="fa-solid fa-ellipsis"></i><span>안내상세</span></label>
					</li>
				</ul>
			<!-- 지역 select box --> 
			<div class="category_area">
				<p>지역선택</p>
					<div class="form">
                        <select name="keyword" id="sido1">
                        	<option value="">시/도 선택</option>
                			<option value="서울특별시">서울특별시</option>
                			<option value="인천광역시">인천광역시</option>
                			<option value="대전광역시">대전광역시</option>
                			<option value="광주광역시">광주광역시</option>
                			<option value="대구광역시">대구광역시</option>
                			<option value="울산광역시">울산광역시</option>
                			<option value="부산광역시">부산광역시</option>
                			<option value="경기도">경기도</option>
                			<option value="강원도">강원도</option>
                			<option value="충청북도">충청북도</option>
                			<option value="충청남도">충청남도</option>
                			<option value="전라북도">전라북도</option>
                			<option value="전라남도">전라남도</option>
                			<option value="경상북도">경상북도</option>
                			<option value="경상남도">경상남도</option>
                			<option value="제주도">제주도</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <!-- section 시작 -->   
        <div id="section">
        	<c:forEach items="${earslist}" var="earsList" varStatus="vs">
                <div class="section_Con">
                	<!-- 이미지 -->
                	<span class="section_Ele_Img">
                		<img src="${earsList.firstimage}">
                	</span>
                	<!-- 정보창 -->
                	<div class="section_Ele_Cont">
                		<ul class="section_Ele_cont_Ul1">
                			<li style="font-size:1.4rem; color:#1A1A1A; font-weight:700;"><c:out value="${earsList.location_name}"></c:out></li>
                			<li style="colir:#5D5E5D"><c:out value="${earsList.address} "></c:out></li>
                		</ul>
                		<!-- section_Ele bar -->
                		<span class="section_Ele_cont_bar"></span>
                		<!-- 정보창 아이콘 -->
                		<ul class="section_Ele_cont_Ul2">
                			<c:set var="earsList1" value="${earsList}" />
                				<c:if test="${earsList1.parking != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-square-parking"></i>
                					</li>
                				</c:if>
                				
                				<c:if test="${earsList1.guidehuman != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-user"></i>
                					</li>
                				</c:if>
                				
                				<c:if test="${earsList1.signguide != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-clipboard"></i>
                					</li>
                				</c:if>
                				
                				<c:if test="${earsList1.videoguide != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-desktop"></i>
                					</li>
                				</c:if>
                				
                				<c:if test="${earsList1.hearinghandicapetc != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-ellipsis"></i>
                					</li>
                				</c:if>

	                	</ul>  
                		<!-- 정보상세 -->
                		<ul class="section_Ele_Cont_Detail" id="section_Ele_Cont_Detail${vs.index}">
                			<c:if test="${earsList1.parking != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${earsList1.parking}</span>
                				</li>		
                			</c:if>
                				
                			<c:if test="${earsList1.guidehuman != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${earsList1.guidehuman}</span>
               					</li>  					
               				</c:if>
                				
                			<c:if test="${earsList1.signguide != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${earsList1.signguide}</span>
                				</li>					
							</c:if>
                				
                			<c:if test="${earsList1.videoguide != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${earsList1.videoguide}</span>
                				</li>					
                			</c:if>
                			
                			<c:if test="${earsList1.hearinghandicapetc != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${earsList1.hearinghandicapetc}</span>
                				</li>					
                			</c:if>
                		</ul>             	
                	</div>
                </div>			
			</c:forEach>
        </div>
		<!-- 페이징 -->
        <div class="section_Page">
            <ul class="pageInfoEars" id="pageInfoEars">
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
         <!-- form -->
        <form id="moveForm" method="GET">
        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        </form>
        <!-- footer -->
        <div id="footer">

        </div>

    </div>
     <!-- container end-->
	<div id="magnifyImg" class="magnify_area">
		<div id="magnifyLense" class="magnify_lense"></div>
	</div>
</div>
<!-- wrap end-->
</body>
<script>
////////////////////////////////////////////////////
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
/////////////////////유효성 검사///////////////////////////

let moveForm = $("#moveForm");
let totalData;
let dataPerPage = 12;
let pageCount = 10;
let globalCurrentPage = 1;

	$('.pageInfoEars a').on('click', function(e) {
		//페이지 이동 
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.submit();
	});
	$()
	
	$('#sido1').on('change',function(){
		//select box 변경시 ajax 호출
		ajaxEarsCate();
	})
	$('input[name="chkArr"]').change(function(){
		//check box 체크시 ajax 호출
		if($('input[name="chkArr"]').is(':checked')){
			
			ajaxEarsCate();
		} 
	})
	
	$('#searchBtn').on('click', function(){
		//input 클릭시 ajax 호출
		ajaxEarsCate();
	});
	
	function inputEnter(){
		//input enter할 때 ajax 호출
		if(window.event.keyCode == 13){
			
			ajaxEarsCate();
		}
			
	}
	$('#search_option').on('change',function(){
		//sido select box 변경시 ajax 호출
		ajaxEarsCate();
	})
	

	function ajaxEarsCate(){
		//ajax 호출 함수
		let sido = $('#sido1 option:selected').val();
		let search = $('#search').val();
		let chkArr = [];
		let searchOp = $('#search_option option:selected').val();
		$("input[name='chkArr']:checked").each(function(i) {
	        chkArr.push($(this).val());
		});
		
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
			});


		$.ajax({
			type:'POST',
			url:'/board/ajaxEarsCate',
			data:{
				sido:sido,
				chkArry:chkArr,
				search:search,
				searchOp:searchOp
				
			},
			success:function(data){
				if(data.earslist.length < 12){
					dataPerPage = data.earslist.length
				}
				totalData = data.earslist.length;
				paging(totalData, dataPerPage, pageCount, 1);
				displayData(1, dataPerPage);
				
				function paging(totalData, dataPerPage, pageCount, currentPage) {
					//페이지 이동 바 생성 함수
				    totalPage = Math.ceil(totalData / dataPerPage);
				    if(totalPage<pageCount){
				    pageCount=totalPage;
				    }
				    let pageGroup = Math.ceil(currentPage / pageCount);
				    let last = pageGroup * pageCount;
				  
				    if (last > totalPage) {
				        last = totalPage;
				    }
				    let first = last - (pageCount - 1);
				    let next = last + 1;
				    let prev = first - 1;
				    let pageHtml = "";
				    pageHtml += ' <ul class="pageInfoEars" id="pageInfoEars">'
					    if (prev > 0) {
					        pageHtml += "<li class='pageInfo_btn previous'><a href='#' id='prev'> 이전 </a></li>";
					    }
					    for (var i = first; i <= last; i++) {
					        if (currentPage == i) {
					            pageHtml += "<li class='pageInfo_btn on'><a href='#' id='" + i + "'>" + i + "</a></li>";
					        } 
					        else {
					            pageHtml += "<li class='pageInfo_btn on'><a href='#' id='" + i + "'>" + i + "</a></li>";
					        }
					    }
					    if (last < totalPage) {
					    pageHtml += "<li class ='pageInfo_btn next'><a href='#' id='next'> 다음 </a></li>";
					    }
					    pageHtml += '</ul>'
				    $(".section_Page").html(pageHtml);
				    let displayCount = "";
				    displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
				    $("#displayCount").text(displayCount);

				    $(".pageInfoEars li a").click(function () {
				    	//페이지 번호 클릭시 페이징 함수 재호출
				        let $id = $(this).attr("id");
				        selectedPage = $(this).text();
				        if ($id == "next") selectedPage = next;
				        if ($id == "prev") selectedPage = prev;
				        globalCurrentPage = selectedPage;
				    
				        paging(totalData, dataPerPage, pageCount, selectedPage);
				        
				        displayData(selectedPage, dataPerPage);
				    });
				}
				
				function displayData(currentPage, dataPerPage) {
					//ajax 데이터 리스트 출력 함수
				var dataHtml = '';
				
				 currentPage = Number(currentPage);
				 dataPerPage = Number(dataPerPage);
				  
				 for (var i = (currentPage - 1) * dataPerPage; i < (currentPage - 1) * dataPerPage + dataPerPage; i++) {
					
					dataHtml += '<div class="section_Con">'
					dataHtml += '<span class="section_Ele_Img">'
					dataHtml += "<img src="+data.earslist[i].firstimage+">"
					dataHtml += '</span>'
					dataHtml += '<div class="section_Ele_Cont">'
					dataHtml += '<ul class="section_Ele_cont_Ul1">'
					dataHtml += "<li style='font-size:1.4rem; color:#1A1A1A; font-weight:700;'>"+data.earslist[i].location_name+"</li>"
					dataHtml += '<li style="colir:#5D5E5D">'+data.earslist[i].address+'</li>'
					dataHtml += '</ul>'
					dataHtml += '<span class="section_Ele_cont_bar"></span>'
					dataHtml += '<ul class="section_Ele_cont_Ul2">'
					dataHtml += '<li class="section_Ele_Cont_Li" onmouseover = document.querySelector("#section_Ele_Cont_Detail'+[i]+'").style.display="flex" onmouseleave = document.querySelector("#section_Ele_Cont_Detail'+[i]+'").style.display="none">'
					if(data.earslist[i].parking != null){
					dataHtml += '<i class="fa-solid fa-square-parking"></i>'	
					}
					dataHtml += '</li>'
					dataHtml += '<li class="section_Ele_Cont_Li" onmouseover = document.querySelector("#section_Ele_Cont_Detail'+[i]+'").style.display="flex" onmouseleave = document.querySelector("#section_Ele_Cont_Detail'+[i]+'").style.display="none">'
					if(data.earslist[i].signguide != null){
					dataHtml += '<i class="fa-solid fa-clipboard"></i>'
					}
					dataHtml += '</li>'
					dataHtml += '<li class="section_Ele_Cont_Li" onmouseover = document.querySelector("#section_Ele_Cont_Detail'+[i]+'").style.display="flex" onmouseleave = document.querySelector("#section_Ele_Cont_Detail'+[i]+'").style.display="none">'
					if(data.earslist[i].videoguide != null){
					dataHtml += '<i class="fa-solid fa-desktop"></i>'
					}
					dataHtml += '</li>'
					dataHtml += '<li class="section_Ele_Cont_Li" onmouseover = document.querySelector("#section_Ele_Cont_Detail'+[i]+'").style.display="flex" onmouseleave = document.querySelector("#section_Ele_Cont_Detail'+[i]+'").style.display="none">'
					if(data.earslist[i].guidehuman != null){
					dataHtml += '<i class="fa-solid fa-user"></i>'
					dataHtml += '</li>'
					}
					dataHtml += '<li class="section_Ele_Cont_Li" onmouseover = document.querySelector("#section_Ele_Cont_Detail'+[i]+'").style.display="flex" onmouseleave = document.querySelector("#section_Ele_Cont_Detail'+[i]+'").style.display="none">'
					if(data.earslist[i].hearinghandicapetc != null){
					dataHtml += '<i class="fa-solid fa-ellipsis"></i>'
					dataHtml += '</li>'
					}
					dataHtml += '</ul>'
					dataHtml += '<ul class="section_Ele_Cont_Detail" id="section_Ele_Cont_Detail'+[i]+'">'
					if(data.earslist[i].parking != null){
					dataHtml += '<li class="section_Ele_Cont_Detail_Li">'
					dataHtml += '<span>'+data.earslist[i].parking+'</span>'
					}
					dataHtml += '</li>'
					if(data.earslist[i].signguide != null){
					dataHtml += '<li class="section_Ele_Cont_Detail_Li">'
					dataHtml += '<span>'+data.earslist[i].signguide+'</span>'
					}
					dataHtml += '</li>'
					if(data.earslist[i].videoguide != null){
					dataHtml += '<li class="section_Ele_Cont_Detail_Li">'
					dataHtml += '<span>'+data.earslist[i].videoguide+'</span>'
					}
					dataHtml += '</li>'
					if(data.earslist[i].guidehuman != null){
					dataHtml += '<li class="section_Ele_Cont_Detail_Li">'
					dataHtml += '<span>'+data.earslist[i].guidehuman+'</span>'
					}
					if(data.earslist[i].hearinghandicapetc != null){
					dataHtml += '<li class="section_Ele_Cont_Detail_Li">'
					dataHtml += '<span>'+data.earslist[i].hearinghandicapetc+'</span>'
					}
					dataHtml += '</li>'
					dataHtml += '</ul>'
					dataHtml += '</div>'
					dataHtml += '</div>'

				}
				 $('#section').html(dataHtml)
				
				}
			},
			
			error: function (request, status, error) {

				alert("잘못된 접근 입니다. 관리자에게 문의하세요.");
				
			}
		})
	}
</script>
<script src="https://kit.fontawesome.com/f9f8c57db8.js" crossorigin="anonymous"></script>
</html>