<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link href="/resources/css/common.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/main.css" rel="stylesheet" type="text/css">
    <script src="/resources/js/jquery-1.11.0.min.js"></script> 
<%@include file="../common/common.jsp" %>
    
    <script>
         $(document).ready(function(){

            $(".step_map_city").hover(function(){
               $(this).attr("fill","#aaa") 
            },function(){
                $(this).attr("fill","#fff")
            });
            
            $(".step_map_city4").hover(function(){
               $(".step_map_city4").attr("fill","#aaa") 
            },function(){
                $(".step_map_city4").attr("fill","#fff")
            });
            
            
            $(".step_map_city12").hover(function(){
               $(".step_map_city12").attr("fill","#aaa") 
            },function(){
                $(".step_map_city12").attr("fill","#fff")
            });
                        
            $(".step_map_city14").hover(function(){
               $(".step_map_city14").attr("fill","#aaa") 
            },function(){
                $(".step_map_city14").attr("fill","#fff")
            });
                        
            $(".step_map_city15").hover(function(){
               $(".step_map_city15").attr("fill","#aaa") 
            },function(){
                $(".step_map_city15").attr("fill","#fff")
            });
                        
            $(".step_map_city16").hover(function(){
               $(".step_map_city16").attr("fill","#aaa") 
            },function(){
                $(".step_map_city16").attr("fill","#fff")
            });
                       
        });
    </script>
  	<style>
  		.admin_page{
  			width:200px;
  			height: 50px;
  			background-color: gold;
  			position: absolute;
  			top:15vh;
  			right: 5vw;
  			cursor: pointer;
  			z-index: 999;
  		}
  	</style>
  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title> 
</head>
<body>
            <header>
            	
            </header>
    <div class="wrap">
        <div class="center_position">
        <button class="admin_page" onclick="location.replace('/admin_page.do')">관리자 페이지 이동</button>
            <section>
                <div class="left_sec sec">
                    <iframe class="map" src="/map.do" ></iframe>
																			
               
                    
                </div>
                <div class="right_sec sec">
                    <div class="top_sec">
                                   <button onClick="location.replace('/info.do');">공공주택 정보</button>
                                   <button onClick="location.replace('/selfDiagnosis.do');">자가진단</button>
                                   <button onClick="location.replace('/searchMyHome.do');">공공주택 찾기</button>
                                   <button onClick="location.replace('/boardList.do');">커뮤니티</button>
                    </div>
                    <div class="bottom_sec">
                        
                    </div>
                </div> 
            </section>
        </div>

    </div>
<footer></footer>
</body>
</html>