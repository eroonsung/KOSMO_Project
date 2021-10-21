package com.project.erp.DAO;

import java.util.List;
import java.util.Map;

import com.project.erp.DTO.MemberDTO;


public interface LoginDAO {
	
	public int getLogin_idCnt( Map<String,String> id_pwd );
	
	

	public int getCheck_pwdCnt(Map<String, String> map);

	public String getCheckedPwd(Map<String, String> map);

	
	
	public int getCheck_IdCnt(Map<String, String> map);

	public String getCheckedId(Map<String, String> map);
	
	public int insertMember(MemberDTO memberDTO);

	public int checkOverlapId(String mem_id);
	
	public int checkOverlapNickname(String nickname);



	public int getMem_no(Map<String, String> map);



	public int getIs_admin(Map<String, String> map);



	public String getNickname(Map<String, String> map);


	
	
}
