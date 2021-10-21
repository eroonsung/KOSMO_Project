<!-- ********************************************************************************** -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ********************************************************************************** -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!-- --------------------------------------------- -->
<!-- 공용함수 수입하기 -->
<!-- JQuery 라이브러리 수입하기 -->
<!-- css 파일 수입하기 -->
<!-- --------------------------------------------- -->
<script src="/resources/js/common.js"></script>
<script src="/resources/js/jquery-1.11.0.min.js"></script>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" >




<script>
$(document).ready(function(){
	

               
	
	$("header").html('<div class="header_content top_logo">로고</div><c:if test="${empty sessionScope.mem_no}"><div class="header_content top_login">로그인</div></c:if><c:if test="${!empty sessionScope.mem_no}">'
			+'<div class="header_content top_logout">로그아웃</div></c:if>');


	/* alert("어드민"+${sessionScope.is_admin}+"");  
	
	alert("맴버 번호"+${sessionScope.mem_no}+"");
	 */ 
    $('.top_logo').click(function(){
    	location.replace("/main.do"); 
    });

    $('.top_login').click(function(){
    	location.replace("/loginForm.do"); 
    });

    $('.top_logout').click(function(){
    	location.replace("/logout.do"); 
    });
   
	
});
</script>	



