<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
<!-- JQuery 라이브러리 import 하기 -->
<script src="/resources/js/jquery-1.11.0.min.js"></script>
<!-- css 파일 import 하기 -->
<link href="/resources/css/join.css" rel="stylesheet" type="text/css">
<!-- 공용함수 import 하기 -->
<script src="/resources/js/common_func.js"></script>

<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

	$(document).ready(function() {
		$(".overlap_id").click(function(){
			$(".idCheckCnt").val("1");
			check_overlap_id();
		
		});
		$(".overlap_nickname").click(function(){
			$(".nicknameCheckCnt").val("1");
			check_overlap_nickname();
		});

		//------------------------
		// 아이디 유효성 체크 
		//------------------------

		$(".mem_id").focusout(function(){
			if($(".mem_id").val()==""){
				$("#id_check").text("[필수]아이디를 입력해주세요.");
				return;
			}
			if(isCheck_id($(".mem_id").val()) == false) {
				$("#id_check").text("아이디는 5~15자 사이입니다.");
				return;
			}else{
				$("#id_check").text("");
			}
		})

		$(".mem_name").focusout(function(){
			if($(".mem_name").val()==""){
				$("#name_check").text("[필수]이름을 입력해주세요.");
				return;
			}
			if(isLanguage($(".mem_name").val()) == false) {
				$("#name_check").text("이름은 2-20자 사이입니다.");
				return;
			}else{
				$("#name_check").text("");
			}
		})
		
		$(".nickname").focusout(function(){
			if($(".nickname").val()==""){
				$("#nickname_check").text("[필수]닉네임을 입력해주세요.");
				return;
			}
			if(isLanguage($(".nickname").val()) == false) {
				$("#nickname_check").text("닉네임은 2-20자 사이입니다.");
				return;
			}else{
				$("#nickname_check").text("");
			}
		})

		$(".mem_pwd").focusout(function(){
			if($(".mem_pwd").val()==""){
				$("#pwd_check").text("[필수]비밀번호를 입력해주세요.");
				return;
			}
			if(is_pwd($(".mem_pwd").val()) == false) {
				$("#pwd_check").append("비밀번호는 특수문자 포함 8~16자 사이입니다.");
				return;
			}else{
				$("#pwd_check").text("");
			}
		})
		
		$(".re_pwd").focusout(function(){
			if($(".re_pwd").val()==""){
				$("#re_pwd_check").text("비밀번호 재확인을 입력해주세요.");
				return;
			}
			if($(".mem_pwd").val()!=$(".re_pwd").val()) {
				$("#re_pwd_check").text("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
				return;
			}else{
				$("#re_pwd_check").text("");
			}
		})
		
		$(".phone").focusout(function(){
			if($(".phone").val()==""){
				$("#phone_check").text("[필수]휴대폰번호를 입력해주세요.");
				return;
			}
			if(is_Phone($(".phone").val()) == false) {
				$("#phone_check").text("[필수]휴대폰 입력 형식이 맞지 않습니다.");
				return;
			}else{
				$("#phone_check").text("");
			}
		})
		
		
		//-------------------
		// 생년월일 달력 
		//-------------------
		$(".datepicker").datepicker({

		      showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
		      buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 버튼 이미지
		      buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
		      changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		      changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		      minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		      nextText: '다음 달', // next 아이콘의 툴팁.
		      prevText: '이전 달', // prev 아이콘의 툴팁.
		      numberOfMonths: [1, 1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
		      stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
		      yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		      showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. ( ...으로 표시되는부분이다.) 
		      currentText: '오늘 날짜', // 오늘 날짜로 이동하는 버튼 패널
		      closeText: '닫기',  // 닫기 버튼 패널
		      dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
		      showAnim: "slide", //애니메이션을 적용한다.  
		      showMonthAfterYear: true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
		      dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
		      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] // 월의 한글 형식.

		    });
		

	    //-------------------
	    // 가입버튼 클릭 시 
	    //-------------------
		$(".join-btn").click(
	      function () {
	    	  checkMemRegForm();
	    });
	    
		//-------------------
		// 취소버튼 클릭 시 
		//-------------------
		$(".cancel-btn").click(
	      function () {
	        location.replace("/loginForm.do")
	    });    
	    
	});
		
	//-----------------------------
	// 체크박스 유효성 검사 
	//-----------------------------
	function checkSelectAll()  {
		  //~~~~~~~~~~~~~~
		  // 전체 체크박스
	   	  //~~~~~~~~~~~~~~
		  const checkboxes = document.querySelectorAll('input[name="confirm"]');
		  //~~~~~~~~~~~~~~
		  // 선택된 체크박스
		  //~~~~~~~~~~~~~~
		  const checked = document.querySelectorAll('input[name="confirm"]:checked');
		  //~~~~~~~~~~~~~~
		  // select all 체크박스
		  //~~~~~~~~~~~~~~
		  const selectAll = document.querySelector('input[name="confirmAll"]');
		  
		  if(checkboxes.length === checked.length)  {
		    	selectAll.checked = true;
		  } else {
		   		selectAll.checked = false;
		  }

	}
	
	function selectAll(selectAll) {
	  const checkboxes = document.getElementsByName('confirm');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	  
	}
	
	
	//--------------------------------------
	// 회원가입 화면에 입력한 데이터의 유효성 체크를 해주는
    // checkMemRegForm 함수 선언
    //--------------------------------------
	function checkMemRegForm() {
		
		//------------------------
		// ID 중복 체크 
		//------------------------
		if($(".idCheckCnt").val()=="0"){
			alert("아이디 중복체크를 해주세요.");
			return;
		}

		//------------------------
		// 닉네임 중복 체크 
		//------------------------
		if($(".nicknameCheckCnt").val()=="0"){
			alert("닉네임 중복체크를 해주세요.");
			return;
		}

		
		if($(".datepicker").val()==""){
				alert("생년월일을 선택하세요.");
				$(".datepicker").focus();
				return;
			}

     	if ($() == "") {
        	alert("성별을 선택하세요");
         	$(".gender").focus();
         	return;
    	 }

		 //----------------------------------------
         // 동의 유효성 체크하기 . 동의는 5개이고 필수 체크이다
         //----------------------------------------          
         var checkedConfirmCnt = $(".confirm:checked").length
       	 //----------------------------------------
         // checkedConfirmCnt 변수 안의 데이터 5개 이하면
         // 즉, 모두 체크되지 않았으면 
         //----------------------------------------
         if (checkedConfirmCnt < 5) {
             alert("[필수] 동의 항목을 모두 체크해주세요");
             return;
         }

         
        //--------------
     	// 가입버튼 클릭 시
     	//-------------- 
   		if(confirm("가입하시겠습니까?") == false){ return; }
   	
   		$.ajax({
   				url : "/loginRegProc.do"
   				,type : "post"
   				,data : $("[name='memberRegForm']").serialize()
   				, success : function(json) {
   					if(json==1){
						alert("회원가입 성공")
						location.replace("/loginForm.do")
   	   				}
   					else {
   	   					alert("회원가입 실패")
   	   					return;
   	   				}
   				}
   				, error : function() {
   					alert("서버 접속 실패")
   				}
   		 });
	}

   		function check_overlap_id() {
			if($(".mem_id").val()==""){
				alert("아이디를 입력해주세요.");
				return;
			}   		
   			$.ajax({
   				url : "/overlapIdProc.do"
   				,type : "post"
   				,data : $("[name='memberRegForm']").serialize()
   				, success : function(idCnt) {
   					if(idCnt==1){
						alert("아이디가 중복됩니다.");
						$(".mem_id").val('');
						$(".nicknameCheckCnt").val("0");
						reuturn;
   					}else{
						alert("사용가능한 아이디입니다.");
						reuturn;
   	   	   	   		}
   				}
   				, error : function() {
   					alert("서버 접속 실패")
   				}
   		 });
   	   		
   	   	}
  
		function check_overlap_nickname() {
			if($(".nickname").val()==""){
				alert("닉네임을 입력해주세요.");
				return;
			} 
			$.ajax({
   				url : "/overlapNicknameProc.do"
   				,type : "post"
   				,data : $("[name='memberRegForm']").serialize()
   				, success : function(nicknameCnt) {
   					if(nicknameCnt==1){
						alert("닉네임이 중복됩니다.");
						$(".idCheckCnt").val("0");
						$(".nickname").val('');
						return;
   	   	   			}else{
						alert("사용가능한 닉네임입니다.");
						return;
   	   	   	   		}
   				}
   				, error : function() {
   					alert("서버 접속 실패")
   				}
   		 });
   	   		
   	   	}

		 
   	

	

		
</script>
</head>
<body>
	<!---------------------------  main  -------------------------------->
	
	<input type="hidden" class="idCheckCnt" value="0">
	<input type="hidden" class="nicknameCheckCnt" value="0">
  <form name="memberRegForm" class="memberRegForm" method="post">
    <section><br>
      <div><b>아이디</b></div>
	      <div>
	        <input type="text" id="mem_id" name="mem_id" class="mem_id" placeholder="ID를 입력하세요"><input type="button" name="overlap_id" class="overlap_id" value="중복체크">
	        <div id="id_check"></div>
	      </div>
	      <br>
      <div><b>이름</b></div>
	      <div>
	        <input type="text" id="mem_name" name="mem_name" class="mem_name" placeholder="이름을 입력하세요">
	        <div id="name_check"></div>
	      </div>
	      <br>
      <div><b>닉네임</b></div>
	      <div>
	      	<input type="text" id="nickname" name="nickname" class="nickname" placeholder="닉네임을 입력하세요"><input type="button" name="overlap_nickname" class="overlap_nickname" value="중복체크">
	      	<div id="nickname_check"></div>
	      </div>
	      <br>
      <div><b>비밀번호</b></div>
	      <div>
	        <input type="password" id="mem_pwd" name="mem_pwd" class="mem_pwd" placeholder="비밀번호를 입력하세요">
	        <div id="pwd_check"></div>
	      </div>
	      <br>
      <div><b>비밀번호 재확인</b></div>
	      <div>
	        <input type="password" id="re_pwd" name="re_pwd" class="re_pwd" placeholder="비밀번호를 입력하세요">
	        <div id="re_pwd_check"></div>
	      </div>
	      <br>
      <div><b>생년월일</b></div>
      	<div>
	      	<input type="text" title="생년월일" name="birth_day" id="birth_day" class="datepicker" value="" placeholder="생년월일을 선택하세요"> 
	      	<div id="birth_day_check"></div>
      	</div>
      	<br>
      <div><b>성별</b></div>
	      <div>
	        <select id="gender" name="gender" class="gender">
	          <option value="">성별</option>
	          <option value="남">남자</option>
	          <option value="여">여자</option>
	        </select>
	        <div id="gender_check"></div>
	      </div>
	      <br>
      <div>
      	<b>휴대전화<span class="select_keyword">&nbsp;(- 없이 번호만 입력해주세요)</span></b>
      </div>
      <div>
      	<input type="text" name="phone" class="phone" placeholder="(예) 01023172116">
      	<div id="phone_check"></div>
      </div>
      <br>
      <div>
        <b>본인 확인 이메일<span class="select_keyword">&nbsp;(선택)</span></b>
      </div>
      <div>
       <input type="text" id="email" name="email" class="email" placeholder="(예) king999@naver.com">
       <div id="email_check"></div>
      </div>
      <br>

        <p><b> ✔ 서비스 약관에 동의해주세요 </b></p>
        <p>
         <input type="checkbox" name="confirmAll" class="confirmAll" value="" onclick='selectAll(this)'>모두 동의합니다.
        </p>
 
      
      <ul>
        <li>
          <input type="checkbox" name="confirm" class="confirm" value="" onclick='checkSelectAll()'> [필수] 만 14세 이상입니다
        </li>
        <li>
          <input type="checkbox" name="confirm" class="confirm" value="" onclick='checkSelectAll()'> [필수] 이용약관 동의
        </li>
        <li>
          <input type="checkbox" name="confirm" class="confirm" value="" onclick='checkSelectAll()'> [필수] 전자금융거래 이용약관 동의
        </li>
        <li>
          <input type="checkbox" name="confirm" class="confirm" value="" onclick='checkSelectAll()'> [필수] 개인정보 수집 및 이용 동의
        </li>
        <li>
          <input type="checkbox" name="confirm" class="confirm" value="" onclick='checkSelectAll()'> [필수] 개인정보 제공 동의
        </li>
      </ul>

      <input type="button" style="cursor:pointer" name="join-btn" class="join-btn" value="가입"><input type="button" style="cursor:pointer" name="cancel-btn" class="cancel-btn" value="취소">
		


    </section>
  </form>


  <!---------------------------  footer  -------------------------------->

  <footer>
    <div>&copy; All rights reserved</div>&nbsp;
  </footer>
  
  
</body>
</html>