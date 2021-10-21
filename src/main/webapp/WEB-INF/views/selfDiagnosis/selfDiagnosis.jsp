<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../common/common.jsp" %>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css"> 

<!-- JQuery 라이브러리 import 하기 -->
<script src="/resources/js/jquery-1.11.0.min.js"></script>
<!-- css 파일 import 하기 -->

<style>
</style>
<head>
<script>
$(document).ready(function(){
	$(".happy_home").click(function(){
		location.replace("/checkHappyHome.do");
	});
	$(".rental").click(function(){
		location.replace("/checkRental.do");
	});
})
</script>
</head>


<body>
<header></header>
<div class="wrap"><br/><br/><br/>
	<center class="center_position">
	<section>
		<button class="happy_home">행복주택</button>
		<br/>
		<button class="rental">임대</button>
		
		
		<br/>
	</section>
	</center>
	</div>
<footer></footer>
</body>
</html>