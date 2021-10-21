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

import com.project.erp.DTO.MemberDTO;
import com.project.erp.DAO.LoginDAO;
import com.project.erp.Util.Util;

@Controller
public class LoginController {

	
	//---------------------------
	@Autowired
	private LoginDAO loginDAO;
	//---------------------------
	
	//---------------------------
	// loginForm.do 立加 
	//---------------------------
	@RequestMapping(value="/loginForm.do")
	public ModelAndView loginForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginPage/loginForm.jsp");
		return mav;
	}
	
	//---------------------------
	// loginProc.do 立加
	//---------------------------
		@RequestMapping(
			value="/loginProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
		)
		
		@ResponseBody
		public int loginProc(       
			@RequestParam(value="login_id") String login_id
			, @RequestParam(value="pwd") String pwd
			, @RequestParam(value="is_login", required=false) String is_login
			, HttpSession session
			, HttpServletResponse response)
		{
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("login_id", login_id);
		map.put("pwd", pwd);
		
		
		int login_idCnt = this.loginDAO.getLogin_idCnt(map);
		int is_admin = this.loginDAO.getIs_admin(map);
		int get_mem_no = this.loginDAO.getMem_no(map);
		System.out.println("is_admin"+is_admin);
		System.out.println("mem_no"+get_mem_no);

		session.setAttribute("is_admin",is_admin);   
		session.setAttribute("mem_no",get_mem_no);
		if(login_idCnt == 1) {

			

			
			if(is_login == null) {
				Util.addCookie("login_id",null,0,response);
				Util.addCookie("pwd",null,0,response);
							
			}
			else {
				Util.addCookie("login_id",login_id,60*60*24,response);
				Util.addCookie("pwd",pwd,60*60*24,response);
			}
	
		}

		return login_idCnt;
	}
	
	
	//---------------------------
	// logout.do 立加  
	//---------------------------
	@RequestMapping(value="/logout.do")
	public ModelAndView logout(HttpSession session) {
		
		session.removeAttribute("mem_no");   
		session.removeAttribute("is_admin");   
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginPage/logout.jsp");
		return mav; 
		
	}
	
	//---------------------------
	// login_alert.do 立加
	//---------------------------
	@RequestMapping(value="/login_alert.do")
	public ModelAndView login_alert() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginPage/login_alert.jsp");
		return mav; 
	}
	
	
	//---------------------------
	// joinRegForm.do 立加 
	//---------------------------
	@RequestMapping(value="/joinRegForm.do")
	public ModelAndView joinRegForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("joinPage/joinRegForm.jsp");
		return mav;
	}
	


	
	//---------------------------
	// find_pwd.do 立加 
	//---------------------------
	@RequestMapping(value="/find_pwd.do")
	public ModelAndView find_pwd() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginPage/find_pwd.jsp");
		return mav;
		}
	
		@RequestMapping(
			value="/checkPwdProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
		)
		
		@ResponseBody
		public Map<String,String> pwdProc(       
			@RequestParam(value="find_id_value") String find_id_value
			, @RequestParam(value="find_phone_value") String find_phone_value
			, @RequestParam(value="find_email_value") String find_email_value
			, HttpSession session
			, HttpServletResponse response)
		{
			
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("find_id_value", find_id_value);
		map.put("find_phone_value", find_phone_value);
		map.put("find_email_value", find_email_value);
		
	
		int check_pwdCnt = this.loginDAO.getCheck_pwdCnt(map);
		System.out.println(check_pwdCnt);
		String checkedPwd ="";
		
		if(check_pwdCnt == 1) {
			checkedPwd= this.loginDAO.getCheckedPwd(map);
		}
		
		Map<String,String> resultMap = new HashMap<String, String>();
		resultMap.put("check_pwdCnt", check_pwdCnt+"");
		resultMap.put("checkedPwd", checkedPwd);
		
		return resultMap;
			
	}
	
	
	//---------------------------
	// find_id.do 立加 
	//---------------------------
	@RequestMapping(value="/find_id.do")
	public ModelAndView find_id() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginPage/find_id.jsp");
		return mav;
		}
	
		@RequestMapping(
			value="/checkIdProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
		)
		
		@ResponseBody
		public Map<String,String> idProc(       
			@RequestParam(value="find_name_value") String find_name_value
			, @RequestParam(value="find_phone_value") String find_phone_value
			, @RequestParam(value="find_email_value") String find_email_value
			, HttpSession session
			, HttpServletResponse response)
		{
			
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("find_name_value", find_name_value);
		map.put("find_phone_value", find_phone_value);
		map.put("find_email_value", find_email_value);
		
	
		int check_idCnt = this.loginDAO.getCheck_IdCnt(map);
		System.out.println(check_idCnt);
		String checkedId ="";
		
		if(check_idCnt == 1) {
			checkedId= this.loginDAO.getCheckedId(map);
		}
		
		Map<String,String> resultMap = new HashMap<String, String>();
		resultMap.put("check_idCnt", check_idCnt+"");
		resultMap.put("checkedId", checkedId);
		
		return resultMap;
			
	}
	//---------------------------
	// loginRegProc.do 立加 
	//---------------------------
	@RequestMapping(
			value="/loginRegProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
		)
		@ResponseBody
		public int insertMember(MemberDTO memberDTO) {
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
		System.out.println("insertMember => " + memberDTO.getBirth_day());
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
		int memRegCnt = this.loginDAO.insertMember(memberDTO);
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
		System.out.println("memRegCnt => " + memRegCnt);
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
		return memRegCnt;
		
	}

	@RequestMapping(
			value="/overlapIdProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
		)
		@ResponseBody
		public int CheckOverlapId(
				@RequestParam(value="mem_id") String mem_id
				) {
		int CheckOverlapIdCnt = this.loginDAO.checkOverlapId(mem_id);
		return CheckOverlapIdCnt;
	}
	
	@RequestMapping(
			value="/overlapNicknameProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
		)
		@ResponseBody
		public int CheckOverlapNickname(
				@RequestParam(value="nickname") String nickname
				) {
		int CheckOverlapNicknameCnt = this.loginDAO.checkOverlapNickname(nickname);
		return CheckOverlapNicknameCnt;
	}
	
}
