<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JQuery 라이브러리 import 하기 -->
<script src="/resources/js/jquery-1.11.0.min.js"></script>



<head>
<script>
$(document).ready(function() {
	
	
	$(".find_name_value").val("강인수")
	$(".find_phone_value").val("01010041004")
	$(".find_email_value").val("a001@naver.com")  
	$(".btn_find_id").click(function() {
		
		checkId();
	});
});

function checkId() {

	//---------------------
	// 이름 유효성 체크 
	//---------------------
	var find_search_name = $(".find_name_value").val();
	
	if(find_search_name.split(" ").join("")==""){
		alert(" 아이디 입력 요망");
		$(".find_search_name").val("");
		$(".find_search_name").focus();
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
		url : "/checkIdProc.do"   
		, type : "post"
		, data : $("[name=find_id]").serialize()  	
		, success : function(json) {
			
				if(json.check_idCnt == 1) {
					alert("아이디는 "+json.checkedId+"입니다.")
					
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
  
 <form name="find_id" class="find_id">

    <h1>아이디 찾기</h1>
    	

      이름 : 
        <input type="text" name="find_name_value" class="find_name_value" >   
     <br/>

      전화번호 : 
        <input type="text" name="find_phone_value" class="find_phone_value" >   
     <br/>
       
   
      이메일 :&nbsp;&nbsp;&nbsp;
        <input type="text" name="find_email_value" class="find_email_value" >   
        
      <br/><br/>
      
      
 	<button type="button" name="btn_find_id" class="btn_find_id" 
 	>확인</button>
      
	<button type="button" name="btn_find_cancle" class="btn_find_cancle"
	onClick="location.replace('/loginForm.do')">취소</button>
 
     
  </form>
    

</body>
</html>