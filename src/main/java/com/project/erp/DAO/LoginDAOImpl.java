package com.project.erp.DAO;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.erp.DTO.CommentDTO;
import com.project.erp.DTO.MemberDTO;


@Repository
public class LoginDAOImpl implements LoginDAO {

	
	//------------------------------------
	@Autowired
	private SqlSessionTemplate sqlSession;
	//------------------------------------
	

	public int getLogin_idCnt(Map<String,String> id_pwd_map) {
		
		int login_idCnt = this.sqlSession.selectOne(
			"com.project.erp.DAO.LoginDAO.getLogin_idCnt"					
			,id_pwd_map												
		);
		
		return login_idCnt;
	}
	

	@Override
	public int getCheck_pwdCnt(Map<String, String> map) {
		
		int check_pwdCnt = this.sqlSession.selectOne(
			"com.project.erp.DAO.LoginDAO.getCheck_pwdCnt"					
			,map												
		);
		
		return check_pwdCnt;
	}


	public String getCheckedPwd(Map<String, String> map) {
		String checkedPwd = this.sqlSession.selectOne(
				"com.project.erp.DAO.LoginDAO.getCheckedPwd"					
				,map												
			);
			
			return checkedPwd;
	}
	
	
	@Override
	public int getCheck_IdCnt(Map<String, String> map) {
		
		int check_idCnt = this.sqlSession.selectOne(
			"com.project.erp.DAO.LoginDAO.getCheck_IdCnt"					
			,map												
		);
		
		return check_idCnt;
	}


	public String getCheckedId(Map<String, String> map) {
		String checkedId = this.sqlSession.selectOne(
				"com.project.erp.DAO.LoginDAO.getCheckedId"					
				,map												
			);
			
			return checkedId;
	}

	@Override
	public int insertMember(MemberDTO memberDTO) {
		int memRegCnt = this.sqlSession.insert(
				"com.project.erp.DAO.LoginDAO.insertMember"
				,memberDTO
			);
		System.out.println("loginDAO.inserMember"+memRegCnt);
			return memRegCnt;
	}


	@Override
	public int checkOverlapId(String mem_id) {
		int CheckOverlapIdCnt = this.sqlSession.selectOne(
				"com.project.erp.DAO.LoginDAO.checkOverlapId"
				,mem_id
				);
				
		return CheckOverlapIdCnt;
	}

	 

	@Override
	public int checkOverlapNickname(String nickname) {
		int CheckOverlapNicknameCnt = this.sqlSession.selectOne(
				"com.project.erp.DAO.LoginDAO.checkOverlapNickname"
				,nickname
				);
		return CheckOverlapNicknameCnt;
	}


	@Override
	public int getMem_no(Map<String, String> map) {
		int getMem_no = this.sqlSession.selectOne(
				"com.project.erp.DAO.LoginDAO.getMem_no"
				,map
				);
		return getMem_no;
	}

	@Override
	public int getIs_admin(Map<String, String> map) {
		int getIs_admin = this.sqlSession.selectOne(
				"com.project.erp.DAO.LoginDAO.getIs_admin"
				,map
				);
		return getIs_admin;
	}

 
	@Override
	public String getNickname(Map<String, String> map) {
		String getNickname = this.sqlSession.selectOne(
				"com.project.erp.DAO.LoginDAO.getNickname"
				,map
				);
		return getNickname;
	}

	


	
}
