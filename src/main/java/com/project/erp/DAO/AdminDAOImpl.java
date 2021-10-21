package com.project.erp.DAO;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.erp.DTO.CommentDTO;
import com.project.erp.DTO.MemberDTO;
import com.project.erp.DTO.MyHomeDTO;
import com.project.erp.DTO.StaDTO;


@Repository
public class AdminDAOImpl implements AdminDAO {

	
	//------------------------------------
	@Autowired
	private SqlSessionTemplate sqlSession;
	//------------------------------------

	@Override
	public int getMemberCnt() {
		int memberCnt = this.sqlSession.selectOne("com.project.erp.DAO.AdminDAO.getMemberCnt");
		return memberCnt;
	}

	@Override
	public int getBoardCnt() {
		int boardCnt = this.sqlSession.selectOne("com.project.erp.DAO.AdminDAO.getBoardCnt");
		return boardCnt;
	}

	@Override
	public int getOnGoingHome() {
		int onGoingHome = this.sqlSession.selectOne("com.project.erp.DAO.AdminDAO.getOnGoingHome");
		return onGoingHome;
	}

	@Override
	public int getDoneHomeCnt() {
		int doneHomeCnt = this.sqlSession.selectOne("com.project.erp.DAO.AdminDAO.getDoneHomeCnt");
		return doneHomeCnt;
	}

	@Override
	public List<StaDTO> getSupplyTypeList() {
		List<StaDTO> supplyTypeList = this.sqlSession.selectList(
				"com.project.erp.DAO.AdminDAO.getSupplyTypeList"
				);
		return supplyTypeList;
	}
	
	@Override
	public List<StaDTO> getlocList() {
		List<StaDTO> locList = this.sqlSession.selectList("com.project.erp.DAO.AdminDAO.getlocList");
		return locList;
	}
}
