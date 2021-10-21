package com.project.erp.Util;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.project.erp.DTO.BoardDTO;
import com.project.erp.DTO.MyHomeDTO;

import java.util.regex.Pattern;


//MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
// BoardDTO 객체에 저장된 데이터의 유효성 체크할 BoardValidator 클래스 선언하기
//MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
	// Validator : 스프링이 제공하는 인터페이스 중 하나
public class MyHomeValidator implements Validator {

	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	//  유효성 체크할 객체의 클래스 타입 정보 얻어 리턴하기
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
	public boolean supports(Class<?> arg0) {
		return MyHomeDTO.class.isAssignableFrom(arg0);  // 검증할 객체의 클래스 타입 정보
	}

	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	//  유효성 체크할 메소드 선언하기
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
	public void validate(
		// Object객체 사용 -> 뭐가 들어올 지 모를 때/ 뭐가 리턴될 지 모를 때
		Object obj          // DTO 객체 저장 매개변수 => BoardDTO boardDTO 의 조상
		, Errors errors     // 유효성 검사 시 발생하는 에러를 관리하는 Errors 객체 저장 매개변수 => BindingResult bindingResult의 조상
	){
		try {
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			// 유효성 체크할 DTO 객체 얻기
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			// 자기 자료형으로 복구시키는 이유
				//: 부모 자료형으로 쓰면 본인이 가지고 있는 고유 메서드를 호출 불가능하기 때문
			MyHomeDTO dto = (MyHomeDTO)obj; //DTO 객체의 형변환

		
			ValidationUtils.rejectIfEmptyOrWhitespace(
					errors                       // Errors 객체
					, "complex_name"                   // BoardDTO 객체의 속성변수명
					, "단지명을 입력해주세요.."         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
				);
			
			ValidationUtils.rejectIfEmptyOrWhitespace(
				errors                       // Errors 객체
				, "house_num"                   // BoardDTO 객체의 속성변수명
				, "세대수를 입력해주세요."         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
			);
			
			ValidationUtils.rejectIfEmptyOrWhitespace(
					errors                       // Errors 객체
					, "tot_house_num"                   // BoardDTO 객체의 속성변수명
					, "총세대수를 입력해주세요."         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
				);
			
			ValidationUtils.rejectIfEmptyOrWhitespace(
					errors                       // Errors 객체
					, "move_date"                   // BoardDTO 객체의 속성변수명
					, "최초입주년월을 입력해주세요."         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
				);

			ValidationUtils.rejectIfEmptyOrWhitespace(
				errors                    // Errors 객체
				, "detail_location"                 // BoardDTO 객체의 속성변수명
				, "상세주소를 입력해주세요."         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
			);
			
			ValidationUtils.rejectIfEmptyOrWhitespace(
					errors                    // Errors 객체
					, "dedicated_area"                 // BoardDTO 객체의 속성변수명
					, "전용면적을 입력해주세요."         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
				);
			ValidationUtils.rejectIfEmptyOrWhitespace(
					errors                    // Errors 객체
					, "supply_type_no"                 // BoardDTO 객체의 속성변수명
					, "공급유형을 선택하세요."         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
				);
			ValidationUtils.rejectIfEmptyOrWhitespace(
					errors                    // Errors 객체
					, "month_rent"                 // BoardDTO 객체의 속성변수명
					, "월임대료를 입력해주세요."         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
				);
			ValidationUtils.rejectIfEmptyOrWhitespace(
					errors                    // Errors 객체
					, "rent_deposit"                 // BoardDTO 객체의 속성변수명
					, "임대보증금을 입력해주세요."         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
				);
		}catch(Exception ex) {
			System.out.println( "BoardValidator.validate 메소드 실행 시 예외발생!" );
		}
	}
    
}