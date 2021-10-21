<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JQuery 라이브러리 import 하기 -->
<script src="/resources/js/jquery-1.11.0.min.js"></script>
<!-- css 파일 import 하기 -->
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">

<head>
<style>
ul,li{
text-decoration: none;
}

.searchResult{
height:auto;
	width:1000px;

}
.searchResult ul{
	position: relative;
}



.searchResult ul li{
	cursor:pointer;
	position: relative;
	width:1000px;
	height: 40px;;
}

.searchResult ul li:hover{
	background-color: gold;}

.header{
	cursor:default !important;
text-align: center !important;
font-size:13pt;
font-weight:bold;
color:#333;
height: 40px !important;
line-height: 40px !important;
border-top:2px solid black; 
background-color:salmon !important;
border-bottom:2px solid black !important;
	box-sizing: border-box

}
.new_post{
float: right;}


.searchResult ul li div{
position:relative;
height:40px;
line-height:40px;
border-bottom:1px solid black;
box-sizing:border-box;
float: left;}

.b_no, .head_category,.b_writer, .b_readcount{
	width:100px;
}
.b_subject{
cursor:pointer;
display:block;
	width:435px; 
	text-align: left;
	padding-left: 10px;
	overflow: hidden;
}

.b_reg_date{
	width:165px;
}           
 	

.b_subject > p{display:inline-block;
max-width:400px;
font-size:14px;
font-weight:bold;
color:#333;
text-overflow:ellipsis;
overflow:hidden;
white-space:nowrap;}
.b_subject .num{color:#d31900;
font-size:14px;
margin-left:5px;
vertical-align:top}

.importants{
background-color: #f88 !important;
}

.importants:hover{

background-color: #abc !important; 
}

</style>

<script>

function goBoardContentForm(b_no){
	//-----------------------------------------
	//name=boardContentForm 을 가진 form 태그 내부의 name=b_no를 가진 입력양식(hidden 태그)에
	// 클릭한 행의 게시판 번호 저장하기
	//-----------------------------------------
	$("[name=boardContentForm] [name=b_no]").val(b_no);
	//-----------------------------------------
	//name=boardContentForm 을 가진 form 태그 내부의 action값의 URL주소로 서버에 접속하기
	// 즉, 상세보기 화면으로 이동하기
	// form태그를 이용한 웹서버 접속방법 -> 파라미터값을 숨겨서 웹서버에 접속할 수 있음
	//-----------------------------------------
	document.boardContentForm.submit();
}

// **********************************************************
//검색버튼과 페이지 번호를 누르면 호출되는 함수
// 키워드에 입력한 데이터를 가진 [게시판 목록]을 검색해서 그 결과를 보여주는 함수 선언
// **********************************************************
function search(){
	
	//-----------------------------------------
	//입력한 키워드 얻어오기
	//-----------------------------------------
	var keyword1= $(".keyword1").val();
	
	//-----------------------------------------
	//만약 키워드가 비어있거나 공백으로 구성되어 있으면 경고하고 비우고 함수 중단하기
	//-----------------------------------------
	
	//-----------------------------------------
	//입력한 키워드의 앞 뒤 공백 제거하고 입력양식에 다시 넣어주기
	//-----------------------------------------
	$(".keyword1").val( $.trim(keyword1) );
	
	//-----------------------------------------
	//비동기방식으로 웹서버에 접근해서 키워드를 만족하는
	// 검색결과물을 응답받아 현 화면에 반영하기
	//-----------------------------------------
	searchExe();

}

// **********************************************************
// [모두검색] 버튼을 눌렀을때 전체 결과물 보이는 함수 선언
// **********************************************************
function searchAll(){
	//-----------------------------------------
	//키워드 입력 양식에 "" 넣어주기
	//-----------------------------------------
	$(".keyword1").val("");
	// andOr는 항상 들어가기 때문에 ""로 풀지 말것!
	$(".head_category").prop("selected",false);
	$(".searchStandard").prop("selected",false);
	//-----------------------------------------
	//비동기 방식으로 웹서버에 접속하는 searchExe() 함수 호출하기
	//-----------------------------------------
	searchExe();
}

function searchExe(){
	//-----------------------------------------
	//현재 화면에서 페이지 이동 없이(=비동기방식으로)
	//서버쪽 /boardList.do로 접속하여 키워드를 만족하는
	// 검색결과물을 응답받아 현 화면에 반영하기
	//-----------------------------------------
	//비동기 방식을 사용하는 이유
		//=> 현재 화면에서 일부분만 바꾸기 위해서
	$.ajax({
		url: "/boardList.do"
		, type :"post"
		, data: $("[name=boardListForm]").serialize()
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
			$(".boardListAllCnt").text(
				 $(responseHtml).find(".boardListAllCnt").text()
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

// **********************************************************
// 페이지 번호를 클릭하면 호출되는 함수 선언
// **********************************************************
function search_with_changePageNo( selectPageNo ){
	//class=selectPageNo를 가진 입력양식에 클릭한(선택한) 페이지 번호를 value값으로 삽입하기
	//왜? 서버로 보내기 위해서
	$("[name=boardListForm]").find(".selectPageNo").val(selectPageNo);
	//search 함수 호출하기
	search();
}

$(document).ready(function(){
	$("[name='head_category']").change(function(){
		searchExe();
		})
	$(".rowCntPerPage").change(function(){
		$(".selectPageNo").val("1");
		search();
	})
	
	$(".boardSearch").click(function(){
		var keyword1= $(".keyword1").val();
		if(keyword1==null||keyword1.split(" ").join("")==""){
			alert("키워드가 비어있어 검색하지 않습니다.");
			keyword1= "";
			$(".keyword1").focus();
			return;
			//=> 함수 중단하지 않고 DB연동 바로 하게 함
		}
		search();
	})
	
	$(".boardSearchAll").click(function(){
		searchAll();
	})



})
</script>
</head>




<body onKeydown="if(event.keyCode==13){search();}">
<header></header>
<div class="wrap">
<center class="center_position">
<section>
	<div>커뮤니티 게시판</div>

	<br/>
	<br/>
	<br/>
	<br/>
		<div style="height:10px"></div>
		<!-- ============================================ -->
		<!-- 검색 결과 출력하기 -->
		<!-- ============================================ -->		
		<div class="searchResult">
		
     <ul>
            <li>
            	<div class="header b_no">번호</div>
            	<div class="header head_category">말머리</div>
            	<div class="header b_subject">제목</div>
            	<div class="header b_writer">작성자</div>
            	<div class="header b_readcount">조회수</div>
            	<div class="header b_reg_date">등록일</div>
            </li>
            <c:if test="${requestScope.noticeList!=null}">
	            <c:forEach var="board" items="${requestScope.noticeList}" varStatus="loopTagStatus">
					<li class="importants" onclick='goBoardContentForm(${board.b_no})'><div class="b_no">
							${board.b_no}</div>
					<div class="head_category">${board.head_category}</div>
					<div class="b_subject"><p>${board.subject}</p><span class="num">[${board.commentCnt}]</span></div>
					<div class="b_writer">${board.writer}</div>
					<div class="b_readcount">${board.readcount}</div>
					<div  class="b_reg_date">${board.reg_date}</div>
					</li>
	            </c:forEach>
            </c:if>
            <c:if test="${requestScope.boardList!=null}">
					<c:forEach var="board" items="${requestScope.boardList}" varStatus="loopTagStatus">
		
					<c:if test="${board.head_category!='공지'}">
					<li onclick='goBoardContentForm(${board.b_no})'><div class="b_no">
							${board.b_no}</div>
					<div class="head_category">${board.head_category}</div>
					<div class="b_subject"><p>${board.subject}</p><span class="num">[${board.commentCnt}]</span></div>
					<div class="b_writer">${board.writer}</div>
					<div class="b_readcount">${board.readcount}</div>
					<div  class="b_reg_date">${board.reg_date}</div>
					</li>			
					</c:if>	
					</c:forEach> 
					
				</c:if>
        </ul>
		
		
		
			
			<form name="boardContentForm" method="post" action="/boardContentForm.do">
			<input type="hidden" name="b_no">
			<!-- <input type="text" name="b_no"> -->	
		</form>
	<c:if test = "${!empty sessionScope.mem_no}">
		<button class="new_post" onClick="location.replace('/boardRegForm.do')">새글쓰기</button>
	</c:if>
		</div>
		
		<div style="height:10px"></div>
		<div class="pageNo">
			<%--
			********************************************************************
			JSTL 이란 커스텀태그 중에 C코어 태그 중에 if 조건문을 사용하여
			만약에 게시판 검색 개수가 0보다 크면
			---------------------------------------------------------------
				C코어 태그 중에 if 조건문 형식
				<c:if test="${EL조건식}">
	
				</c:> 
			********************************************************************
			--%>
			
				<c:if test="${boardListAllCnt>0}">
						<!------------------------------------------------>
						<!--선택한 페이지 번호가 1보다 크면 [처음], [이전] 글씨 보이기. 단 클릭하면 함수 호출하도록 이벤트 걸기-->
						<!------------------------------------------------->
						<c:if test="${pagingNos.selectPageNo>1}">
							<span style='cursor:pointer' onClick='search_with_changePageNo(1);'>[처음]</span>
							<span style='cursor:pointer' onClick='search_with_changePageNo(${pagingNos.selectPageNo}-1);'>[이전]</span>
						</c:if>
						<!------------------------------------------------>
						<!-- 선택한 페이지 번호가 1면 [처음], [이전] 글씨 보이기. 단 클릭하면 함수 호출하는 이벤트 걸지 말기-->
						<!------------------------------------------------->
						<c:if test="${pagingNos.selectPageNo<=1}">
							<span style='cursor:pointer'>[처음]</span>
							<span style='cursor:pointer'>[이전]</span>
						</c:if>

						<c:forEach  var="no"  begin="${pagingNos.min_pageNo}"  end="${pagingNos.max_pageNo}" step="1"> 
							<!------------------------------------------------->
							<!-- 만약 출력되는 페이지번호와 선택한 페이지 번호가 일치하면 그냥 번호만 표현하기-->
							<!------------------------------------------------->
							<c:if test="${no==pagingNos.selectPageNo}">
								<span style='cursor:pointer'><b>${no}</b></span>
							</c:if>
							<!------------------------------------------------->
							<!-- 만약 출력되는 페이지번호와 선택한 페이지 번호가 일치하지 않으면 클릭하면 함수호출하도록 클릭 이벤트 걸기-->
							<!------------------------------------------------->
							<c:if test="${no!=pagingNos.selectPageNo}">
								<span style='cursor:pointer' onClick='search_with_changePageNo(${no});'>[${no}]</span>
							</c:if>
						</c:forEach>
	
						<!----------------------------------------------->
						<!-- 선택한 페이지 번호가 마지막 페이지 번호보다 작으면 [다음][마지막] 문자 표현하기-->
						<!-- 단 클릭하면 함수 호출하도록 클릭 이벤트 걸기-->
						<!------------------------------------------------->
						<c:if test="${pagingNos.selectPageNo<pagingNos.last_pageNo}">
							<span style='cursor:pointer' onClick='search_with_changePageNo(${pagingNos.selectPageNo}+1);'>[다음]</span>
							<span style='cursor:pointer' onClick='search_with_changePageNo(${pagingNos.last_pageNo});'>[끝]</span>
						</c:if>
						<!----------------------------------------------->
						<!-- 선택한 페이지 번호가 마지막 페이지 번호보다 크거나 같으면 [다음][마지막] 문자만 표현하기-->
						<!-- 단 클릭하면 함수 호출하는 이벤트는 걸지 않기-->
						<!------------------------------------------------->
						<c:if test="${pagingNos.selectPageNo>=pagingNos.last_pageNo}">
							<span style='cursor:pointer'>[다음]</span>
							<span style='cursor:pointer'>[끝]</span> 
						</c:if>
				</c:if>
		
		</div>
		<div style="height:10px"></div>
		<form name="boardListForm" method="post" onSubmit="return false">
			<!-- ---------------------------------------------- -->
			<!-- 키워드 데이터를 저장하는 text 입력양식 선언-->
			<!-- ---------------------------------------------- -->

			
			<select name="head_category">
				<option value="">전체
				<c:forEach var="head" items="${headCategoryList}">
					<option value="${head.head_category_no}"  class="head_category" >${head.head_category_name}
				</c:forEach>
				</select>
			
			<select name="searchStandard">
				<option value="" >전체
				<option value="제목" class="searchStandard">제목
				<option value="작성자" class="searchStandard">작성자
				<option value="제목+작성자" class="searchStandard">제목+작성자
				<option value="내용" class="searchStandard">내용
			</select>
			
			<input type="text" name="keyword1" class="keyword1">
			<input type="button" value="검색 " class="boardSearch" >&nbsp;
			<input type="button" value="모두검색" class="boardSearchAll" >&nbsp;


			<div style="height:5px"></div>
			
			<!-- ---------------------------------------------- -->
			<!-- 검색버튼 입력양식 선언-->
			<!-- ---------------------------------------------- -->

			
			<!-- hidden 태그는 서버에 데이터를 보낼 때 사용함 -->
			
			<!-- ---------------------------------------------- -->
			<!-- 새글쓰기 글씨에 링크 걸기, 클릭시 goBoardRegForm() 함수 호출하기-->
			<!-- ---------------------------------------------- -->

			
			<!-- 검색화면에 필수적인 아주 중요한 웹서버로 보낼 데이터-->
			<!-- 페이징 처리 관련 데이터 -->
			<!-- ---------------------------------------------- -->
			<!-- 클릭한 페이지번호를 저장할 hidden 입력양식 선언-->
			<!-- ---------------------------------------------- -->
			<input type="hidden" name="selectPageNo" class="selectPageNo" value=1>	
			
			<!-- ---------------------------------------------- -->
			<!-- 정렬기준을 저장할 hidden 입력양식 선언-->
			<!-- ---------------------------------------------- -->
			<input type="hidden" name="sort" class="sort" value="">	
		
		<div style="height:10px"></div>

		</form>
		</section>
	</center>
	</div>
<footer></footer>
</body>

</html>
