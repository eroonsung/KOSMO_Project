<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@include file="../common/common.jsp" %>
<!-- JQuery 라이브러리 import 하기 -->
<script src="/resources/js/jquery-1.11.0.min.js"></script>
<!-- css 파일 import 하기 -->
 
    <link href="stylesheets/stylesheet.css" rel="stylesheet" type="text/css" />
    <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />

    <link href="/resources/monthpicker/MonthPicker.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/resources/monthpicker/examples.css" />

    <script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script src="https://cdn.rawgit.com/digitalBush/jquery.maskedinput/1.4.1/dist/jquery.maskedinput.min.js"></script>

    <script src="/resources/monthpicker/MonthPicker.min.js"></script>
    <script src="/resources/monthpicker/examples.js"></script>
<head>
<script>
 
$(document).ready(function(){
	
	var month_rent = $(".month_rent").val();
	var rent_deposit = $(".rent_deposit").val();
	
	month_rent = $.trim(month_rent);
	rent_deposit = $.trim(rent_deposit);

	month_rent = month_rent.replaceAll(',','');
	rent_deposit = rent_deposit.replaceAll(',','');
	
	month_rent = month_rent.replace('원','');
	rent_deposit = rent_deposit.replace('원','');
	$(".month_rent").val(month_rent);
	$(".rent_deposit").val(rent_deposit);


	$(".loc").change(function(){
		var thisVal = $(".loc").val();
		$("#yyy").val(thisVal);
			getLocDetailList();
	})

	//--------------------------
		// 단지명 유효성 체크 
		//--------------------------
		$(".complex_name").focusout(function() {
			if($(".complex_name").val()=="") {
				$("#complex_name_check").text("[필수] 단지명을 입력해주세요.");
				return;
			}
			if(isCheck_Home($(".complex_name").val()) == false) {
				$("#complex_name_check").text("단지명은 2-50자 사이입니다.");
				$(".complex_name").val("");
				return;
			} else {
				$("#complex_name_check").text("");
			}
		})
		//--------------------------
		// 세대수 유효성 체크 
		//--------------------------
		$(".house_num").focusout(function() {
			if($(".house_num").val()=="") {
				$("#house_num_check").text("[필수] 세대수를 입력해주세요.");
				return;
			}
			if(isOnly_Number($(".house_num").val()) == false) {
				$("#house_num_check").text("한글은 들어갈 수 없습니다");
				$(".house_num").val("");
				return;
			} else {
				$("#house_num_check").text("");
			}
		})
		//--------------------------
		// 총 세대수 유효성 체크 
		//--------------------------
		$(".tot_house_num").focusout(function() {
			if($(".tot_house_num").val()=="") {
				$("#tot_house_num_check").text("[필수] 총세대수를 입력해주세요.");
				return;
			}
			if(isOnly_Number($(".tot_house_num").val()) == false) {
				$("#tot_house_num_check").text("한글은 들어갈 수 없습니다");
				$(".tot_house_num").val("");
				return;
			} else {
				$("#tot_house_num_check").text("");
			}
		})
		//--------------------------
		// 최초 입주년월 유효성 체크 
		//--------------------------
		$(".first_move_date").focusout(function() {
			if($(".first_move_date").val()=="") {
				$("#first_move_date_check").text("[필수] 최초입주년월을 선택해주세요.");
				return;
			} else {
				$("#first_move_date_check").text("");
			}
		})
		//--------------------------
		// 상세주소 유효성 체크 
		//--------------------------
		$(".detail_location").focusout(function() {
			if($(".detail_location").val()=="") {
				$("#detail_location_check").text("[필수] 상세주소를 입력해주세요.");
				return;
				
			} else {
				$("#detail_location_check").text("");
			}
		})
		//--------------------------
		// 전용면적 유효성 체크 
		//--------------------------
		$(".dedicated_area").focusout(function() {
			if($(".dedicated_area").val()=="") {
				$("#dedicated_area_check").text("[필수] 전용면적을 입력해주세요.");
				return;
			}
			if(isOnly_Number($(".dedicated_area").val()) == false) {
				$("#dedicated_area_check").text("한글은 들어갈 수 없습니다");
				$(".dedicated_area").val("");
				return;
				
			} else {
				$("#dedicated_area_check").text("");
			}
		})
		//--------------------------
		// 월임대료 유효성 체크 
		//--------------------------
		$(".month_rent").focusout(function() {
			if($(".month_rent").val()=="") {
				$("#month_rent_check").text("[필수] 월임대료를 입력해주세요.");
				return;
			}
			if(isOnly_Number($(".month_rent").val()) == false) {
				$("#month_rent_check").text("한글은 들어갈 수 없습니다");
				$(".month_rent").val("");
				return;
				
			} else {
				$("#month_rent_check").text("");
			}
		})
		//--------------------------
		// 임대보증금 유효성 체크 
		//--------------------------
		$(".rent_deposit").focusout(function() {
			if($(".rent_deposit").val()=="") {
				$("#rent_deposit_check").text("[필수] 임대보증금을 입력해주세요.");
				return;
			}
			if(isOnly_Number($(".rent_deposit").val()) == false) {
				$("#rent_deposit_check").text("한글은 들어갈 수 없습니다");
				$(".rent_deposit").val("");
				return;
				
			} else {
				$("#rent_deposit_check").text("");
			}
		})
		//------------------------------
		// 지역명 선택 유효성 체크 
		//------------------------------
		$(".loc").focusout(function() {
			if($(".loc").val()=="") {
				$("#loc_no_check").text("[필수] 지역명을 선택해주세요");
				return;
			} else {
				$("#loc_no_check").text("");
			}
		})
		//------------------------------
		// 상세지역 선택 유효성 체크 
		//------------------------------
		$(".loc_detail").focusout(function() {
			if($(".loc_detail").val()=="") {
				$("#loc_detail_no_check").text("[필수] 상세지역을 선택해주세요");
				return;
			} else {
				$("#loc_detail_no_check").text("");
			}
		})
	
})

function goBackToList(){
	var result = confirm("목록화면으로 돌아가시겠습니까?");
	if(result==true){
		history.back();
	}
}
// **********************************************************
// [게시판 등록 화면]에 입력된 데이터의 유효성 체크 함수 선언
// **********************************************************
function checkMyHomeUpDelForm(upDel){
	//alert(upDel);
	//return;
	//-------------------------------------------------------
	//매개변수로 들어온 upDel에 "up"이 저장되어있으면
	// 즉 수정버튼을 눌렀으면 각 입력양식의 유효성 체크하고 수정여부 물어보기
	//-------------------------------------------------------
	if(upDel=="up"){
		//프로그램 진행상황 확인을 위한 테스트용 태그 만들기
		//$(".xxx").remove();
		//$("body").append("<div class=xxx>수정</div>"); 
		if(confirm("정말 수정하시겠습니까?")==false){return};
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		//name=upDel hidden 태그의 value 값으로 안에 'up'저장하기
		//즉 수정모드라고 저장함
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		$("[name='upDel']").val("up");
	}
	//-------------------------------------------------------
	//매개변수로 들어온 upDel에 "del"이 저장되어있으면
	// 즉 삭제버튼을 눌렀으면 암호 확인하고 삭제 여부를 물어보기
	//-------------------------------------------------------
	else if(upDel=="del"){
		if(confirm("정말 삭제하시겠습니까?")==false){return};
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		//name=upDel hidden 태그의 value 값으로'del'저장하기
		//즉 삭제모드라고 저장함
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		$("[name='upDel']").val("del");
	}
	
	//-------------------------------------------------------
	//현재 화면에서 페이지 이동 없이
	// 서버쪽 "/boardUpDelProc.do"로 접속해서 수정 또는 삭제하기
	//-------------------------------------------------------
	$.ajax({
		// 서버쪽 호출 URL 주소 지정
		url:"/myHomeUpDelProc.do"
		// form 태그 안의 입력양식 데이터 즉, 파라미터값을 보내는 방법 지정 
		, type: "post"
		// 웹서버로 보낼 파라미터명과 파라미터값을 설정
		, data: $("[name=myHomeUpDelForm]").serialize()
		//--------------------------------------------
		// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
		// 익명함수의 매개변수에는 서버가 보내온 html 소스가 문자열로 들어온다
		// 즉 응답 메시지 안의 html 소스가 문자열로써 익명함수의 매개변수로 들어온다.
		// 응답 메시지 안의 html 소스는 boardRegProc.jsp의 실행 결과물이다.
		//--------------------------------------------				
		, success: function (json) {
			//-----------------------------------------
			//JSON객체에서 유효성 체크 문자열 꺼내기
			//JSON객체에서 수정/삭제 성공 행의 개수 꺼내기
			//-----------------------------------------
			var myHomeUpDelCnt = json.myHomeUpDelCnt;
			myHomeUpDelCnt = parseInt(myHomeUpDelCnt,10);
			
			var msg = json.msg;

			//====================================================
			if(upDel=="up"){
				if(msg!=""&& msg.length>0){
					alert(msg);
					return;
				}
				
				if(myHomeUpDelCnt == -1){
					alert("모집공고가 삭제되었습니다.");
					location.replace("/searchMyHome.do");
				}else if(myHomeUpDelCnt == 1){
					if(confirm("수정 성공. 목록화면으로 이동하시겠습니까?")){
						location.replace("/searchMyHome.do");
					}else{
						return;
					}
				}else{
					alert("서버 에러 발생! 관리자에게 문의 바람.");
				}
			}
			//====================================================
			else if(upDel=="del"){
				if(myHomeUpDelCnt == 1){
					alert("삭제성공.");
					location.replace("/searchMyHome.do");
				}else{
					alert("서버 에러 발생! 관리자에게 문의 바람.");
				}
				
			}
		}
		//--------------------------------------------
		// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
		//--------------------------------------------		
		, error: function(){
			alert("서버 접속 실패");
		}
	})
}
function getLocDetailList(){
	$.ajax({
		url: "/searchMyHome.do"
		, type :"post"
		, data: $("[name=getLocDetailList]").serialize()  
		, success: function(responseHtml){

			$(".loc_detail").html(
				 $(responseHtml).find(".loc_detail").html()
				);

		}
		,error: function(){
			alert("서버 접속 실패");
		}
	});
}
</script>
</head>


<body>
<br/>
<br/>
<br/>
<center>
	공공주택 수정/삭제 페이지
	
<form name="getLocDetailList">
	<input type="hidden" name="xxx" id="yyy">
</form>
	
		<c:if test="${!empty requestScope.myHomeDTO}">
		<form name="myHomeUpDelForm">
		
		<table border=1>
			<tr><td>단지명<td>
			<input type="text" name="complex_name" class="complex_name" value="${myHomeDTO.complex_name}"></td>
			<div id="complex_name_check"></div>
			<tr><td>세대수<td>
			<input type="text" name="house_num" class="house_num" value="${myHomeDTO.house_num}">세대</td>
			<div id="house_num_check"></div>
			<tr><td>총세대수<td>
			<input type="text" name="tot_house_num" class="tot_house_num" value="${myHomeDTO.tot_house_num}">세대</td>
			<div id="tot_house_num_check"></div>
			<tr><td>최초입주년월<td><input id="IconDemo" name="move_date" class='Default first_move_date' type="text" value="${myHomeDTO.year_of_first_move_date}-${myHomeDTO.month_of_first_move_date}"/>
			<tr><td>지역
						<td>
				<select name="loc_no" class="loc">
					<c:forEach var="loc" items="${locationList}">
						<option value="${loc.loc_no}" class="loc_no" ${loc.loc_no==myHomeDTO.loc_no?'selected':''}>${loc.loc_name}
					</c:forEach>
				</select>
				<select name="loc_detail_no" class="loc_detail">
				
					<c:forEach var="first_loc" items="${firstLoc_detailList}">
						<option value="${first_loc.loc_detail_no}" class="loc_detail_no" ${first_loc.loc_detail_no==myHomeDTO.loc_detail_no?'selected':''}>${first_loc.loc_detail_name}
					</c:forEach>
<%-- 					<c:forEach var="loc" items="${loc_detailList}">
						<option value="${loc.loc_detail_no}" class="loc_detail_no">${loc.loc_detail_name}
					</c:forEach> --%>
				</select>
			<div id="loc_no_check"></div>
			<div id="loc_detail_no_check"></div>
			<tr><td>상세주소<td>
			<input type="text" name="detail_location" class="detail_location" value="${myHomeDTO.detail_location}">
			<div id="detail_location_check"></div>
			<tr><td>전용면적<td>
			<input type="text" name="dedicated_area" value="${myHomeDTO.dedicated_area}">m²
			<div id="dedicated_area_check"></div>
			<tr><td>공급유형명<td>
			<select name="supply_type_no" class="supply_type_no">
				<c:forEach var="sup" items="${supply_typeList}">
					<option value="${sup.supply_type_no}" ${sup.supply_type_no==myHomeDTO.supply_type_no?'selected':''}>${sup.supply_type_name}
				</c:forEach>
			</select>
			<tr><td>월임대료<td>
			<input type="text" name="month_rent" class="month_rent" value="${myHomeDTO.month_rent}">원
			<div id="month_rent_check"></div>
			<tr><td>임대보증금<td>
			<input type="text" name="rent_deposit" class="rent_deposit" value="${myHomeDTO.rent_deposit}">원
			<div id="rent_deposit_check"></div>
		</table> 

		<br/>
	<button onClick="checkMyHomeUpDelForm('up');">수정</button>
	<button onClick="checkMyHomeUpDelForm('del');">삭제</button>

	<input type="hidden" name="upDel">
	<input type="hidden" name="rental_detail_no" value="${myHomeDTO.rental_detail_no}">
	<input type="hidden" name="rental_no" value="${myHomeDTO.rental_no}">

	</form>
		<button onClick="goBackToList()">취소</button>
		<button onClick="location.replace('/main.do')">메인으로 돌아가기</button>
</c:if>
	<br>	

</center>
</body>
</html>