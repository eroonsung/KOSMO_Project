<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.project.erp.DAO.MyHomeDAO">
	<sql id="myhomeWhere">
	    <if test="complex_name!=null and complex_name.length()>0">
   		and(
   			upper(r.complex_name) like upper('%${complex_name}%') 
   		) 
    	</if>
	    <if test="target_code!=null and target_code.length()>0 and target_code!=0">
   		and(
   			t.target_code = #{target_code}
   		) 
    	</if>
    	<if test="(loc_no!=null and loc_no.length()>0) and (loc_detail_no==null or loc_detail_no.length==0)" >
    	and(
    		r.loc_no=#{loc_no}
    	)
    	</if>
    	<if test="(loc_no!=null and loc_no.length()>0) and (loc_detail_no!=null and loc_detail_no.length>0)" >
    	and(
    		r.loc_detail_no=#{loc_detail_no}
    	)
    	</if>
    	<if test="move_date!=null and move_date.length()>0">
   		and(
   			to_date(r.first_move_date||'01','YYYYMMDD')> to_date(#{move_date},'YYYY-MM')
   		)
    	</if>
    	
    	<if test="state!=null and state.length()>0">
    		<if test="state.equals('모집중')">
    	and(
    		to_date(r.first_move_date||'01','YYYYMMDD')>sysdate
    	)   
    		 </if>
    	<if test="state.equals('모집완료')">
    	and(
    		sysdate>to_date(r.first_move_date||'01','YYYYMMDD')
    	)   
    		 </if>	
    	</if>
    	
    	<if test="supply_type_no!=null and supply_type_no.size()>0">
   		and
   			<foreach collection="supply_type_no" item="supply_type_no" open="(" separator=" or " close=")">
   				rd.supply_type_no = #{supply_type_no}
   			</foreach>
    	</if>
    	<if test="area_grade_no!=null and area_grade_no.length()>0"> 
   		and(
   			to_number(rd.dedicated_area) between (select to_number(min_dedicated_area) from area_grade where area_grade_no=#{area_grade_no})
            and (select to_number(max_dedicated_area) from area_grade where area_grade_no=#{area_grade_no})
   		)
    	</if>  
    	<if test="rent_deposit!=null and rent_deposit.length()>0">
    		<if test="rent_deposit.equals('5만원')">
    			 and to_number(rd.month_rent)>=1 and 50000>to_number(rd.month_rent)
    		</if>
    		<if test="rent_deposit.equals('5~10만원')">
   				and to_number(rd.month_rent)>=50000 and 100000>to_number(rd.month_rent)
    		</if>
      		<if test="rent_deposit.equals('10~20만원')">
   				and (to_number(rd.month_rent)>=100000 and 200000>to_number(rd.month_rent))
    		</if>
    		<if test="rent_deposit.equals('20~30만원')">
   				and (to_number(rd.month_rent)>=200000 and 300000>to_number(rd.month_rent))
    		</if>
    		<if test="rent_deposit.equals('30만원')">
   				and (to_number(rd.month_rent)>=300000)
    		</if>
    	</if>
	</sql>
	
	<select id="getLocationList" resultType="com.project.erp.DTO.MyHomeDTO">
		select * from location
	</select>
	
	<select id="getLoc_detailList" parameterType="String" resultType="com.project.erp.DTO.MyHomeDTO" >
		select * from loc_detail where loc_no=${xxx}
	</select>
	
	<select id="getFirst_detailList" resultType="com.project.erp.DTO.MyHomeDTO">
		select * from loc_detail
	</select>
	
	<select id="getSupply_typeList" resultType="com.project.erp.DTO.MyHomeDTO">
		select * from supply_type
	</select>
	
	<select id="getArea_gradeList" resultType="com.project.erp.DTO.MyHomeDTO">
		select * from area_grade
	</select>
	
	<select id="getRentalListAllCnt" parameterType="com.project.erp.DTO.MyHomeSearchDTO" resultType="Integer">
		select 
    		count(*)
		from rental r, rental_detail rd, supply_type s,target t
		where r.rental_no = rd.rental_no
		and rd.supply_type_no = s.supply_type_no
		and t.rental_no = r.rental_no
		<include refid="myhomeWhere"/>
	</select>
	
	<select id="getRentalList" parameterType="com.project.erp.DTO.MyHomeSearchDTO" resultType="java.util.HashMap">
		select * 
		from (select rownum RNUM, zxcvb.*
		        from (select 
		    r.rental_no "rental_no"
		    , case when to_date(r.first_move_date||'01','YYYYMMDD')>sysdate then 1 else 2 end "ongoing"
		    , rd.rental_detail_no "rental_detail_no"
		    , r.loc_no			  "loc_no"
		    , s.supply_type_name  "supply_type_name"
		    , r.complex_name		"complex_name"
		    , r.tot_house_num		"tot_house_num"
		    , rd.house_num			"house_num"
		    , r.detail_location		"detail_location"
		    , substr(r.first_move_date,1,4)		"year_of_first_move_date"
		    , substr(r.first_move_date,5,2)		"month_of_first_move_date"
		    , 
		    (case when month_rent=0 then '미정'
		    	else to_char(to_number(rd.month_rent),'999,999,999,999')||'원' end	
		    )  "month_rent"
		from rental r, rental_detail rd, supply_type s,target t
		where r.rental_no = rd.rental_no
		and rd.supply_type_no = s.supply_type_no 
		and t.rental_no = r.rental_no
	
		<include refid="myhomeWhere"/>
		order by
			case when 
    		to_date(r.first_move_date||'01','YYYYMMDD')>sysdate then 1 else 2 end
			, r.rental_regdate
			)zxcvb
			<![CDATA[
	        where rownum <= ${selectPageNo * rowCntPerPage}  )
	    	where RNUM >= ${((selectPageNo-1)*rowCntPerPage)+1}
	        ]]>
	</select>
	
	<select id="getMyHome" parameterType="int" resultType="com.project.erp.DTO.MyHomeDTO">
		select
			rd.rental_no		"rental_no" 
		    ,rd.rental_detail_no "rental_detail_no"
		    , rd.supply_type_no "supply_type_no"
		    , s.supply_type_name  "supply_type_name"
		    , r.complex_name		"complex_name"
		    , r.tot_house_num		"tot_house_num"
		    , rd.house_num			"house_num"
		    , r.detail_location		"detail_location"
		 	, substr(r.first_move_date,1,4)		"year_of_first_move_date"
		    , substr(r.first_move_date,5,2)		"month_of_first_move_date"
		    , r.loc_no					"loc_no"
		    , r.loc_detail_no			"loc_detail_no"
		    , 
		    (case when month_rent=0 then '미정'
		    	else to_char(to_number(rd.month_rent),'999,999,999,999')||'원' end	
		    )  "month_rent"
		    ,rd.dedicated_area "dedicated_area"
		    ,(case when rent_deposit=0 then '미정'
		    	else to_char(to_number(rd.rent_deposit),'999,999,999,999')||'원' end	
		    )  "rent_deposit"
		from rental r, rental_detail rd, supply_type s
		where r.rental_no(+) = rd.rental_no
		and rd.supply_type_no = s.supply_type_no(+)
		and rd.rental_detail_no = #{rental_detail_no}
	</select>
	<select id="getSameComplexList" parameterType="int" resultType="com.project.erp.DTO.MyHomeDTO">
		select 
			r.rental_no				"rental_no"
			,rd.rental_detail_no	"rental_detail_no"
		    , r.complex_name          "complex_name"
		    , rd.dedicated_area     "dedicated_area"
		    , rd.house_num          "house_num"
		    , (case when month_rent=0 then '미정'
		    	else to_char(to_number(rd.month_rent),'999,999,999,999')||'원' end	
		    )         "month_rent"
		    , (case when rent_deposit=0 then '미정'
		    	else to_char(to_number(rd.rent_deposit),'999,999,999,999')||'원' end	
		    )       "rent_deposit"
		 from rental_detail rd, rental r, target t
		where
		    rd.rental_no = r.rental_no
		    and t.rental_no = r.rental_no
		    and rd.rental_no = (select rental_no from rental_detail where rental_detail_no=#{rental_detail_no})
		order by
			dedicated_area desc
	</select>
	
	
	<insert id="insertHome" parameterType="com.project.erp.DTO.MyHomeDTO">
		insert into rental(
			rental_no
			,tot_house_num
			,complex_name
			,first_move_date
			,loc_no
			,loc_detail_no
			,detail_location
		) values (
			(select nvl(max(rental_no),0)+1 from rental)
			,#{tot_house_num} 
			,#{complex_name}  
			,substr(#{first_move_date},1,4)||substr(#{first_move_date},6,2)
			,#{loc_no} 
			,#{loc_detail_no}
			,#{detail_location}
		)
	</insert>
	
	<insert id="insertDetailHome" parameterType="com.project.erp.DTO.MyHomeDTO">
		insert into rental_detail(
				rental_detail_no
				,rental_no
				,dedicated_area
				,month_rent
				,house_num
				,supply_type_no
				,rent_deposit
			) values (
				(select nvl(max(rental_detail_no),0)+1 from rental_detail)
				,(select max(rental_no) from rental)
				,#{dedicated_area}  
				,#{month_rent}
				,#{house_num} 
				,#{supply_type_no}
				,#{rent_deposit}
			)
	</insert>
	
	<insert id="insertTarget" parameterType="String">
		insert into target(
				target_grade_no
				,rental_no
				,target_code
			) values (
				(select nvl(max(target_grade_no),0)+1 from target)
				,(select max(rental_no) from rental)
				,#{target_codeList}
			)
	</insert>
	

	<delete id="deleteMyHome" parameterType="com.project.erp.DTO.MyHomeDTO">
          delete from rental_detail where rental_detail_no=#{rental_detail_no}
	</delete>
	 
	<delete id="deleteTarget" parameterType="com.project.erp.DTO.MyHomeDTO">
          delete from target where rental_no=#{rental_no}
	</delete>
	 
	<update id="updateRental" parameterType="com.project.erp.DTO.MyHomeDTO">
	update rental
	set
	    tot_house_num=#{tot_house_num}
	    , complex_name=#{complex_name}
	    , first_move_date=substr(#{first_move_date},1,4)||substr(#{first_move_date},6,2)
	    ,detail_location=#{detail_location}
	    ,loc_no=#{loc_no}
	    ,loc_detail_no=#{loc_detail_no}
	where rental_no=#{rental_no}
	</update>
	
	<update id="updateRentalDetail" parameterType="com.project.erp.DTO.MyHomeDTO">
	update rental_detail
	set
	    dedicated_area=#{dedicated_area}
	    , month_rent=<if test="!month_rent.equals('미정')">#{month_rent}</if><if test="month_rent.equals('미정')">0</if>
	    , house_num=#{house_num}
	    ,supply_type_no=#{supply_type_no}
	    ,rent_deposit=<if test="!rent_deposit.equals('미정')">#{rent_deposit}</if><if test="rent_deposit.equals('미정')">0</if>
	where rental_detail_no=#{rental_detail_no}
	</update>
	
	<select id="getXxxTargetCode"  parameterType="int" resultType="com.project.erp.DTO.MyHomeDTO">
		select t.rental_no "rental_no" ,rd.rental_detail_no "rental_detail_no", t.target_code "target_code"
        from target t, rental_detail rd
        where t.rental_no = rd.rental_no    
            and t.rental_no=${rental_no}
	</select>
</mapper> 

