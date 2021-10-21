package com.project.erp.DAO;

import java.util.List;
import java.util.Map;

import com.project.erp.DTO.BoardDTO;
import com.project.erp.DTO.BoardSearchDTO;
import com.project.erp.DTO.MyHomeDTO;
import com.project.erp.DTO.MyHomeSearchDTO;

public interface MyHomeDAO {

	List<MyHomeDTO> getLocationList();

	List<MyHomeDTO> getLoc_detailList(String xxx);

	List<MyHomeDTO> getSupply_typeList();

	List<MyHomeDTO> getArea_gradeList();

	int getRentalListAllCnt(MyHomeSearchDTO myHomeSearchDTO);

	List<Map<String, String>> getRentalList(MyHomeSearchDTO myHomeSearchDTO);

	MyHomeDTO getMyHome(int rental_detail_no);

	List<MyHomeDTO> getSameComplexList(int rental_detail_no);

	
	int deleteMyHome(MyHomeDTO myHomeDTO);

	int updateRental(MyHomeDTO myHomeDTO);

	int updateRentalDetail(MyHomeDTO myHomeDTO);

	List<MyHomeDTO> getFirst_detailList();






}
