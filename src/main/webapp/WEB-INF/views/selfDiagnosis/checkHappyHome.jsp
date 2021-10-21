<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common/common.jsp" %>
    <link href="/resources/css/checkHappyHome.css" rel="stylesheet" type="text/css">
    <script src="/resources/js/jquery-1.11.0.min.js"></script>
	<script src="/resources/js/checkHappyHome.js"></script>
</head>
<body>
<header></header> 
<div class="question q1 on">
            <h2>1. 자신에게 맞는 계층을 선택해주세요</h2>
            <input type="radio" name="grade" class="grade" id="sub_uni" value="대학생">
            
            <label for="sub_uni" class="radio_btn">대학생</label>
            
            <input type="radio" name="grade" class=" grade" id="sub_youth" value="청년">
            
             <label for="sub_youth" class="radio_btn">청년</label>
             
            <input type="radio" name="grade" class=" grade"id="sub_newlyweds" value="신혼부부">
            
            <label for="sub_newlyweds" class="radio_btn">신혼부부</label>
            
            <h4 class="newlyweds">* 본인 또는 배우자(예비신혼부부의 경우 혼인 예정인 배우자) 중 1인이 입주 전까지 주택청약종합저축(청약저축 포함) 가입사실을 증명</h4>
    </div>
      
    
    <!--대학생-->    
     
    <div class="question q_add q2 q2_1">
            <h2>2. 무주택 여부를 선택해주세요</h2>
            <input type="radio" name="have_house" id="q2_1_y" class=" have_house" value="y">
            
            <label for="q2_1_y" class="radio_btn">예</label>
            
            <input type="radio" name="have_house" id="q2_1_n"  class=" have_house" value="n">
            
            <label for="q2_1_n" class="radio_btn">아니요</label>
            
    </div>    
    
    <div class="question q_add q3 q3_1">
            <h2>3. 대학에 재학중이거나 다음 학기에 입학 또는 복학 예정이십니까?</h2>
            <input type="radio" name="univ" id="q3_1_y" class=" univ" value="y">
            
            <label for="q3_1_y" class="radio_btn">예</label>
            
            <input type="radio" name="univ" id="q3_1_n"  class=" univ" value="n">
            
            <label for="q3_1_n" class="radio_btn">아니요</label>
            
    </div>
    
    <div class="question q_add q3 q3_1_2">
            <h2>대학 또는 고등학교를 졸업 또는 중퇴한지 2년 이내 이십니까?</h2>
            <input type="radio" name="gradu" id="q3_1_2_y"  class=" gradu"  value="y">
            
            <label for="q3_1_2_y" class="radio_btn">예</label>
            
            <input type="radio" name="gradu" id="q3_1_2_n"  class=" gradu"  value="n">
            
            <label for="q3_1_2_n" class="radio_btn">아니요</label>
    </div>
    
    <div class="question q_add q4 q4_1">
            <h2>4. 신청자 본인 및 부모의 월평균 소득 합계가 가구원수별 월 평균 소득 100%이하 입니까?</h2>
            <h4>- 자격완화의 경우 소득요건이 달라질 수 있으며, 자세한 사항은 LH청약센터 공고문을 확인해 주시기 바랍니다.</h4>
            <table>
                <tr>
                    <th>가구원수</th>
                    <th>월 평균 소득</th></tr>
                <tr>
                    <td><input type="radio" name="households" id="q4_1_h_1" class=" households"  value="1">
            
            <label for="q4_1_h_1" class="table_btn">1인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q4_1_s_1" value="1">
                    
                    <label for="q4_1_s_1" class="table_btn">3,589,957원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="households" class=" households" id="q4_1_h_2" value="2"> 
            
            <label for="q4_1_h_2" class="table_btn">2인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q4_1_s_2" value="2">
                    <label for="q4_1_s_2" class="table_btn">5,018,789원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="households" class=" households"  id="q4_1_h_3" value="3">
                    
            <label for="q4_1_h_3" class="table_btn">3인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q4_1_s_3" value="3">
                    <label for="q4_1_s_3" class="table_btn">6,240,520원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="households" class=" households"  id="q4_1_h_4" value="4">
                    
            <label for="q4_1_h_4" class="table_btn">4인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q4_1_s_4" value="4">
                    <label for="q4_1_s_4" class="table_btn">7,094,205원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="households" class=" households" id="q4_1_h_5" value="5">
                    
            <label for="q4_1_h_5" class="table_btn">5인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q4_1_s_5" value="5">
                    <label for="q4_1_s_5" class="table_btn">7,393,647원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="households" class=" households" id="q4_1_h_6" value="6">
                    
            <label for="q4_1_h_6" class="table_btn">6인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q4_1_s_6" value="6">
                    <label for="q4_1_s_6" class="table_btn">7,778,023원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="households" class=" households" id="q4_1_h_7" value="7">
                    
            <label for="q4_1_h_7" class="table_btn">7인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q4_1_s_7" value="7">
                    <label for="q4_1_s_7" class="table_btn">8,162,399원 이하</label></td></tr>
                
                <tr>
                    <td><input type="radio" name="households" class=" households" id="q4_1_h_8" value="8">
                    
            <label for="q4_1_h_8" class="table_btn">8인</label></td>
                   
                    <td><input type="radio" name="salary" class=" salary" id="q4_1_s_8" value="8">
                    <label for="q4_1_s_8" class="table_btn">8,162,399원 초과</label></td></tr>
                    
            </table>
            
    </div>
        
    <div class="question q_add q5 q5_1">
            <h2>5. 신청자 본인 총자산(부동산+자동차+금융자산+기타자산-부채)이 72,000,000원 이하입니까?</h2>
            <input type="radio" name="q5_asset" class="q5_asset"  id="q5_1_y" value="y"><label for="q5_1_y" class="radio_btn">예</label>
            <input type="radio" name="q5_asset" class="q5_asset"  id="q5_1_n" value="n"><label for="q5_1_n" class="radio_btn">아니요</label>
            
    </div>
    
    
    <div class="question q_add q6 q6_1">
            <h2>6. 자동차를 보유하고 계십니까?</h2>
            <input type="radio" name="car" id="q6_1_y" class=" car" value="y">
            <label for="q6_1_y" class="radio_btn">예</label>
            
            <input type="radio" name="car" id="q6_1_n" class=" car" value="n">
            <label for="q6_1_n" class="radio_btn">아니요</label>
            
    </div>
    
    
    
    <!--청년-->     
    
    <div class="question q_add q2 q2_2">
            <h2>2. 무주택 여부를 선택해주세요</h2>
            <input type="radio" name="have_house_2" class=" have_house_2" id="q2_2_h_y" value="y">
            <label for="q2_2_h_y" class="radio_btn">예</label>
            
            <input type="radio" name="have_house_2" class=" have_house_2" id="q2_2_h_n" value="n">
            <label for="q2_2_h_n" class="radio_btn">아니요</label>
            
    </div>
    
    <div class="question q_add q3 q3_2">
            <h2>3. 혼인 여부를 선택해주세요.</h2>
            <input type="radio" name="on_wedding" class="on_wedding"  id="q3_2_y" value="y">
            <label for="q3_2_y" class="radio_btn">미혼</label>
            <input type="radio" name="on_wedding" class="on_wedding"  id="q3_2_n" value="n">
            <label for="q3_2_n" class="radio_btn">기혼</label>
            
    </div>
    
    <div class="question q_add q4 q4_2">
            <h2>4. 나이를 선택해주세요.</h2>
            <input type="radio" name="age" class=" age" id="q4_2_0" value="0">            
            <label for="q4_2_0" class="radio_btn">만 19세 미만</label>
            
            <input type="radio" name="age" class="age" id="q4_2_1" value="1">            
            <label for="q4_2_1" class="radio_btn">만 39세 초과</label>
            
            <input type="radio" name="age" class="age" id="q4_2_2" value="2">      
            <label for="q4_2_2" class="radio_btn">만 19~39세</label>
            
    </div>
    
    <div class="question q_add q4 q4_2_1">
            <h2>소득업무 종사기간 5년 이내 중 1),2),3) 중 하나 이상 해당자이신가요?</h2>
            <p>1)소득업무종사자<br>
                2)퇴직한지 1년이 지나지 않은 사람으로 구직급여 수급자격을 인정받은 자<br>
                3)예술인 복지법에 따른 예술인</p>
                
                
            <input type="radio" name="age_etc" id="q4_2_1_y" class="age_etc" value="y">      
            <label for="q4_2_1_y" class="radio_btn">예</label>
            
            <input type="radio" name="age_etc" id="q4_2_1_n"  class="age_etc" value="n">      
            <label for="q4_2_1_n" class="radio_btn">아니요</label>
            
    </div> 
    
    
    
    <div class="question q_add q5 q5_2">
            <h2>5. 해당세대 구성은 어떻습니까?</h2>
            <input type="radio" name="have_fam" class="have_fam"  id="q5_2_f" value="0">      
            <label for="q5_2_f" id="q5_radio" class="radio_btn">세대원이 있는 세대주</label>
            
            <input type="radio" name="have_fam" class=" have_fam"  id="q5_2_e"  value="1">
            <label for="q5_2_e" class="radio_btn">그 외</label>
    </div>
    
    <div class="question q_add q5 q5_2_1">
            <h2>해당세대 가구원수별 월평균소득을 선택해주세요</h2>
            <h4>- 자격완화의 경우 소득요건이 달라질 수 있으며, 자세한 사항은 LH청약센터 공고문을 확인해 주시기 바랍니다.</h4>
            <table>
                <tr>
                    <th rowspan="2">가구원수</th>
                    <th colspan="2">월 평균 소득</th>
                </tr>
                <tr>
                    <th>해당세대</th>
                    <th>본인</th>
                </tr>
                <tr>
                    <td><input type="radio" name="q5_2_households" class="q5_2_households" id="q5_2_1_h_2" value="2">
                    
                    <label for="q5_2_1_h_2" class="table_btn">2인</label>
                    </td>
                    
                    <td><input type="radio" name="q5_2_house_salary" class="q5_2_house_salary" id="q5_2_1_hs_2"  value="2">
                    <label for="q5_2_1_hs_2" class="table_btn">5,018,789원 이하</label></td>    
                                    
                    <td><input type="radio" name="q5_2_salary" class=" q5_2_salary" id="q5_2_1_s_2" value="2">
                    <label for="q5_2_1_s_2" class="table_btn">3,650,028원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="q5_2_households" class="q5_2_households" id="q5_2_1_h_3" value="3">
                    
                    <label for="q5_2_1_h_3" class="table_btn">3인</label>
                    </td>
                    
                    <td><input type="radio" name="q5_2_house_salary" class=" q5_2_house_salary" id="q5_2_1_hs_3"  value="3">
                    <label for="q5_2_1_hs_3" class="table_btn">6,240,520원 이하</label></td>  
                                      
                    <td><input type="radio" name="q5_2_salary" class=" q5_2_salary" id="q5_2_1_s_3" value="3">
                    <label for="q5_2_1_s_3" class="table_btn">4,992,416원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="q5_2_households" class=" q5_2_households" id="q5_2_1_h_4" value="4">
                    
                    <label for="q5_2_1_h_4" class="table_btn">4인</label>
                    </td>
                    
                    <td><input type="radio" name="q5_2_house_salary" class=" q5_2_house_salary" id="q5_2_1_hs_4"  value="4">
                    <label for="q5_2_1_hs_4" class="table_btn">7,094,205원 이하</label></td>  
                                      
                    <td><input type="radio" name="q5_2_salary" class=" q5_2_salary" id="q5_2_1_s_4"  value="4">
                    <label for="q5_2_1_s_4" class="table_btn">5,675,364원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="q5_2_households" class=" q5_2_households" id="q5_2_1_h_5" value="5">
                    
                    <label for="q5_2_1_h_5" class="table_btn">5인</label></td>
                    
                    <td><input type="radio" name="q5_2_house_salary" class=" q5_2_house_salary" id="q5_2_1_hs_5"  value="5">
                    <label for="q5_2_1_hs_5" class="table_btn">7,393,647원 이하</label></td>  
                                      
                    <td><input type="radio" name="q5_2_salary" class=" q5_2_salary" id="q5_2_1_s_5" value="5">
                    <label for="q5_2_1_s_5" class="table_btn">5,914,918원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="q5_2_households" class="q5_2_households" id="q5_2_1_h_6" value="6">
                    
                    <label for="q5_2_1_h_6" class="table_btn">6인</label></td>
                    
                    <td><input type="radio" name="q5_2_house_salary" class="q5_2_house_salary"  id="q5_2_1_hs_6"  value="6">
                    <label for="q5_2_1_hs_6" class="table_btn">7,778,023원 이하</label></td>    
                                    
                    <td><input type="radio" name="q5_2_salary" class=" q5_2_salary" id="q5_2_1_s_6"  value="6">
                    <label for="q5_2_1_s_6" class="table_btn">6,222,418원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="q5_2_households" class="q5_2_households" id="q5_2_1_h_7" value="7">
                    
                    <label for="q5_2_1_h_7" class="table_btn">7인</label></td>
                    
                    <td><input type="radio" name="q5_2_house_salary" class=" q5_2_house_salary" id="q5_2_1_hs_7"  value="7">
                    <label for="q5_2_1_hs_7" class="table_btn">8,162,399원 이하</label></td>  
                                      
                    <td><input type="radio" name="q5_2_salary" class=" q5_2_salary" id="q5_2_1_s_7"  value="7">
                    
                    <label for="q5_2_1_s_7" class="table_btn">6,529,919원 이하</label></td></tr>
                
                <tr>
                    <td><input type="radio" name="q5_2_households" class="q5_2_households" id="q5_2_1_h_8" value="8">
                    
                    <label for="q5_2_1_h_8" class="table_btn">8인</label></td>
                    
                    <td><input type="radio" name="q5_2_house_salary" class=" q5_2_house_salary" id="q5_2_1_hs_8"  value="8">
                    <label for="q5_2_1_hs_8" class="table_btn">8,162,399원 초과</label></td>     
                                   
                    <td><input type="radio" name="q5_2_salary" class=" q5_2_salary" id="q5_2_1_s_8" value="8">
                    
                    <label for="q5_2_1_s_8" class="table_btn">6,529,919원 초과</label></td></tr>
                    
            </table>
            
    </div>
    
    <div class="question q_add q5 q5_2_2">
            <h2>본인 월평균 소득 3,589,957원이하 입니까?</h2>
            <input type="radio" name="q5_2_sal" class=" q5_2_sal" id="q5_2_2_y" value="y">
            <label for="q5_2_2_y" class="radio_btn">예</label>
            
            <input type="radio" name="q5_2_sal" class=" q5_2_sal" id="q5_2_2_n" value="n">
            <label for="q5_2_2_n" class="radio_btn">아니요</label>
            
    </div>
    
    <div class="question q_add q6 q6_2"> 
            <h2>6. 신청자 본인 총자산(부동산+자동차+금융자산+기타자산-부채)이 254,000,000원 이하입니까?</h2>
            <input type="radio" name="q6_2_asset" class=" q6_2_asset" id="q6_2_y" value="y">
            <label for="q6_2_y" class="radio_btn">예</label>
            
            <input type="radio" name="q6_2_asset" class=" q6_2_asset" id="q6_2_n" value="n">            
            <label for="q6_2_n" class="radio_btn">아니요</label>
            
    </div>
    
    
    <div class="question q_add q7">
            <h2>7. 보유 하신 자동차 금액이 34,960,000원이하 입니까? (미보유시 예를 클릭해주세요)</h2>
            <input type="radio" name="q7_1_car" class=" q7_1_car"  id="q7_2_y" value="y">
            <label for="q7_2_y" class="radio_btn">예</label>
            
            <input type="radio" name="q7_1_car" class=" q7_1_car"  id="q7_2_n" value="n">
            <label for="q7_2_n" class="radio_btn">아니요</label>
            
    </div>
    
    
    <!--신혼부부-->
    
    <div class="question q_add q2 q2_3">
            <h2>2. 해당하는 자격을 선택해주세요.</h2>
            <input type="radio" name="wedding" class=" wedding" id="q2_3_y" value="y">
            <label for="q2_3_y" class="radio_btn">신혼부부</label>
            
            <input type="radio" name="wedding" class=" wedding" id="q2_3_n" value="n">
            <label for="q2_3_n" class="radio_btn">예비신혼부부</label>
            
    </div>
    
    
    <div class="question q_add q2 q2_3_1">
            <h2>세대구성원 또는 예비 세대구성원 모두 무주택자이십니까?</h2>
            <input type="radio" name="wedding_house" class=" wedding_house" id="q2_3_1_y" value="y">
            <label for="q2_3_1_y" class="radio_btn">예</label>
            <input type="radio" name="wedding_house" class=" wedding_house" id="q2_3_1_n" value="n">
            <label for="q2_3_1_n" class="radio_btn">아니요</label>
            
    </div> 
    
    
    <div class="question q_add q2 q2_3_2">
            <h2>세대구성원 또는 예비 세대구성원 모두 무주택자이십니까?</h2>
            <input type="radio" name="wedding_house" class=" wedding_house" id="q2_3_2_y" value="y">
            <label for="q2_3_2_y" class="radio_btn">예</label>
            
            <input type="radio" name="wedding_house" class=" wedding_house" id="q2_3_2_n" value="n">
            <label for="q2_3_2_n" class="radio_btn">아니요</label>
            
    </div> 
    
    <div class="question q_add q2 q2_3_1_1">
            <h2>혼인 기간이 7년차 이상인가요?</h2>
            <input type="radio" name="wedding_period" class=" wedding_period" id="q2_3_1_1_y" value="y">
            <label for="q2_3_1_1_y" class="radio_btn">예</label>
            
            <input type="radio" name="wedding_period" class=" wedding_period" id="q2_3_1_1_n"  value="n">
            <label for="q2_3_1_1_n" class="radio_btn">아니요</label>
            
    </div>
    
    <div class="question q_add q3 q3_3">
            <h2>3. 해당세대 가구원수별 월평균소득을 선택해주세요</h2>
            <h4>- 자격완화의 경우 소득요건이 달라질 수 있으며, 자세한 사항은 LH청약센터 공고문을 확인해 주시기 바랍니다.</h4>
            <table>
                <tr>
                    <th rowspan="2">가구원수</th>
                    <th colspan="2">월 평균 소득</th>
                </tr>
                <tr>
                    <th>해당세대</th>
                    <th>맞벌이</th>
                </tr>
                <tr>
                    <td><input type="radio" name="q3_3_households" class=" q3_3_households" id="q3_3_h_2" value="2">
                    
                    
                    <label for="q3_3_h_2" class="table_btn">2인</label></td>
                    
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_s_2"  value="2">
                                        
                    <label for="q3_3_s_2" class="table_btn">5,018,789원 이하</label></td>
                                        
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_hs_2" value="2">
                                        
                    <label for="q3_3_hs_2" class="table_btn">5,931,296원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="q3_3_households" class=" q3_3_households" id="q3_3_h_3" value="3">
                    
                    <label for="q3_3_h_3" class="table_btn">3인</label></td>
                    
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_s_3"  value="3">
                    
                    <label for="q3_3_s_3" class="table_btn">6,240,520원 이하</label>
                    </td>                    
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_hs_3"  value="3">
                    
                    <label for="q3_3_hs_3" class="table_btn">7,488,624원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="q3_3_households" class=" q3_3_households" id="q3_3_h_4" value="4">
                    
                    <label for="q3_3_h_4" class="table_btn">4인</label></td>
                    
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_s_4"  value="4">
                    
                    <label for="q3_3_s_4" class="table_btn">7,094,205원 이하</label></td>   
                                     
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_hs_4"  value="4">
                    
                    <label for="q3_3_hs_4" class="table_btn">8,513,046원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="q3_3_households" class=" q3_3_households" id="q3_3_h_5" value="5">
                    
                    <label for="q3_3_h_5" class="table_btn">5인</label></td>
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_s_5"  value="5">
                    
                    <label for="q3_3_s_5" class="table_btn">7,393,647원 이하</label></td>    
                                    
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_hs_5"  value="5">
                    
                    <label for="q3_3_hs_5" class="table_btn">8,872,376원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="q3_3_households" class=" q3_3_households" id="q3_3_h_6" value="6">
                    
                    <label for="q3_3_h_6" class="table_btn">6인</label></td>
                    
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_s_6"  value="6">
                    
                    <label for="q3_3_s_6" class="table_btn">7,778,023원 이하</label></td>             
                           
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_hs_6"  value="6">
                    
                    <label for="q3_3_hs_6" class="table_btn">9,333,627원 이하</label></td></tr>
                    
                <tr>
                    <td><input type="radio" name="q3_3_households" class=" q3_3_households" id="q3_3_h_7" value="7">
                    
                    <label for="q3_3_h_7" class="table_btn">7인</label></td>
                    
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_s_7"  value="7">
                    
                    <label for="q3_3_s_7" class="table_btn">8,162,399원 이하</label></td>       
                                 
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_hs_7"  value="7">
                    
                    <label for="q3_3_hs_7" class="table_btn">9,794,878원 이하</label></td></tr>
                
                <tr>
                    <td><input type="radio" name="q3_3_households" class=" q3_3_households" id="q3_3_h_8" value="8">
                    
                    <label for="q3_3_h_8" class="table_btn">8인</label></td>
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_s_8"  value="8">
                    
                    <label for="q3_3_s_8" class="table_btn">8,162,399원 초과</label></td>    
                                    
                    <td><input type="radio" name="q3_3_house_salary" class=" q3_3_house_salary" id="q3_3_hs_8"  value="8">
                    
                    <label for="q3_3_hs_8" class="table_btn">9,794,878원 초과</label></td></tr>
                    
            </table>
            
    </div>  
    
    <div class="question q_add q4 q4_3">
            <h2>4. 총자산(부동산+자동차+금융자산+기타자산-부채)이 292,000,000원 이하 입니까?</h2>
            <input type="radio" name="q4_asset" class="q4_asset" id="q4_3_y" value="y">
            <label for="q4_3_y" class="radio_btn">예</label>
            
            <input type="radio" name="q4_asset" class="q4_asset" id="q4_3_n" value="n">
                    
            <label for="q4_3_n" class="radio_btn">아니요</label>
            
    </div>
       
       
    <div class="question q_add q5 q5_3">
            <h2>5. 보유 하신 자동차 금액이 34,960,000원이하 입니까? (미보유시 예를 클릭해주세요)</h2>
            <input type="radio" name="q5_car" class=" q5_car" id="q5_3_y" value="y">
            <label for="q5_3_y" class="radio_btn">예</label>
            
            <input type="radio" name="q5_car" class=" q5_car" id="q5_3_n" value="n">
            <label for="q5_3_n" class="radio_btn">아니요</label>
            
    </div>
    
    <!--결과-->    
    
    <div class="result not_Beneficiary">
        <h2>행복주택 입주대상이 아닙니다.</h2>
    </div>
    
    <div class="result Bene uni_Bene">
        <h2>대학생계층으로 신청가능합니다.</h2>
        <button>▷ 모집공고 바로가기</button>
    </div>
    
    <div class="result Bene youth_Bene">
        <h2>청년계층으로 신청가능합니다.</h2>
        <button>▷ 모집공고 바로가기</button>
    </div>
    
    <div class="result Bene new_Bene">
        <h2>(예비)신혼부부계층으로 신청가능합니다.</h2>
        <button>▷ 모집공고 바로가기</button>
    </div>
    
    
    <button class="reset">초기화</button>

<footer></footer>
</body>
</html>