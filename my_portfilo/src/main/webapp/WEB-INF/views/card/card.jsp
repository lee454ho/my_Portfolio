<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${path}/resources/image/siteLogopavi.ico">
<title>서울시 아동급식카드 가맹점</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container{
	width: 100%;
	padding-top: 450px;
}

#map {
	width: 100%;
	height: 450px;
	margin-bottom: 50px;
	position: fixed;
}
 
#top_btn{
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background-color: gray;
	position: fixed;
	right: 10px;
	top: 430px;
	cursor: pointer;
	text-align: center;
	line-height: 50px;
}


/* 인포윈도우 커스텀 시작*/
.info_container {
	width: 630px;
	box-shadow: 3px 3px 15px gray;
}

.header {
	background-color: gainsboro;
	height: 50px;
	padding-left: 20px;
	display: flex;
	align-items: center;
	font-weight: bolder;
	font-size: 20px;
	position: relative;
}

.contents {
	height: 70%;
	font-size: 13px;
	padding-left: 20px;
}

#close_btn {
	position: absolute;
	right: 10px;
	cursor: pointer;
}
/* 인포윈도우 커스텀 끝 */

#keyword {
	width: 500px;
	height: 40px;
}

#submit {
	width: 50px;
	height: 40px;
}

table {
	width: 100vw;
	border-collapse: collapse;
	margin-top: 20px;
}

table td {
	border: 1px solid black;
}

thead {
	margin-right: 50px;
	font-size: 20px;
	font-weight: bolder;
	background-color: #dcdcdc;
}

.district {
	display: flex;
	flex-wrap: wrap;
	width: 500px;
}

/* 지역 선택 select */
#area_select{ 
	height: 40px;
}

/* 업종 선택 select */
#category_select{
	height: 40px;
}

input[type=button] {
	width: 100px;
	height: 50px;
}

.info td{
	padding: 20px;
	font-size: 17px;
}
</style>
</head>
<body>

	<div id="map"></div>
	<div class="container">
		<div id="top_btn">
			<i class="fa fa-arrow-up" style="font-size:20px; color: white"></i>
		</div>
	</div>
	<form name="search-form" onsubmit="return false;">
		<select name="type" id="area_select">
			<option selected value="">지역 선택</option>
			<option value="Gangnam">강남</option>
			<option value="Gangdong">강동</option>
			<option value="Gangbuk">강북</option>
			<option value="Gangseo">강서</option>
			<option value="Gwanak">관악</option>
			<option value="Gwangjin">광진</option>
			<option value="Guro">구로</option>
			<option value="Geumcheon">금천</option>
			<option value="Nowon">노원</option>
			<option value="Dobong">도봉</option>
			<option value="DongDaeMoon">동대문</option>
			<option value="Dongjak">동작</option>
			<option value="Mapo">마포</option>
			<option value="Seodaemun">서대문</option>
			<option value="Seocho">서초</option>
			<option value="Seongdong">성동</option>
			<option value="Seongbuk">성북</option>
			<option value="Songpa">송파</option>
			<option value="Yangcheon">양천</option>
			<option value="Yeongdeungpo">영등포</option>
			<option value="Yongsan">용산</option>
			<option value="Eunpyeong">은평</option>
			<option value="Jongno">종로</option>
			<option value="Jung">중구</option>
			<option value="Jungnang">중랑</option>
		</select>
		<select name="category_select" id="category_select">
			<option selected value="">업종 선택</option>
			<option value="convenience_store">편의점</option>
			<option value="restaurant">음식점</option>
			<option value="fast_food">패스트푸드</option>
			<option value="bakery">제과점</option>
		
		</select>

		<input type="text" placeholder="가게 이름을 검색하세요" name="keyword"
			id="keyword"> <input type="button" onclick="getlist()" value="검색" id="submit">
	</form>
	<div class="map_info">
		<table>
			<thead>
				<tr style="height: 50px; text-align: center;">
					<td>업종명</td>
					<td>가맹점</td>
					<!-- <td>도로명 주소</td>
					<td>지번 주소</td> -->
					<td>전화번호</td>
				</tr>
			</thead>

			<tbody class="table_body">

			</tbody>
		</table>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b8e40537993dfe9d692deb2ce35f4966&libraries=services,clusterer,drawing"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<script>
	////////////////////////////////////////////////////
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	///////////////////////////////////////////////

		var container = document.getElementById('map'); // 지도를 표시할 div 
		var options = {
			center : new kakao.maps.LatLng(37.5666805, 126.9784147), // 지도의 중심좌표
			level : 9
		};
		var map = new kakao.maps.Map(container, options); // 지도를 생성합니다    
		
		var mapTypeControl = new kakao.maps.MapTypeControl(); // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성합니다
		var area_select = document.querySelector('#area_select');
		var category_select = document.querySelector('#category_select');
		var keyword = document.querySelector("#keyword"); //검색어 입력값
		var top_btn = document.querySelector('#top_btn'); // 맨 위로 이동하는 버튼
		var markers=[];

		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도
				locPosition = new kakao.maps.LatLng(lat, lon); // 표시될 위치입니다 
				// 지도 중심좌표를 접속위치로 변경합니다 
				map.setCenter(locPosition);
			})
		}
		// HTML5의 GeoLocation을 사용할 수 없을때
		else {
			alert('geolocation을 사용할수 없어요');
		};
		
		// 맨 위로 이동하는 버튼을 눌렀을 때
		top_btn.addEventListener('click',function(){
			window.scrollTo(0,0);
		})
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});
		
	function getlist() {
		$.ajax({
			type:"POST",           
			url:"/board/getList",  // 호출할 requestMapping value 이름         
			//dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨  
			/* contentType : "application/json; charset=UTF-8", */
			data : $("form[name=search-form]").serialize(), // form데이터를 한번에 추출할 수 있는 메서드인 serialize(), form안에 있는 모든 데이터의 name과 value를 취득해서 파라미터 형식으로 만들어 줍니다, name과 동일한 단어로 VO (DTO)에서  getter/setter값을 모두 지정해두어야합니다, CONTROLLER에서 인자로 넣어주면 자동으로 값을 넣어서 가져옵니다. 

			success : function(result) {  // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다   
				map_marker(result);
			},
			
			error : function(xhr, status, error) { 
				alert("에러발생");
			}
		});
	};

function map_marker(result){
	removeMarker(); // 마커 초기화
	clusterer.clear(); // 클러스터링 초기화
	if(area_select.value!="" && category_select.value!=""){
		var str;
		$.each(result , function(i){
			str += '<tr class="info">';
			str += '<td class="category">' + result[i].category + '</td><td class="store_name">' + result[i].store_name + '</td><td class="phone">' + result[i].phone + '</td><td class="address_rd" style="display:none;">' + result[i].address_rd + '</td><td class="address_lm" style="display:none;">' + result[i].address_lm + '</td>';
         	str += '</tr>';
    		
     	});
 		$('.table_body').html(str);
     	var info = document.querySelectorAll(".info"); // 가맹점 목록 row
		var address_rd = document.querySelectorAll(".address_rd"); // 도로명 주소
		var address_lm = document.querySelectorAll(".address_lm"); // 지번 주소
		var store_name = document.querySelectorAll(".store_name"); // 가게 이름
		var category = document.querySelectorAll(".category"); // 업종
		var phone = document.querySelectorAll(".phone"); // 가게 전화번호
		var infowindow = new kakao.maps.InfoWindow({zIndex:1}); //인포윈도우를 생성
		
		for (let i = 0; i < store_name.length; i++) {
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address_rd[i].innerText,function(result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					if(category[i].innerText=="편의점"){
					var imageSrc = '${path}/resources/markerImg/red_pin.png', // 마커이미지의 주소입니다    
				    imageSize = new kakao.maps.Size(40, 45), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
						map : map,
						position : coords,
						image: markerImage // 마커이미지 설정
						})
						markers.push(marker);
				    } else if(category[i].innerText=="한식" || category[i].innerText=="중식" || category[i].innerText=="일식" || category[i].innerText=="양식" || category[i].innerText=="일반대중음식" ){
				    	var imageSrc = '${path}/resources/markerImg/pink_pin.png', // 마커이미지의 주소입니다    
					    imageSize = new kakao.maps.Size(40, 45), // 마커이미지의 크기입니다
					    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new kakao.maps.Marker({
							map : map,
							position : coords,
							image: markerImage // 마커이미지 설정
						})
						markers.push(marker);
				    } else if(category[i].innerText=="패스트푸드"){
				    	var imageSrc = '${path}/resources/markerImg/gray_pin.png', // 마커이미지의 주소입니다    
					    imageSize = new kakao.maps.Size(40, 45), // 마커이미지의 크기입니다
					    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new kakao.maps.Marker({
							map : map,
							position : coords,
							image: markerImage // 마커이미지 설정
						})
						markers.push(marker);
				    } else if(category[i].innerText=="제과점"){
				    	var imageSrc = '${path}/resources/markerImg/yellow_pin.png', // 마커이미지의 주소입니다    
					    imageSize = new kakao.maps.Size(40, 45), // 마커이미지의 크기입니다
					    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new kakao.maps.Marker({
							map : map,
							position : coords,
							image: markerImage // 마커이미지 설정
						})
						markers.push(marker);
				    } else{
				    	var imageSrc = '${path}/resources/markerImg/brown_pin.png', // 마커이미지의 주소입니다    
					    imageSize = new kakao.maps.Size(40, 45), // 마커이미지의 크기입니다
					    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new kakao.maps.Marker({
							map : map,
							position : coords,
							image: markerImage // 마커이미지 설정
						})
						markers.push(marker);
				    }
					
				// 마커 클릭 시 인포윈도우 팝업 띄우기
				kakao.maps.event.addListener(marker,'click',function(){
					var content = '<div class="info_container" id="info_store_name">'+
			        '<div class="header">'+store_name[i].innerHTML+ 
		            '<i class="fa fa-times" id="close_btn" style="font-size: 30px;"></i>'+
		        	'</div>'+
		        '<div class="contents">'+
		            '<div style="padding: 10px 0"><span style="font-weight: bolder;">주소</span> <span style="padding-left: 75px;">(도로명)'+ address_rd[i].innerHTML +'</span>'+
		            '<div style="padding-left: 105px;">(지번) &nbsp;&nbsp;'+ address_lm[i].innerHTML + '</div></div>'+
		            '<div style="padding: 10px 0"><span style="font-weight: bolder;">업종</span><span style="padding-left: 80px;">'+ category[i].innerHTML +'</span></div>'+
		            '<div style="padding: 10px 0"><span style="font-weight: bolder;">전화번호</span><span style="margin-left: 50px;">'+ phone[i].innerHTML +'</span></div>'+
		        '</div>'+
		    	'</div>';
				infowindow.setContent(content); // 인포윈도우의 내용을 지정한다.									
				infowindow.setPosition(this.getPosition()); // 인포윈도우의 좌표를 지정한다.
				infowindow.open(map,this); // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				var close_btn = document.getElementById("close_btn");
				 
				
				// 마커 클릭시 지도의 중심좌표를 마커위치로 이동
				// 인포윈도우 클릭시 해당 목록으로 이동
				info_store_name.addEventListener('click',function() {
					info[i].scrollIntoView(false);
					})
				// 인포윈도우 닫기 버튼 클릭
				close_btn.addEventListener('click',function(){
					infowindow.close();
				})
				})
				}
							
    			// 클러스터러에 마커들을 추가합니다
    	        clusterer.addMarkers(markers); 	

			})
			
		}

	} else if(keyword.length<2){
		alert("검색어를 두 글자 이상 입력하세요");
		keyword.focus();
	} else if(area_select.value==""){
		alert("지역 선택을 해주세요");
		area_select.focus();
	} else if(category_select.value==""){
		alert("업종 선택을 해주세요");
		category_select.focus();
	}
}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 마커 클러스터러를 생성합니다 
	var clusterer = new kakao.maps.MarkerClusterer({
    	map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    	averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    	minLevel: 5 // 클러스터 할 최소 지도 레벨 
	});
        

	</script>
</body>
</html>