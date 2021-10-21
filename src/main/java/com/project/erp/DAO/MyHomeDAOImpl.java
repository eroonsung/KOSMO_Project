package com.project.erp.DAO;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.erp.DTO.BoardDTO;
import com.project.erp.DTO.MyHomeDTO;
import com.project.erp.DTO.MyHomeSearchDTO;


@Repository
public class MyHomeDAOImpl implements MyHomeDAO {

	
	//------------------------------------
	@Autowired
	private SqlSessionTemplate sqlSession;
	//------------------------------------

	@Override
	public List<MyHomeDTO> getLocationList() {
		List<MyHomeDTO> loc_noList = this.sqlSession.selectList(
				"com.project.erp.DAO.MyHomeDAO.getLocationList"
				);
		return loc_noList;
				
	}

	@Override
	public List<MyHomeDTO> getLoc_detailList(String xxx) {
		List<MyHomeDTO> loc_DetailList = this.sqlSession.selectList(
				"com.project.erp.DAO.MyHomeDAO.getLoc_detailList"
				,xxx
				);
		return loc_DetailList;
	}

	@Override
	public List<MyHomeDTO> getSupply_typeList() {
		List<MyHomeDTO> supply_typeList = this.sqlSession.selectList(
				"com.project.erp.DAO.MyHomeDAO.getSupply_typeList"
				);
		return supply_typeList;
	}

	@Override
	public List<MyHomeDTO> getArea_gradeList() {
		List<MyHomeDTO> area_gradeList = this.sqlSession.selectList(
				"com.project.erp.DAO.MyHomeDAO.getArea_gradeList"
				);
		return area_gradeList;
	}

	@Override
	public int getRentalListAllCnt(MyHomeSearchDTO myHomeSearchDTO) {
		int rentalListAllCnt = this.sqlSession.selectOne(
				"com.project.erp.DAO.MyHomeDAO.getRentalListAllCnt"
				, myHomeSearchDTO
				);
		return rentalListAllCnt;
	}

	@Override
	public List<Map<String, String>> getRentalList(MyHomeSearchDTO myHomeSearchDTO) {
		List<Map<String,String>> rentalList = this.sqlSession.selectList(
				"com.project.erp.DAO.MyHomeDAO.getRentalList"
				,myHomeSearchDTO
			);
		return rentalList;
	}

	@Override
	public MyHomeDTO getMyHome(int rental_detail_no) {
		MyHomeDTO myHomeDTO = this.sqlSession.selectOne(
				"com.project.erp.DAO.MyHomeDAO.getMyHome"	// 실행할 SQL 구문의 위치 지정
				,rental_detail_no								// 실행할 SQL 구문에서 사용할 데이터 지정
			);
	
		return myHomeDTO;
	}

	@Override
	public List<MyHomeDTO> getSameComplexList(int rental_detail_no) {
		List<MyHomeDTO> sameComplexList = this.sqlSession.selectList(
				"com.project.erp.DAO.MyHomeDAO.getSameComplexList"
				,rental_detail_no
				);
		return sameComplexList;
	}

	

	@Override
	public int deleteMyHome(MyHomeDTO myHomeDTO) {
		int myHomeUpDelCnt = this.sqlSession.update(
				"com.project.erp.DAO.MyHomeDAO.deleteMyHome"
				,myHomeDTO
				);
		System.out.println(myHomeUpDelCnt);
		return myHomeUpDelCnt;
	}

	@Override
	public int updateRental(MyHomeDTO myHomeDTO) {
		int updateRentalCnt = this.sqlSession.update(
				"com.project.erp.DAO.MyHomeDAO.updateRental"
				,myHomeDTO
			);
		return updateRentalCnt;
	}

	@Override
	public int updateRentalDetail(MyHomeDTO myHomeDTO) {
		int updateRentalDetailCnt = this.sqlSession.update(
				"com.project.erp.DAO.MyHomeDAO.updateRentalDetail"
				,myHomeDTO
			);
		return updateRentalDetailCnt;
	}

	@Override
	public List<MyHomeDTO> getFirst_detailList() {
		List<MyHomeDTO> firstLoc_DetailList = this.sqlSession.selectList(
				"com.project.erp.DAO.MyHomeDAO.getFirst_detailList"
				);
		return firstLoc_DetailList;
	}




	
}
