<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common/common.jsp" %>
    <link href="/resources/css/checkRental.css" rel="stylesheet" type="text/css">
    <script src="/resources/js/jquery-1.11.0.min.js"></script>
	<script src="/resources/js/checkRental.js"></script>
</head>
<body>
<header></header>
<button onClick="location.replace('/main.do')">메인으로 돌아가기</button>
 <div class="question q1 on">    
     
            <h2>1. 무주택자 입니까?</h2>
            <input type="radio" name="have_house" id="q1_y" class=" have_house" value="y">
            
            <label for="q1_y" class="radio_btn">예</label>
            
            <input type="radio" name="have_house" id="q1_n"  class=" have_house" value="n">
            
            <label for="q1_n" class="radio_btn">아니요</label>
            
    </div>
      
    
    <!--대학생-->    
     
    <div class="question q_add q2">
            <h2>2. 신청자 본인 및 부모의 월평균 소득 합계가 가구원수별 월 평균 소득 100%이하 입니까?</h2>
            <h4>- 자격완화의 경우 소득요건이 달라질 수 있으며, 자세한 사항은 LH청약센터 공고문을 확인해 주시기 바랍니다.</h4>
            <table>
                <tr>
                    <th>가구원수</th>
                    <th>월 평균 소득</th></tr>
                <tr>
                    <td><input type="radio" name="households" id="q2_h_1" class=" households"  value="1">
            
            <label for="q2_h_1" class="table_btn">1인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q2_s_1" value="1">
                    
                    <label for="q2_s_1" class="table_btn">2,692,468원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="households" class=" households" id="q2_h_2" value="2"> 
            
            <label for="q2_h_2" class="table_btn">2인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q2_s_2" value="2">
                    <label for="q2_s_2" class="table_btn">3,650,028원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="households" class=" households"  id="q2_h_3" value="3">
                    
            <label for="q2_h_3" class="table_btn">3인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q2_s_3" value="3">
                    <label for="q2_s_3" class="table_btn">4,368,364원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="households" class=" households"  id="q2_h_4" value="4">
                    
            <label for="q2_h_4" class="table_btn">4인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q2_s_4" value="4">
                    <label for="q2_s_4" class="table_btn">4,965,944원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="households" class=" households" id="q2_h_5" value="5">
                    
            <label for="q2_h_5" class="table_btn">5인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q2_s_5" value="5">
                    <label for="q2_s_5" class="table_btn">4,965,944원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="households" class=" households" id="q2_h_6" value="6">
                    
            <label for="q2_h_6" class="table_btn">6인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q2_s_6" value="6">
                    <label for="q2_s_6" class="table_btn">5,175,553원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="households" class=" households" id="q2_h_7" value="7">
                    
            <label for="q2_h_7" class="table_btn">7인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q2_s_7" value="7">
                    <label for="q2_s_7" class="table_btn">5,444,616원 이하</label></td></tr>
                
                <tr>
                    <td><input type="radio" name="households" class=" households" id="q2_h_8" value="8">
                    
            <label for="q2_h_8" class="table_btn">8인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q2_s_8" value="8">
                    <label for="q2_s_8" class="table_btn">5,713,679원 이하</label></td></tr>
                    
            </table>
            
    </div>     
    
    <div class="question q_add q3">
            <h2>3. 신청자 본인 총자산(부동산+자동차+금융자산+기타자산-부채)가 292,000,000원 이하 입니까?</h2>
            <input type="radio" name="asset" id="q3_y" class="asset" value="y">
            
            <label for="q3_y" class="radio_btn">예</label>
            
            <input type="radio" name="asset" id="q3_n"  class="asset" value="n">
            
            <label for="q3_n" class="radio_btn">아니요</label>
            
    </div>
    
    <div class="question q_add q4">
            <h2>4. 자동차를 보유하고 계십니까?</h2>
            <input type="radio" name="car" id="q4_y" class=" car" value="y">
            <label for="q4_y" class="radio_btn">예</label>
            
            <input type="radio" name="car" id="q4_n" class=" car" value="n">
            <label for="q4_n" class="radio_btn">아니요</label>
    </div>
        
    <div class="question q_add q5">
            <h2>5. 차량기준가액이 34,960,000원 이하 입니까?</h2>
            <input type="radio" name="q5_asset" class="q5_asset"  id="q5_y" value="y"><label for="q5_y" class="radio_btn">예</label>
            <input type="radio" name="q5_asset" class="q5_asset"  id="q5_n" value="n"><label for="q5_n" class="radio_btn">아니요</label>
            
    </div>
    
    
    <!--결과-->    
    
    <div class="result not_Beneficiary">
        <h2>국민주택 입주대상이 아닙니다.</h2>
    </div>
    
    <div class="result Bene">
        <h2>국민임대주택 신청가능합니다.</h2>
        <button>▷ 모집공고 바로가기</button>
    </div>
        
    <button class="reset">초기화</button>

<footer></footer>
</body>
</html>