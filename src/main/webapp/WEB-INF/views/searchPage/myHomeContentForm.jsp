<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@include file="../common/common.jsp" %>
<!-- JQuery 라이브러리 import 하기 -->
<script src="/resources/js/jquery-1.11.0.min.js"></script>
<!-- css 파일 import 하기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6280749fe495fb2981cca4972a974a7f&libraries=services"></script>
 
<head>
<script>
function goMyHomeUpDelForm(){
	//-----------------------------------------
	//name=boardUpDelForm 을 가진 form 태그 내부의 action값의 URL주소로 서버에 접속하기
	// 즉, 상세보기 화면으로 이동하기
	//-----------------------------------------
	document.myHomeUpDelForm.submit();
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</head>


<body>


<center>
	공공주택 상세 페이지

	
	<c:if test="${!empty requestScope.myHomeDTO}">
		<table border=1>
			<tr><td>단지명<td>${myHomeDTO.complex_name}
			<tr><td>공급규모<td>${myHomeDTO.house_num}세대 / ${myHomeDTO.tot_house_num}세대
			<tr><td>최초입주년월<td>${myHomeDTO.year_of_first_move_date}년 ${myHomeDTO.month_of_first_move_date}일
			<tr><td>상세주소<td>${myHomeDTO.detail_location}
			<tr><td>전용면적<td>${myHomeDTO.dedicated_area}m²
			<tr><td>공급유형명<td>${myHomeDTO.supply_type_name}
			<tr><td>월임대료<td>${myHomeDTO.month_rent}
			<tr><td>임대보증금<td>${myHomeDTO.rent_deposit}
		</table> 
	<br/>
	전용면적별 임대조건<br/>
	<c:if test="${requestScope.sameComplexList.size()>1}">
		<table border=1>
		<tr><td>번호<td>단지명<td>전용면적<td>세대수<td>월임대료<td>임대보증금
		<c:forEach var="same" items="${requestScope.sameComplexList}" varStatus="loopTagStatus">
		<tr><td>${loopTagStatus.index+1}
			<td>${same.complex_name}
			<td>${same.dedicated_area}m²
			<td>${same.house_num}세대
			<td>${same.month_rent}
			<td>${same.rent_deposit}
		</c:forEach>
		</table>
	</c:if>
	<c:if test="${requestScope.sameComplexList.size()<=1}">
		해당 정보가 없습니다.
	</c:if>
	<br/>
	<div id="map" style="width:50%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6280749fe495fb2981cca4972a974a7f&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${myHomeDTO.detail_location}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${myHomeDTO.complex_name}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
	<input type="button" value="전체 목록보기" onclick="location.replace('/searchMyHome.do');">
	</c:if> 
	<c:if test="${empty requestScope.myHomeDTO}">
			<script>alert('삭제된 공공주택 상세 페이지입니다.'); location.replace('/searchMyHome.do')</script>
		</c:if>
		<c:if test="${sessionScope.is_admin==1}">
		<br/><button onClick="goMyHomeUpDelForm();">공고문 수정/삭제</button></c:if>
<br/>
<button onClick="location.replace('/main.do')">메인으로 돌아가기</button>
		<form name="myHomeUpDelForm" method="post" action="myHomeUpDelForm.do">
			<input type="hidden" name="rental_detail_no" value="${requestScope.myHomeDTO.rental_detail_no}">
			<input type="hidden" name="rental_no" value="${requestScope.myHomeDTO.rental_no}">
			<!--<input type="text" name="b_no" value="${boardDTO.b_no}">-->
		</form>
</center>
</body>
</html>