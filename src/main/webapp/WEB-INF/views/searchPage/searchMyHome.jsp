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



function goMyHomeContentForm(rental_detail_no){
	//-----------------------------------------
	//name=boardContentForm 을 가진 form 태그 내부의 name=b_no를 가진 입력양식(hidden 태그)에
	// 클릭한 행의 게시판 번호 저장하기
	//-----------------------------------------
	$("[name=myHomeContentForm] [name=rental_detail_no]").val(rental_detail_no);
	//-----------------------------------------
	//name=boardContentForm 을 가진 form 태그 내부의 action값의 URL주소로 서버에 접속하기
	// 즉, 상세보기 화면으로 이동하기
	// form태그를 이용한 웹서버 접속방법 -> 파라미터값을 숨겨서 웹서버에 접속할 수 있음
	//-----------------------------------------
	document.myHomeContentForm.submit();
}

// **********************************************************
//검색버튼과 페이지 번호를 누르면 호출되는 함수
// 키워드에 입력한 데이터를 가진 [게시판 목록]을 검색해서 그 결과를 보여주는 함수 선언
// **********************************************************
function search(){

	//-----------------------------------------
	//입력한 키워드 얻어오기
	//-----------------------------------------
	var complex_name= $(".complex_name").val();
	
	//-----------------------------------------
	//만약 키워드가 비어있거나 공백으로 구성되어 있으면 경고하고 비우고 함수 중단하기
	//-----------------------------------------
	
	//-----------------------------------------
	//입력한 키워드의 앞 뒤 공백 제거하고 입력양식에 다시 넣어주기
	//-----------------------------------------
	$(".complex_name").val( $.trim(complex_name) );
	
	//-----------------------------------------
	//비동기방식으로 웹서버에 접근해서 키워드를 만족하는
	// 검색결과물을 응답받아 현 화면에 반영하기
	//-----------------------------------------
	searchExe();

}

function reset(){
	$(".complex_name").val("");
	$(".loc_no").prop("selected",false);
	$(".loc_detail_no").prop("selected",false);
	$(".move_date").val("");
	$(".supply_type_no").prop("checked",false);
	$(".area_grade_no").prop("checked",false);
	$(".state").prop("checked",false);
	$(".rent_deposit").prop("checked",false);
}
// **********************************************************
// [모두검색] 버튼을 눌렀을때 전체 결과물 보이는 함수 선언
// **********************************************************
function searchAll(){
	reset();
	searchExe();
}

function searchExe(){
	$.ajax({
		url: "/searchMyHome.do"
		, type :"post"
		, data: $("[name=myHomeSearchForm]").serialize()
		, success: function(responseHtml){
			//-----------------------------------------
			//매개변수 responseHtml로 들어온 검색 결과물 html 소스 문자열에서
			//class=searchResult를 가진 태그 내부의 [검색 결과물 html 소스]를 얻어서
			//아래 현 화면의 html 소스 중에 class=searchResult를 가진 태그 내부에 덮어씌우기
			//-----------------------------------------
			//var html = $(responseHtml).find(".searchResult").html();
			//$(".searchResult").html(html);
			$(".searchResult").html(
				 $(responseHtml).find(".searchResult").html()
				);
			
			//-----------------------------------------
			//매개변수 responseHtml로 들어온 검색 결과물 html 소스 문자열에서
			//class=boardListAllCnt를 가진 태그 내부의 [총 개수 문자열]을 얻어서
			//아래 현 화면의 html 소스 중에 class=boardListAllCnt를 가진 태그 내부에 덮어씌우기
			//-----------------------------------------
			//var text = $(responseHtml).find(".count").text();
			//$(".count").text(text);
			$(".rentalListAllCnt").text(
				 $(responseHtml).find(".rentalListAllCnt").text()
				);
			
			//-----------------------------------------
			//매개변수 responseHtml로 들어온 검색 결과물 html 소스 문자열에서
			//class=pageNo를 가진 태그 내부의 [검색 결과물 html 소스]를 얻어서
			//아래 현 화면의 html 소스 중에 class=pageNo를 가진 태그 내부에 덮어씌우기
			//-----------------------------------------
			$(".pageNo").html($(responseHtml).find(".pageNo").html())

		}
		,error: function(){
			alert("서버 접속 실패");
		}
	});
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

// **********************************************************
// 페이지 번호를 클릭하면 호출되는 함수 선언
// **********************************************************
function search_with_changePageNo( selectPageNo ){
	//class=selectPageNo를 가진 입력양식에 클릭한(선택한) 페이지 번호를 value값으로 삽입하기
	//왜? 서버로 보내기 위해서
	$("[name=myHomeSearchForm]").find(".selectPageNo").val(selectPageNo);
	//search 함수 호출하기
	search();
}

$(document).ready(function(){

	$(".rowCntPerPage").change(function(){
		$(".selectPageNo").val("1");
		search();
	})
	
	$(".myHomeSearch").click(function(){
		
		var complex_name= $(".complex_name").val();
		var loc_noLength = $(".loc_no:selected").length;
		var loc_detail_noLength = $(".loc_detail_no:selected").length;
		var move_date= $(".move_date").val();
		var supply_type_noLength = $(".supply_type_no:checked").length;
		var area_grade_noLength = $(".area_grade_no:checked").length;
		var stateLength = $(".state:checked").length;
		var rent_depositLength = $(".rent_deposit:checked").length;
		
		if(complex_name==""
			&& loc_noLength<1 && loc_detail_noLength<1
			&& move_date=="" && supply_type_noLength<1
			&& area_grade_noLength<1 && stateLength<1 && rent_depositLength<1){
			alert("검색 조건을 입력하세요.");
			return;
		}
		
		$(".selectPageNo").val("1");
		search();
	})
	
	$(".myHomeSearchAll").click(function(){
		$("[name=myHomeSearchForm]").find(".selectPageNo").val(1);
		searchAll();
	})

	
	$(".myHomeResetBtn").click(function(){
		reset();
	})

	$(".loc").change(function(){
		var thisVal = $(".loc").val();
		$("#yyy").val(thisVal);
			getLocDetailList();


	})
})
</script>
</head>


<body>
<header></header>
<div class="wrap">
<form name="getLocDetailList">
	<input type="hidden" name="xxx" id="yyy">
</form>
<br/>
<br/>
<br/>
<center class="center_position">
<section>
	<form name="myHomeSearchForm" method="post" onSubmit="return false">
	<table border=1 cellpadding=5 class="tbcss2">
		<tr><th colspan="6"><b>공공 주택 검색</b>
		<tr>
			<th>단지명 
			<td><input type="text" name="complex_name" class="complex_name">
		<tr>
			<th>지역검색
			<td>
				<select name="loc_no" class="loc">
					<option value="">전체
					<c:forEach var="loc" items="${locationList}">
						<option value="${loc.loc_no}" class="loc_no">${loc.loc_name}
					</c:forEach>
				</select>
				<select name="loc_detail_no" class="loc_detail">
					<option value="">전체
					<c:forEach var="loc" items="${loc_detailList}">
						<option value="${loc.loc_detail_no}" class="loc_detail_no">${loc.loc_detail_name}
					</c:forEach>
				</select>
		<tr>
			<th>입주예정일
			<td><input id="IconDemo" name="move_date" class='Default move_date' type="text" />
				
		<tr>
			<th>공급유형
			<td>
				<c:forEach var="sup" items="${supply_typeList}">
					<input type="checkbox" name="supply_type_no" class="supply_type_no" value="${sup.supply_type_no}">${sup.supply_type_name}&nbsp;
				</c:forEach>
		<tr>
			<th>전용면적
			<td>
			<input type="radio" name="area_grade_no" class="area_grade_no" value=""> 전체
				<c:forEach var="area" items="${area_gradeList}">
					<input type="radio" name="area_grade_no" value="${area.area_grade_no}" class="area_grade_no">
					${area.min_dedicated_area}~${area.max_dedicated_area}m²
				</c:forEach>
		<tr>
			<th>진행 상태
			<td>
				<input type="radio" name="state" class="state" value=""> 전체
				<input type="radio" name="state" class="state" value="모집중"> 모집중
				<input type="radio" name="state" class="state" value="모집완료"> 모집완료
		<tr>
			<th>월 임대료
			<td>
			<input type="radio" name="rent_deposit" class="rent_deposit" value=""> 전체
			<input type="radio" name="rent_deposit" class="rent_deposit" value="5만원"> 5만원 미만
			<input type="radio" name="rent_deposit" class="rent_deposit" value="5~10만원"> 5~10만원 미만
			<input type="radio" name="rent_deposit" class="rent_deposit" value="10~20만원"> 10~20만원 미만
			<input type="radio" name="rent_deposit" class="rent_deposit" value="20~30만원"> 20~30만원 미만
			<input type="radio" name="rent_deposit" class="rent_deposit" value="30만원"> 30만원 이상
			
	</table>
			<div style="height:10px"></div>

		<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">	
		
		
		<input type="button" value="검색" class="myHomeSearch">&nbsp;
		<input type="button" value="모두검색" class="myHomeSearchAll">&nbsp;
		<input type="button" value="초기화" class="myHomeResetBtn">
		
	</form>
	

		
	<div style="height:5px"></div>
	<div class="rentalListAllCnt">검색건수 : 총 ${rentalListAllCnt}개</div>
		<div style="height:10px"></div>
		<div class="searchResult">
		<table border=1 class="staffList tbcss1" >
			<tr>
			<th>진행상태<th>공급유형<th>단지명<th>세대수<th>최초입주년월<th>월입대료<th>상세주소
			<c:if test="${requestScope.rentalList!=null}">
				
					<c:forEach var="rental" items="${requestScope.rentalList}" varStatus="loopTagStatus">
						<tr style="cursor:pointer;"  onclick='goMyHomeContentForm(${rental.rental_detail_no})'>
							<td>
							<c:if test="${rental.ongoing==1}">
								모집중
							</c:if>
							<c:if test="${rental.ongoing==2}">
								모집완료
							</c:if>
							
							<td> ${rental.supply_type_name}
							<td> ${rental.complex_name}
							<td> ${rental.house_num}
							<td> ${rental.year_of_first_move_date}년 ${rental.month_of_first_move_date}월
							<td> ${rental.month_rent}
							<td> 
								${rental.detail_location}
						</tr>
					</c:forEach> 
					
				</c:if>
		</table>
	</div>
	<div style="height:5px"></div>
	<div class="pageNo">
			<c:if test="${rentalListAllCnt>0}">
				<c:if test="${pagingNos.selectPageNo>1}">
					<span style='cursor:pointer;' onClick='search_with_changePageNo(1);'>[처음]</span> 
					<span style='cursor:pointer;' onClick='search_with_changePageNo(${pagingNos.selectPageNo-1});'>[이전]</span>
				</c:if>
				<c:if test="${pagingNos.selectPageNo<=1}">
					<span>[처음]</span> 
					<span>[이전]</span> 
				</c:if>
				
				<c:forEach var="no" begin="${pagingNos.min_pageNo}" end="${pagingNos.max_pageNo}" step="1">
					<c:if test="${no==pagingNos.selectPageNo}">
						<span><b>${no}</b></span>
					</c:if>
					<c:if test="${no!=pagingNos.selectPageNo}">
						<span style='cursor:pointer;' onClick='search_with_changePageNo(${no});'>[${no}]</span>
					</c:if>
				</c:forEach>
				
				<c:if test="${pagingNos.selectPageNo<pagingNos.last_pageNo}">
					<span style='cursor:pointer;' onClick='search_with_changePageNo(${pagingNos.selectPageNo+1});'>[다음]</span> 
					<span style='cursor:pointer;' onClick='search_with_changePageNo(${pagingNos.last_pageNo});'>[끝]</span>
				</c:if>
				<c:if test="${pagingNos.selectPageNo>=pagingNos.last_pageNo}">
					<span>[다음]</span> 
					<span>[끝]</span> 
				</c:if>
			</c:if>
		</div>
		
		
	
		<form name="myHomeContentForm" method="post" action="/myHomeContentForm.do">
			<input type="hidden" name="rental_detail_no">
			<!-- <input type="text" name="b_no"> -->	
		</form>
		


<br/>
</section>
</center></div>
<footer></footer>
</body>
</html>