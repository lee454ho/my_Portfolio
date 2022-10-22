var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.56681068671429, 126.97864660315285), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  
 
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

  if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
          
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition);
         // max_map();
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition) {
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    


    
 // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow();
	
  //마커 이미지
  
 
 
//주소-좌표 변환 객체를 생성합니다

var geocoder = new kakao.maps.services.Geocoder();

var address_LatLng = document.querySelectorAll("#address_LatLng");
var fac_infoname = document.querySelectorAll("#fac_infoname");
var info = document.querySelectorAll(".info");
let input_eval = document.querySelectorAll(".detail_eval");
var array_eval = [];





 for(let i=0; i<address_LatLng.length;i++){
// 주소로 좌표를 검색합니다
geocoder.addressSearch(address_LatLng[i].innerText, function(result, status){

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
      // 편의시설 내용을 전역변수 array_eval에 저장
      array_eval[i] = input_eval[i].innerText;
  	
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        
        
        
        // 결과값으로 받은 위치를 마커로 표시합니다
          var marker = new kakao.maps.Marker({
            map: map,
            position: coords,
            
        })  
    //      markers.push(marker);
          
          kakao.maps.event.addListener(marker,'click',function(mouseEvent){
            // 저장된 array_eval에 문자열이 포함된 인덱스 값을 저장하는 변수
            var icon_input_restroom = array_eval[i].indexOf("대변기");
            var icon_input_parking = array_eval[i].indexOf("장애인전용주차구역");
            var icon_input_elevator = array_eval[i].indexOf("승강설비");
            
              infowindow.setContent('<div id="info_click" style="padding:5px;">'+fac_infoname[i].innerText+"<p>"+"<i class='empty'>"+"</i>"+"&nbsp"+"&nbsp"+"<i class='empty2'>"+"</i>"+"&nbsp"+"&nbsp"+"<i class='empty3'>"+"</i>"+"</p>"+"<div class='close_icon'>"+"<i class='fa-solid fa-xmark'>"+"</i>"+"</div>"+'</div>');
              
              infowindow.setPosition(this.getPosition());
              infowindow.open(map,this);
              map.setCenter(this.getPosition()); // 마커 클릭시 지도의 중심좌표를 마커위치로 이동
              var icon_class_restroom = document.querySelector(".empty");
              var icon_class_parking = document.querySelector(".empty2");
              var icon_class_elevator = document.querySelector(".empty3");
              var close_icon = document.querySelector(".close_icon");
              // 인덱스값이 존재한다면 아이콘에 클래스를 추가하는 조건문
              // 화장실,주차구역,승강기 셋 다 존재한다면
              if(icon_input_restroom !== -1 && icon_input_parking !== -1 && icon_input_elevator !== -1 ){
                icon_class_restroom.classList.add("fa-solid");
                icon_class_restroom.classList.add("fa-restroom");
                icon_class_parking.classList.add("fa-solid");
                icon_class_parking.classList.add("fa-square-parking");
                icon_class_elevator.classList.add("fa-solid");
                icon_class_elevator.classList.add("fa-elevator");
                // 화장실과 주차구역이 존재한다면
            }else if(icon_input_restroom !== -1 && icon_input_parking !== -1){
                icon_class_restroom.classList.add("fa-solid");
                icon_class_restroom.classList.add("fa-restroom");
                icon_class_parking.classList.add("fa-solid");
                icon_class_parking.classList.add("fa-square-parking");
                // 화장실과 승강기가 존재한다면
            }else if(icon_input_restroom !== -1 && icon_input_elevator !== -1){
                icon_class_restroom.classList.add("fa-solid");
                icon_class_restroom.classList.add("fa-restroom");
                icon_class_elevator.classList.add("fa-solid");
                icon_class_elevator.classList.add("fa-elevator");
            }
                // 주차구역과 승강기가 존재한다면
            else if(icon_input_parking !== -1 && icon_input_elevator !== -1){
                icon_class_parking.classList.add("fa-solid");
                icon_class_parking.classList.add("fa-square-parking");
                icon_class_elevator.classList.add("fa-solid");
                icon_class_elevator.classList.add("fa-elevator");
            }
            // 화장실만 존재한다면
            else if(icon_input_restroom !== -1){
              icon_class_restroom.classList.add("fa-solid");
              icon_class_restroom.classList.add("fa-restroom");
              // 주차구역만 존재한다면
            }else if(icon_input_parking !== -1){
              icon_class_parking.classList.add("fa-solid");
                icon_class_parking.classList.add("fa-square-parking");
              // 승강기만 존재한다면
              }else if(icon_input_elevator !== -1){
              icon_class_elevator.classList.add("fa-solid");
              icon_class_elevator.classList.add("fa-elevator");
            }
      
        		// 인포윈도우 클릭시 해당 내용의 목록으로 스크롤 이동
                info_click.addEventListener('click',function(){
                    
              
                    info[i].scrollIntoView(false);

                 })
                 close_icon.addEventListener('click',function(){
                  infowindow.close();
                })
                });

     
    	}  
	} )

}

 
var pointer_top = document.querySelector(".pointer_top");

pointer_top.addEventListener('click',function(){
  window.scrollTo(0,0);
})

