<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="${path}/resources/image/siteLogopavi.ico">
	<link href="<c:url value="/resources/css/facility.css"/>" rel='stylesheet' />
	<link rel="stylesheet" 
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<meta charset="UTF-8">
<title>DreamDream 장애인 편의시설</title>
</head>
<body>
  
        <div id="map"></div>
		<div class="pointer_top">위로 가기</div>
		<div class="list_container">
			<div class="search_filter_form">
	<form>
			<input type="text" placeholder="시설명을 입력하세요" name="keyword">
			<input type="submit" value="검색" class="search_submit">
	</form>
	
	<form id="filter">
			<input type="hidden" value="대변기" name="keyword2">
			<input type="button" value="화장실" onclick="document.getElementById('filter').submit();">
	</form>
	<form id="filter2">
	<input type="hidden" value="장애인전용주차구역" name="keyword2">
	<input type="button" value="장애인전용주차구역" onclick="document.getElementById('filter2').submit();">
	</form>
		<form id="filter3">
	<input type="hidden" value="계단 또는 승강설비" name="keyword2">
	<input type="button" value="승강기" onclick="document.getElementById('filter3').submit();">
	</form>
		</div>
	<table class="info_table">
		<thead>
			<tr class="info_list_tr">
				<td class="info_list">주소</td>
				<td class="info_list">시설명</td>
				<td class="info_list">편의시설
				</td>
				
			</tr>
		</thead>
		<tbody>
			<!-- 컨트롤러에서 전달받은 데이터를 반복하기 위해 사용 -->
			<c:forEach items="${data}" var="row">
			<tr class="info">
				<td id="address_LatLng">${row.address}</td>
				<td id="fac_infoname">${row.fac_name}</td>
				<td id="eval_info">마우스 올리면 상세정보가 나타납니다!
				<div class="detail_eval">${row.eval_info}</div> </td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
<script>
    let eval_info_list = '<c:out value="${row.eval_info}"/>';
    </script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2d1f84c3621728a7a2244dc44f0e16ee&libraries=services,clusterer,drawing"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
<script src="<c:url value="/resources/js/facility.js"/>"></script>


</html>