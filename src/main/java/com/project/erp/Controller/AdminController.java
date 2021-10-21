package com.project.erp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import com.project.erp.DAO.AdminDAO;
import com.project.erp.DTO.StaDTO;
@Controller
public class AdminController {
	@Autowired
	private AdminDAO adminDAO;
	
	@RequestMapping(value="/admin_page.do")
	public ModelAndView admin() {
		
		int memberCnt = this.adminDAO.getMemberCnt();
		int boardCnt = this.adminDAO.getBoardCnt();
		int onGoingHomeCnt = this.adminDAO.getOnGoingHome();
		int doneHomeCnt = this.adminDAO.getDoneHomeCnt();
		List<StaDTO> locList = this.adminDAO.getlocList();
		List<StaDTO> suppyTypeList = this.adminDAO.getSupplyTypeList();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_page.jsp");
		mav.addObject("memberCnt", memberCnt);
		mav.addObject("boardCnt", boardCnt);
		mav.addObject("onGoingHomeCnt", onGoingHomeCnt);
		mav.addObject("doneHomeCnt", doneHomeCnt);
		mav.addObject("locList", locList);
		mav.addObject("suppyTypeList", suppyTypeList);
		return mav;
	}
}
