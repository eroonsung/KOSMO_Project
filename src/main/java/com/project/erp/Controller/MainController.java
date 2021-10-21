package com.project.erp.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.erp.DAO.LoginDAO;

@Controller
public class MainController {

	
	//---------------------------
	@Autowired
	private LoginDAO loginDAO;
	//---------------------------
	

	//---------------------------
	// loginForm.do Á¢¼Ó 
	//---------------------------

	@RequestMapping(value="/main.do")
	public ModelAndView MainForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mainPage/main.jsp");
		return mav;
	}

	@RequestMapping(value="/map.do")
	public ModelAndView map() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mainPage/map_iframe.jsp");
		return mav;
	}


	
	@RequestMapping(value="/info.do")
	public ModelAndView Info() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("infoPage/info.jsp");
		return mav;
	}
	
	@RequestMapping(value="/selfDiagnosis.do")
	public ModelAndView SelfDiagnosis() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("selfDiagnosis/selfDiagnosis.jsp");
		return mav;
	}	

	
	@RequestMapping(value="/checkHappyHome.do")
	public ModelAndView CheckHappyHome() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("selfDiagnosis/checkHappyHome.jsp");
		return mav;
		
	}
	

	
	@RequestMapping(value="/checkRental.do")
	public ModelAndView CheckRental() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("selfDiagnosis/CheckRental.jsp");
		return mav;
		
	}
	
	

	
}
