<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JQuery 라이브러리 import 하기 -->
<script src="/resources/js/jquery-1.11.0.min.js"></script>




<head>
<script>

$(document).ready(function() {
	$(".btn_find_pwd").click(function() {
		checkPwd();
	});
});

function checkPwd() {

	//---------------------
	// 아이디 유효성 체크 
	//---------------------
	var find_search_id = $(".find_id_value").val();
	
	if(find_search_id.split(" ").join("")==""){
		alert(" 아이디 입력 요망");
		$(".find_search_id").val("");
		$(".find_search_id").focus();
		return;
	}

	//---------------------
	// 전화번호 유효성 체크 
	//---------------------
	var find_search_phone = $(".find_phone_value").val();
	
	if(find_search_phone.split(" ").join("")==""){
		alert(" 전화번호 입력 요망");
		$(".find_search_phone").val("");
		$(".find_search_phone").focus();
		return;
	}

	//---------------------
	// 이메일 유효성 체크 
	//---------------------
	var find_search_email = $(".find_email_value").val();
	
	if(find_search_email.split(" ").join("")==""){
		alert("email 입력 요망");
		$(".find_search_email").val("");
		$(".find_search_email").focus();
		return;
	}


	
	$.ajax({
		url : "/checkPwdProc.do"   
		, type : "post"
		, data : $("[name=find_pwd]").serialize()  	
		, success : function(json) {
			
				if(json.check_pwdCnt == 1) {
					alert("비밀번호는 "+json.checkedPwd+"입니다.")
					
				}
				else {
					alert("해당하는 정보가 없습니다.")
				}
		}
		, error : function() {
			alert("문제 발생 관리자에게 문의 바람.");
		}
	});
}
</script>
</head>


<body>
  
 <form name="find_pwd" class="find_pwd">

    <h1>비밀번호 찾기</h1>
    	

      아이디 :&nbsp;&nbsp;&nbsp; 
        <input type="text" name="find_id_value" class="find_id_value">   
     	<br/>

      전화번호 : 
        <input type="text" name="find_phone_value" class="find_phone_value" >   
     <br/>
       
   
      이메일 :&nbsp;&nbsp;&nbsp;
        <input type="text" name="find_email_value" class="find_email_value" >   
        
      <br/><br/>
      
      
 	<button type="button" name="btn_find_pwd" class="btn_find_pwd" 
 	>확인</button>
      
	<button type="button" name="btn_find_cancle" class="btn_find_cancle"
	onClick="location.replace('/loginForm.do')">취소</button>
 
     
  </form>
    

</body>
</html>