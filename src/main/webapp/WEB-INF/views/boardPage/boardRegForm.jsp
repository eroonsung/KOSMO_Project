<!-- ********************************************************************************** -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ********************************************************************************** -->
<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고, 이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다라고 설정함 -->
<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩한다-->
<!-- UTF-8 인코딩 방식은 한글을 포함한 전 세계 모든 문자열을 부호화할 수 있는 방법이다.-->
<!-- 모든 JSP 페이지, 상단에 무조건 들어가는 코드 -->
<!-- UTF-8 인코딩방식을 가지고 있는 text중의 하나인 html 파일로 처리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- ******************************************** -->
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여
	common.jsp 파일 내의 소스를 삽입하기 -->
<!-- ******************************************** -->
<%@include file="../common/common.jsp" %>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
<!-- include libraries(jQuery, bootstrap) -->        
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">         
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>         
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>         
<!-- include summernote css/js -->         
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">          
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>        
<!-- include summernote css/js-->        
<link href="/resources/summernote/summernote-lite.css" rel="stylesheet">        
<script src="/resources/summernote/summernote-lite.js"></script>        
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<script>
	  window.addEventListener("drop",function(e){ 
	         e = e || event; 
	         if (e.target.tagName != "INPUT") {  
	            // check which element is our target 
	            e.preventDefault(); 
	         }  
	      },false);
		// **********************************************************
		//body태그를 모두 읽어들인 이후 실행할 자스 코딩 설정하기
		// **********************************************************
		$(document).ready(function() {
			$(".content").summernote({                    
				height: 150,                                     
				lang: "ko-KR",
				focus : true,
				 height: 500,                    
				 resize : false,                    
				 disableResizeEditor: true,                   
				 toolbar: [                                             
					['fontname', ['fontname']],                           
					['fontsize', ['fontsize']],                            
					['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],                            
					['color', ['forecolor','color']],                             
					['para', ['ul', 'ol', 'paragraph']],           
   					['height', ['height']]                       
				],        
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],                          
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']                
			});            
		});

		function reset(){
			$(".head_category_no").prop("selected",false);
			$(".subject").val("");
			$("#summernote").summernote("reset");
		}

		// **********************************************************
		// [게시판 등록 화면]에 입력된 데이터의 유효성 체크를 자스로 하지 않고
		// 비동기 방식으로 서버에 "/boardRegProc.do"로 접속하는 함수 선언
		// **********************************************************
		function checkBoardRegForm(){
			//--------------------------------------------
			// "정말 등록하시겠습니까?" 라고 물어보기
			//--------------------------------------------
			if(confirm("정말 등록하시겠습니까?")==false) {return;}

			//alert( $("[name=boardRegForm]").serialize())
			//return;
			
			//--------------------------------------------
			//form 태그에 파일업로드 전송 관련 설정하기
			//--------------------------------------------
			document.boardRegForm.enctype="multipart/form-data"; 
			
			//--------------------------------------------
			//현재 화면에서 페이지 이동 없이(=비동기 방식으로)
			//서버쪽 boardRegProc.do로 접속하여 게시판 글쓰기를 하고 
			//글쓰기 성공여부를 알려주기
			//--------------------------------------------
			$.ajax({
				// 서버쪽 호출 URL 주소 지정
				url:"/boardRegProc.do"
				// form 태그 안의 입력양식 데이터 즉, 파라미터값을 보내는 방법 지정 
				, type: "post"
				// 서버로 보낼 파라미터명과 파라미터값을 설정
				
				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				// 파일업로드를 위한 설정
				//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				//-----------------------------------
				// 서버로 보내는 데이터에 파일이 있으므로
				// 전송하는 파라미터명, 파라미터값을 serialize를 하여 Query String으로 변경하지 않게 설정하기.
				// 서버로 보내는 데이터에 파일이 없으면  processData: false 을 생략한다.
				//-----------------------------------
				,processData:false
				//-----------------------------------
				// 서버로 보내는 데이터에 파일이 있으므로
				// 현재 form 태그에 설정된 enctype 속성값을 Content-Type 으로 사용하도록 설정하기.
				// 이게 없으면 현재 form 태그에 설정된 enctype 속성값과 관계없이 무조건 enctype 이 application/x-www-form-urlencoded 로 설정된다.
				// 서버로 보내는 데이터에 파일이 없으면  ,contentType: false  을 생략한다.
				//-----------------------------------
				,contentType:false
				//-----------------------------------
				// 서버로 보내는 데이터 설정하기
				// 서버로 보내는 데이터에 파일이 있으므로 FormData 객체 설정
				//-----------------------------------
				// boardRegForm이름을 가진 태그 중에 첫번째 놈
				, data: new FormData( $("[name=boardRegForm]").get(0) ) 

					//name값과 value값은 문자열만 전송 됨(파일업로드 불가)
					//, data: $("[name=boardRegForm]").serialize()
				//--------------------------------------------
				// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
				// 익명함수의 매개변수에는 서버가 보내온 Map<String,String>을 JSON 객체로 바뀌어 들어온다.
				//--------------------------------------------				
				, success: function (json) {
					//--------------------------------------------
					//매개변수로 들어온 JSON 객체에서 게시판 입력 성공행의 개수를 꺼내서 지역변수 boardRegCnt에 저장하기
					//매개변수로 들어온 JSON 객체에서 유효성 체크 결과 문자열을 지역변수 msg에 저장하기
					//--------------------------------------------
					var boardRegCnt = json.boardRegCnt;
						boardRegCnt = parseInt(boardRegCnt,10);
					var msg = json.msg;

					//--------------------------------------------
					//만약 유효성 체크 결과 문자열이 있으면 경고하고 함수 중단하기
					//--------------------------------------------
					if(msg!=null && msg.length>0){
						alert(msg);
						return;
					}
						if(boardRegCnt==1){
							alert("새글쓰기 성공");
							location.replace("/boardList.do");
						}
						//--------------------------------------------
						//그렇지 않으면, 즉 입력이 실패했으면
						//--------------------------------------------
						else{
							alert("새글쓰기 실패");
						}
		
				}
				//--------------------------------------------
				// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
				//--------------------------------------------		
				, error: function(){
					alert("서버 접속 실패");
				}
			});
		}

	</script>

</head>

<body>
<header></header>
<div class="wrap">  
	<center class="center_position">
<br/><br/><br/><br/><br/>
	<section>
		<div class="logout"></div>
		<!-- *************************************************** -->
		<!-- [로그인 정보 입력양식]을 내포한 form 태그 선언-->
		<!-- *************************************************** -->
		<form name="boardRegForm" method="post" action="/boardRegProc.do" >
		
		<!-- 테스트용 mem_no-->
		<input type="hidden" name="mem_no" value="10">
			<table border=1 class="tbcss2" width=800>
			 		<caption><b>새글쓰기</b></caption>	
			

				<tr>
					<th bgcolor="${thBgColor}">제목</th>
					<td>
					<select name="head_category_no" class="head_category_no">
						<option value="">말머리 선택
						<c:if test='${sessionScope.is_admin==1}'><c:forEach var="head" items="${headCategoryList}" begin="0">
						
						<option value="${head.head_category_no}"  class="head_category" >${head.head_category_name}</option>
						</c:forEach>
						</c:if>
						
						<c:if test='${sessionScope.is_admin!=1}'><c:forEach var="head" items="${headCategoryList}" begin="1">
						
							<option value="${head.head_category_no}"  class="head_category" >${head.head_category_name}</option>
						</c:forEach>
						</c:if>
						</select>
					<input type="text" name="subject" class="subject" size=40 maxlength="30"></td>
				</tr>
				<tr>
					<th bgcolor="${thBgColor}">내용</th>
					<td>
					<div id="summernote">				
					<textarea class="content"  name="content"></textarea> 			
					</div>	 </td>
  						

	 </tr>
	<tr>
					<th bgcolor="${thBgColor}">이미지</th>
					<td>
					<input type="file" name="img" class="img"></td>
				</tr> 
				
			</table>
			<div style="height:6px"></div>
			<input type="button" value="저장" onClick="checkBoardRegForm();">
			<input type="button" value="다시작성" onClick="reset();">
			<input type="button" value="목록보기" onclick="location.replace('/boardList.do')">
		</form>
		</section>
	</center>
</div>
<footer></footer>
</body>

</html>