<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@include file="../common/common.jsp" %>
<!-- JQuery 라이브러리 import 하기 -->
<script src="/resources/js/jquery-1.11.0.min.js"></script>
<!-- css 파일 import 하기 -->
<link href="/resources/css/login.css" rel="stylesheet" type="text/css">


<head>
<script>
	$(document).ready(function() {	
		
		$("[name=loginForm] .btn_login").click(function() {
			checkLoginForm();
		});
	});

	function checkLoginForm() {
		//---------------------
		// 아이디 유효성 체크 
		//---------------------
		var login_id = $(".login_id").val();
		
		if(login_id.split(" ").join("")==""){
			alert("로그인 아이디 입력 요망");
			$(".login_id").val("");
			$(".login_id").focus();
			return;
		}
		//---------------------
		// 암호 유효성 체크 
		//---------------------
		var pwd = $(".pwd").val();
		
		if(pwd.split(" ").join("")==""){
			alert("암호 입력 요망");
			$(".pwd").val("");
			$(".pwd").focus();
			return;
		}

		var is_login = $(".is_login").prop("checked") ? $(".is_login").val() : "";   
	//---------------------
	// 비동기 방식 연동 	
	//---------------------	
	$.ajax({
				url : "/loginProc.do"   
				, type : "post"
				, data : $("[name=loginForm]").serialize()  	
				, success : function(idCnt) {
						if(idCnt == 1) {
							alert("로그인 성공")
							location.replace("/main.do")
						}
						else {
							alert("아이디 또는 비밀번호가 틀렸습니다.")
						}
				}
				, error : function() {
					alert("서버 접속에 실패했습니다. 관리자에게 문의하여주십시오.");
				}
			});
	}
	
		
</script>
</head>


<body>
  <form name="loginForm" class="loginForm" method="post">
  
    <h1>로그인 페이지</h1>
    
      <div class="input-area">
        <input type="text" name="login_id" class="login_id" value="${cookie.login_id.value}">   
        <label for="login_id">USER NAME</label>
      </div>
      <div class="input-area">
        <input type="password" name="pwd" class="pwd" value="${cookie.pwd.value}">
        <label for="pwd">PASSWORD</label>
      </div>
      <div class="save-id-pwd">
        <input type="checkbox" name="is_login" class="is_login" value="exist"  ${empty cookie.login_id.value?'':'checked'}> 아이디 / 암호 기억 
      </div>
      <div class="btn-area">
        <button type="button" name="btn_login" class="btn_login">LOGIN</button>
      </div>

    <div class="caption">
      <a href="find_id.do">아이디 찾기</a> &nbsp;&nbsp;&nbsp;
      <a href="find_pwd.do">비밀번호 찾기</a>
      
      <span style="cursor:pointer" onClick="location.replace('/joinRegForm.do')">회원가입</span>
    </div>
    
  </form>

</body>
</html>