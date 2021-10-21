package com.project.erp.DAO;

import java.util.List;
import java.util.Map;

import com.project.erp.DTO.MemberDTO;
import com.project.erp.DTO.StaDTO;


public interface AdminDAO {

	int getMemberCnt();

	int getBoardCnt();

	int getOnGoingHome();

	int getDoneHomeCnt();

	List<StaDTO> getSupplyTypeList();
	
	List<StaDTO> getlocList();
	
}
