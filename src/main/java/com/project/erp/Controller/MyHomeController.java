package com.project.erp.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.erp.DAO.MyHomeDAO;
import com.project.erp.DTO.MyHomeDTO;
import com.project.erp.DTO.MyHomeSearchDTO;
import com.project.erp.Service.MyHomeService;
import com.project.erp.Util.MyHomeValidator;
import com.project.erp.Util.Util;

@Controller
public class MyHomeController {

	@Autowired
	private MyHomeDAO myHomeDAO;
	@Autowired
	private MyHomeService myHomeService;


	@RequestMapping(value="/searchMyHome.do")
	public ModelAndView SeacrhMyHome( MyHomeSearchDTO myHomeSearchDTO
			,@RequestParam(value="xxx"	
					,required=false
					,defaultValue="0"
					) String xxx
		) throws Exception {
		List<MyHomeDTO> locationList = this.myHomeDAO.getLocationList();
		List<MyHomeDTO> loc_detailList = this.myHomeDAO.getLoc_detailList(xxx);
		List<MyHomeDTO> supply_typeList = this.myHomeDAO.getSupply_typeList();
		List<MyHomeDTO> area_gradeList = this.myHomeDAO.getArea_gradeList();
		
		int rentalListAllCnt = this.myHomeDAO.getRentalListAllCnt(myHomeSearchDTO);
		List<Map<String,String>> rentalList = this.myHomeDAO.getRentalList(myHomeSearchDTO);
		
		int selectPageNo = myHomeSearchDTO.getSelectPageNo();
		int rowCntPerPage = myHomeSearchDTO.getRowCntPerPage();
		int pageNoCntPerPage = 10;
		
		Map<String,Integer> map= Util.getPagingNos(rentalListAllCnt
				, pageNoCntPerPage
				, selectPageNo
				, rowCntPerPage);
		
		//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		//HashMap<String,Integer> 객체에 저장된 보정된 선택된 페이지 번호를
		//BoardSearchDTO객체의 setSelectPageNo메소드 호출로 덮어씌우기
		myHomeSearchDTO.setSelectPageNo(map.get("selectPageNo"));
		
		//정순번호
		int start_serial_no = (selectPageNo-1)*rowCntPerPage+1;
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("searchPage/searchMyHome.jsp");
		mav.addObject("locationList", locationList);
		mav.addObject("loc_detailList", loc_detailList);
		mav.addObject("supply_typeList", supply_typeList);
		mav.addObject("area_gradeList", area_gradeList);
		mav.addObject("rentalListAllCnt", rentalListAllCnt);
		mav.addObject("rentalList", rentalList);
		
		mav.addObject("start_serial_no", start_serial_no);
		
		mav.addObject("pagingNos",map );
		
		return mav;
	}

	@RequestMapping(value="/myHomeContentForm.do")
	public ModelAndView goMyHomeContentForm(
			@RequestParam(value="rental_detail_no") int rental_detail_no // "b_no"는 원래 숫자 문자이지만 spring이 알아서 바꿔줌
			) {
		//----------------------------------------------------
		// [BoardServiceImpl 객체]의 getBoard 메소드 호출로 [1개의 게시판글]을 BoardDTO 객체에 담아오기
		//----------------------------------------------------
		MyHomeDTO myHomeDTO = this.myHomeDAO.getMyHome(rental_detail_no);
			//readcount가 증가하기 때문에 update구문이 있어 트랜잭션이 걸림
		//----------------------------------------------------
		//[ModelAndView 객체] 생성하기
		//[ModelAndView 객체]에 [호출할 JSP 페이지명]을 저장하기
		//[ModelAndView 객체]에 DB연동 결과물 담기 
		//[ModelAndView 객체] 리턴하기
		//---------------------------------------------------
		List<MyHomeDTO> sameComplexList = this.myHomeDAO.getSameComplexList(rental_detail_no);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("searchPage/myHomeContentForm.jsp");
		
		mav.addObject("rental_detail_no", rental_detail_no);
		mav.addObject("myHomeDTO", myHomeDTO);
		mav.addObject("sameComplexList", sameComplexList);
		return mav;
	}

	@RequestMapping(value="/myHomeRegForm.do")
	public ModelAndView goMyHomeRegForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("searchPage/myHomeRegForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/myHomeUpDelForm.do")
	public ModelAndView goMyHomeUpDelForm(
			@RequestParam(value="rental_detail_no") int rental_detail_no 
			,@RequestParam(value="xxx"	
			,required=false
			,defaultValue="0"
			) String xxx
			){
		MyHomeDTO myHomeDTO = this.myHomeDAO.getMyHome(rental_detail_no);
		List<MyHomeDTO> supply_typeList = this.myHomeDAO.getSupply_typeList();
		
		List<MyHomeDTO> locationList = this.myHomeDAO.getLocationList();
		List<MyHomeDTO> loc_detailList = this.myHomeDAO.getLoc_detailList(xxx);
		String loc_no = myHomeDTO.getLoc_no();
		List<MyHomeDTO> firstLoc_detailList = this.myHomeDAO.getFirst_detailList();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("searchPage/myHomeUpDelForm.jsp");
		mav.addObject("myHomeDTO", myHomeDTO);
		mav.addObject("supply_typeList", supply_typeList);
		mav.addObject("locationList", locationList);
		mav.addObject("loc_detailList", loc_detailList);
		mav.addObject("firstLoc_detailList", firstLoc_detailList);
		return mav;
	}

	
	@RequestMapping( 
			value = "/myHomeUpDelProc.do"
			, method = RequestMethod.POST
			, produces = "application/json;charset=UTF-8" 
	)
	@ResponseBody
	public Map<String,String> checkMyHomeUpDelForm(
			//+++++++++++++++++++++++++++++++++++++++++++++++++
			// 파라미터값을 저장할 [BoardDTO 객체]를 매개변수로 선언
			//+++++++++++++++++++++++++++++++++++++++++++++++++
			MyHomeDTO myHomeDTO
			
			//+++++++++++++++++++++++++++++++++++++++++++++++++
			// "upDel"라는 파라미터명의 파라미터값이 저장된 매개변수 upDel 선언
			//+++++++++++++++++++++++++++++++++++++++++++++++++
			, @RequestParam(value="upDel") String upDel
			
			//+++++++++++++++++++++++++++++++++++++++++++++++++
			// Error 객체를 관리하는 BindingResult 객체가 저장되어 들어오는 매개변수 bindingResult 선언
			// BindingResult 객체 => 유효성 검사
			//+++++++++++++++++++++++++++++++++++++++++++++++++
			, BindingResult bindingResult
		) throws Exception {

		int myHomeUpDelCnt =0;
		//유효성 체크 에러 메시지를 저장할 변수 msg 선언
		String msg = "";
		//----------------------------------------------------
		//만약 게시판 수정 모드면 => 유효성 검사 필요
		//수정 실행하고 수정 적용행의 개수 얻기
		//----------------------------------------------------
		if(upDel.equals("up")) {
			//----------------------------------------------------
			//check_BoardDTO 메소드를 호출하여 [유효성 체크]를 하고 경고문자 얻기
			//유효성확인에 실패하면 DB연동을 할 수 없음
			//----------------------------------------------------	
			
				// check_BoardDTO 메소드를 호출하여 유효성 체크하고 에러메시지 문자 얻기
				// boardDTO, bindingResult의 메모리위치주소를 넣어줌
			msg = check_MyHomeDTO(myHomeDTO, bindingResult);
			
			//----------------------------------------------------
			//[ModelAndView 객체]에 유효성 체크 에러메시지 저장하기
			//----------------------------------------------------
			
			//만약 msg안에 ""가 저장되어 있으면, 즉 유효성 체크를 통과했으면
			if(msg.equals("")) {
				//수정 DB연동
				//----------------------------------------------------
				//[BoardServiceImpl 객체]의 updateBoard 메소드 호출로 
				// 게시판 글 수정하고 [게시판 수정 적용행의 개수] 얻기
				//----------------------------------------------------
					// 결과가 1이면(한 행이 들어가면) 성공
				//boardDTO에 파라미터값이 담겨있음
				myHomeUpDelCnt = this.myHomeService.updateMyHome(myHomeDTO);
				//System.out.println("boardUpdateCnt => "+ boardUpDelCnt); // DB연동 성공했는지 확인
			}
		}
		//----------------------------------------------------
		//만약 게시판 삭제 모드면 => 유효성검사 필요없음
		//----------------------------------------------------
		else if(upDel.equals("del")) {
			//----------------------------------------------------
			//[BoardServiceImpl 객체]의 deleteBoard 메소드 호출로
			//삭제 실행하고 [삭제 적용행의 개수] 얻기
			//----------------------------------------------------
			myHomeUpDelCnt = this.myHomeDAO.deleteMyHome(myHomeDTO);
		}

		//*******************************************
		// HashMap<String,String> 객체 생성하기
		// HashMap<String,String> 객체에 게시판 수정.삭제 성공행의 개수 저장하기
		// HashMap<String,String> 객체에 유효성 체크 시 메시지 저장하기
		// HashMap<String,String> 객체 리턴하기
		//*******************************************
		Map<String, String> map = new HashMap<String,String>();
		map.put("myHomeUpDelCnt", myHomeUpDelCnt+"");		
		map.put("msg",msg);
		return map;
	}

	private String check_MyHomeDTO(MyHomeDTO myHomeDTO, BindingResult bindingResult) {
		String checkMsg = "";
		//----------------------------------------------------
		//BoardDTO 객체에 저장된 데이터의 유효성 체크할 BoardValidator 객체 생성하기
		//BoardValidator 객체의 validate 메소드를 호출하여 유효성 체크 실행하기
		//----------------------------------------------------
		MyHomeValidator myHomeValidator = new MyHomeValidator();
			// 메소드만 호출 (리턴값이 없음)
		myHomeValidator.validate(
				myHomeDTO  // 유효성을 체크할 DTO 객체
				, bindingResult // 유효성 체크 결과를 관리하는 BindingResult 객체
				);
		
				//----------------------------------------------------
				//만약 BindingResult 객체의 hasErrors() 메소드를 호출하여 true값을 얻으면(유효성 체크에 문제 발생)
				//----------------------------------------------------
				if(bindingResult.hasErrors()) {
					// 변수 checkMsg에 BoardValidator 객체에 저장된 경고문구 얻어 저장하기 
					checkMsg = bindingResult.getFieldError().getCode();
				}		
				//----------------------------------------------------
				//checkMsg안의 문자 리턴하기
				//----------------------------------------------------
				return checkMsg;
			}
}
