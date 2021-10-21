<!-- ********************************************************************************** -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- ****************************************** -->
<%@ page import = "com.project.erp.DTO.BoardDTO" %>

<!-- ******************************************** -->
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여
	common.jsp 파일 내의 소스를 삽입하기 -->
<!-- ******************************************** -->

<%@include file="../common/common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>

<style>


div{
float:left;
}
.wrap{
	margin-top: 100px; 
	width:100%;
	height:auto;
	min-height:800px;
	position: relative;
	float:left;
}

.ContentWrap{
	position:relative;
	float:left;
	left:20vw;
	width:60vw;
	min-width:800px;
	min-height: 400px;
	background-color: #fff;
}

.ContentWrap div{	
	text-align:left;
	float: left;
	height: 50px;
}

.head_category{
	padding-left:30px;
	margin-right:-30px;
	line-height:50px;
	height: 50px;
	width:10%;
} 

.subject{
	width: 90%;
	height: 50px;
}
.subject h2{
	line-height:50px;
	overflow: hidden;
	padding-left: 20px;
	padding-right:20px;
	height: 50px;
}

.nickname{
	padding-left:30px;
	margin-right:-30px;
	width: 60%;
	line-height:50px;
	height: 50px;
}

.reg_date,.readcount{
	text-align:right; 
	width: 20%;
	line-height:50px;
	height: 50px;
}
.reg_date p,.readcount p{
text-align: right;}

.contents{
	border-top: 2px solid #999;
	width: 100%;
	min-height: 250px !important;
	height: auto !important;
	padding-bottom:20px;
}

.contents p{   
	position:relative;
	padding-left: 30px;
	padding-top: 10px;
}


.btn_box{
	border-bottom:2px solid #999;
	position:relative;
	float: left;
	width:60vw;
	height: 30px;
}

.update_btn{
	float:right;
}

.list_btn{
	float:left;
}

.reply{
	padding-top:10px; 
	margin-left:20vw;
	width:60vw;
	background-color:gold;
}

.reply_list{
float:left;
	position: relative;
	width:100%;
	height: auto;
}
.reply_list li{
	float: left;
	width:100%;
	height: 50px;
}

.commentUpDelForm input{
	float: right;
}

.reply_writer{
	width: 25%;
	height:20px;
	padding-left:20px;
	margin-right:-20px;
}

.reply_content{
	margin:5px 20px;
	width: 80%;
	height:20px;
	overflow: inherit;
}
	
.reply_date{
	width: 20%;
	height:20px;}

.reply_write{
	width:100%;
	height: auto;
}

.reply textarea{
	position:relative;
	width: 88%;
	height:100px;
	margin: 0 10px;
	float:left;
	resize:none;
	
}

.reg_reply{
box-sizing:border-box;
height:100px;
width:10%;
	float: left;
}

</style>
	<script>


		$(document).ready(function(){
			})

		//--------------------------------------------
		//게시판 수정/삭제 화면으로 이동하는 함수 선언
		//--------------------------------------------
		function goBoardUpDelForm(){
			//-----------------------------------------
			//name=boardUpDelForm 을 가진 form 태그 내부의 action값의 URL주소로 서버에 접속하기
			// 즉, 상세보기 화면으로 이동하기
			//-----------------------------------------
			document.boardUpDelForm.submit();
		}

		//--------------------------------------------
		//게시판 댓글쓰기 화면으로 이동하는 함수 선언
		//--------------------------------------------
		function goBoardRegForm(){
			//현재화면에서 다른화면 열기
			//-----------------------------------------
			//1. location.replace("/다른화면URL주소")
				//location.replace("/boardRegForm.do?b_no="+b_no);
				// => 데이터(입력양식 name/value)를 가지고 이동하기 어려움
				//해결방법: location.replace("/xxx.do?파라미터명=파라미터값&...") 
					// -> get방식:보안성이 떨어짐
			//-----------------------------------------
			//2. document.Form태그name값.submit();
				//document.boardRegForm.submit();
				// => Form태그 안에 있는 모든 입력양식을 post방식으로 보냄
				
		//--------------------------------------------
		//name=boardRegForm을 가진 form태그의 action값을 URL로 서버에 접속하라
		//--------------------------------------------
			document.boardRegForm.submit();
		}
		
		//-------------------------
		// 댓글쓰기 등록 누르면 작동 함수
		//-------------------------
		function ClickComBtn(){
			if( confirm("댓글을 등록하시겠습니까?")==false ) { return; }
			
			$.ajax({
				url : "/commentRegProc.do"
				,type : "post"
				,data : $("[name=commentRegForm]").serialize()
				,success : function(commentRegCnt){
					if(commentRegCnt==1){
						alert("댓글 등록 성공");
						location.reload();
					}else{
						alert("댓글 등록 실패");
						return;
					}
				}
				,error : function(){
					alert("서버 접속 실패");
				}
			});
		} 
		
		//------------------
		// 댓글 수정/삭제 
		//------------------
		function checkCommentUpDelForm( upDel, index ){
			//alert(upDel+index);
			//--------------------------------------------------------------------------
			// 매개변수로 들어온 upDel에 "del"이 저장되었으면
			// 즉, 삭제 버튼을 눌렀으면 암호 확인하고 삭제 여부를 물어보기 
			//--------------------------------------------------------------------------
			if( upDel=='del') {
				//$(".xxx").remove()
				//$("body").append("<div class=xxx>불타는 금요일</div>")
				if( confirm("정말 삭제하시겠습니까?")==false ) { return; }
				$("[name=upDel]").val("del");
			}
			
			 console.log($("[name=commentUpDelForm"+index+"]").serialize());
			//return;
			
			$.ajax({
				url : "/commentDelProc.do"
				,type : "post"
				,data : $("[name=commentUpDelForm"+index+"]").serialize()
				,success : function(commentDelCnt){
					
					if(commentDelCnt==1){
						alert("삭제 성공"); 
						location.reload();
					}
					else if(commentDelCnt==-1){
						alert("삭제 실패")
					}
				}
				,error : function(){
					alert("서버 접속 실패");
				}
			});
		}
		
		
	</script>

</head>

<body>

<header>
</header>
	<div class="wrap">
		<c:if test="${!empty requestScope.boardDTO}">
			
			<div class="ContentWrap">
			<div class="head_category">[BoardDTO : ${requestScope.boardDTO.mem_no}]</div>
			<div class="head_category">[Session : ${sessionScope.mem_no}]</div>
			<div class="head_category">[${requestScope.boardDTO.head_category_name}]</div>
			<div class="subject"><h2>${requestScope.boardDTO.subject}</h2></div>
			<div class="nickname"><p>작성자 : ${requestScope.boardDTO.nickname}</p></div>
			<div class="reg_date"><p>등록 : ${requestScope.boardDTO.reg_date}</p></div>
			<div class="readcount"><p>조회 : ${requestScope.boardDTO.readcount}</p></div>
			<div class="contents">
						<p>${requestScope.boardDTO.content}</p><br/>
						<c:if test= "${!empty requestScope.boardDTO.pic}">
						<!-- *************************************************** -->
							<img src="/resources/img/${requestScope.boardDTO.pic}"/>
                   </c:if>
            </div>
			<div class="btn_box">
			   <c:if test="${sessionScope.mem_no==requestScope.boardDTO.mem_no}">
			    <input type="button" class="update_btn" value="수정/삭제" onClick="goBoardUpDelForm();">&nbsp;
			   </c:if>
			    <input type="button" class="list_btn" value="전체 글보기" onclick="location.replace('/boardList.do');">
			
			</div>	
			
            </div>			<!-- *************************************************** -->
			
			
			
			<div class="reply">
			<!-- 리스트 출력 -->
			<ul class="reply_list">
			<c:if test="${!empty requestScope.commentList}">
			<c:forEach var="comments" items="${requestScope.commentList}" varStatus="status">
				<li>
				<!-- index로 값은 만들어냈는데 가져가는 방법찾기-->
				<form class="commentUpDelForm" name="commentUpDelForm${status.index}" method="post">
					<input type="hidden" name="com_no" class="del_com_no" value="${comments.com_no}">
					<input type="hidden" name="mem_no" value="${sessionScope.mem_no}">
					<input type="hidden" name="b_no" value="${boardDTO.b_no}">
					<input type="hidden" name="upDel" class="updel" value="">
				<div class="reply_writer">${comments.nickname}(${comments.com_reg_date})</div><br/>
				<div class="reply_content">${comments.com_contents}</div>
					<c:if test="${sessionScope.mem_no==comments.mem_no}" >
					<input type="button" value="삭제" onCLick="checkCommentUpDelForm('del',${status.index})"></c:if>
				</form>
				</li>
			</c:forEach>
			</c:if>
			</ul>
			
			<!-- 댓글쓰기 -->
			<div class="reply_write">
			<form name="commentRegForm">
				<textarea id="com_contents" name="com_contents" maxlength="400"></textarea>
				<input type="hidden" name="b_no" value="${boardDTO.b_no}">
				<input type="hidden" name="mem_no" value="${sessionScope.mem_no}">
				<input type="hidden" name="com_no" value="${commentDTO.com_no}">
				<input type="button" class="reg_reply" value="댓글등록" onClick="ClickComBtn()">&nbsp;
			</form> 
			</div>
			</div>
			 
		</c:if>
		
		
		<c:if test="${empty requestScope.boardDTO}">
			<script>alert('삭제된 글입니다.'); location.replace('/boardList.do')</script>
		</c:if>
		
		<!-- ********************************************************** -->
		<!-- [게시판 수정/삭제 화면]으로 이동하는 form태그 선언] -->
		<!-- ********************************************************** -->
		<form name="boardUpDelForm" method="post" action="boardUpDelForm.do">
			<input type="hidden" name="b_no" value="${requestScope.boardDTO.b_no}">
			<!--<input type="text" name="b_no" value="${boardDTO.b_no}">-->
		</form>
		
		<!-- ********************************************************** -->
		<!-- [게시판 댓글쓰기 화면]으로 이동하는 form태그 선언] -->
		<!-- ********************************************************** -->
		<form name="boardRegForm" method="post" action="/boardRegForm.do">
			<input type="hidden" name="b_no" value="${requestScope.boardDTO.b_no}">
		</form>
    </div>
    
    
		<footer>
		</footer>
</body>

</html>