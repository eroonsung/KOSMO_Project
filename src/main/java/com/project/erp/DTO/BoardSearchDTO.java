package com.project.erp.DTO;


import java.util.List;

public class BoardSearchDTO {
	private String keyword1; // 키워드가 저장될 속성변수
	
	private String head_category;
	
	private String searchStandard;
	
	
	//에러 방지를 위해 default값을 먼저 주고 시작
	//location.reaplace로 처음 들어올때 아무런 파라미터도 가지고 오지 않기 때문에
	//처음에 아무것도 검색이 되지 않음 그렇기 때문에 default값을 넣어주어야함
	private int selectPageNo=1; //유저가 선택한 페이지번호가 저장되는 속성변수, 반드시 디폴트값이 있어야 DB연동시 에러가 없음
	private int rowCntPerPage=10;//한화면에 보여줄 행의 개수가 저장되는 속성변수
	
	
	
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getHead_category() {
		return head_category;
	}
	public void setHead_category(String head_category) {
		this.head_category = head_category;
	}
	public String getSearchStandard() {
		return searchStandard;
	}
	public void setSearchStandard(String searchStandard) {
		this.searchStandard = searchStandard;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	

}
