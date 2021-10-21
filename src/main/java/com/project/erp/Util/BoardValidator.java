package com.project.erp.Util;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.project.erp.DTO.BoardDTO;

import java.util.regex.Pattern;


//MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
// BoardDTO 객체에 저장된 데이터의 유효성 체크할 BoardValidator 클래스 선언하기
//MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
	// Validator : 스프링이 제공하는 인터페이스 중 하나
public class BoardValidator implements Validator {

	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	//  유효성 체크할 객체의 클래스 타입 정보 얻어 리턴하기
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	@Override
	public boolean supports(Class<?> arg0) {
		return BoardDTO.class.isAssignableFrom(arg0);  // 검증할 객체의 클래스 타입 정보
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
			BoardDTO dto = (BoardDTO)obj; //DTO 객체의 형변환

		
			ValidationUtils.rejectIfEmptyOrWhitespace(
					errors                       // Errors 객체
					, "head_category_no"                   // BoardDTO 객체의 속성변수명
					, "말머리를 설정해주세요."         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
				);
			
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			// ValidationUtils 클래스의 rejectIfEmptyOrWhitespace 메소드 호출하여
			//		BoardDTO 객체의 속성변수명 writer 이 비거나 공백으로 구성되어 있으면
			//		경고 메시지를 Errors 객체에 저장하기
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			ValidationUtils.rejectIfEmptyOrWhitespace(
				errors                       // Errors 객체
				, "subject"                   // BoardDTO 객체의 속성변수명
				, "제목을 입력해주세요."         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
			);
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			// BoardDTO 객체의 속성변수명 "subject" 저장된 데이터의 길이가 20자 보다 크면
			// Errors 객체에 속성변수명 "subject" 과 경고 메시지 저장하기
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			String subject = dto.getSubject();
			if( subject!=null && subject.length() >50) {
				errors.rejectValue("subject", "제목은 50자 이하 입니다.");
			}
			


			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			// ValidationUtils 클래스의 rejectIfEmptyOrWhitespace 메소드 호출하여
			//		BoardDTO 객체의 속성변수명 writer 이 비거나 공백으로 구성되어 있으면
			//		경고 메시지를 Errors 객체ㅇ에 저장하기
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			ValidationUtils.rejectIfEmptyOrWhitespace(
				errors                    // Errors 객체
				, "content"                 // BoardDTO 객체의 속성변수명
				, "내용을 입력해주세요."         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
			);
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			// BoardDTO 객체의 속성변수명 "content" 저장된 데이터의 길이가 30자 보다 크면
			// Errors 객체에 속성변수명 "content" 과 경고 메시지 저장하기
			//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
			String content = dto.getContent();
			if( content!=null && content.length() >1000) {
				errors.rejectValue("content", "내용은 공백없이 1000자이하 입니다.");
			}

			


		}catch(Exception ex) {
			System.out.println( "BoardValidator.validate 메소드 실행 시 예외발생!" );
		}
	}
    
}