package com.project.erp.DTO;


import java.util.List;

public class MyHomeSearchDTO {
	private String complex_name; // 키워드가 저장될 속성변수
	private String loc_no;
	private String loc_detail_no;
	private List<String> supply_type_no;
	private String area_grade_no;
	private String head_category;
	
	private String state;
	private String rent_deposit;
	private String move_date;
	//에러 방지를 위해 default값을 먼저 주고 시작
	//location.reaplace로 처음 들어올때 아무런 파라미터도 가지고 오지 않기 때문에
	//처음에 아무것도 검색이 되지 않음 그렇기 때문에 default값을 넣어주어야함
	private int selectPageNo=1; //유저가 선택한 페이지번호가 저장되는 속성변수, 반드시 디폴트값이 있어야 DB연동시 에러가 없음
	private int rowCntPerPage=10;//한화면에 보여줄 행의 개수가 저장되는 속성변수
	public String getComplex_name() {
		return complex_name;
	}
	public void setComplex_name(String complex_name) {
		this.complex_name = complex_name;
	}
	public String getLoc_no() {
		return loc_no;
	}
	public void setLoc_no(String loc_no) {
		this.loc_no = loc_no;
	}
	public String getLoc_detail_no() {
		return loc_detail_no;
	}
	public void setLoc_detail_no(String loc_detail_no) {
		this.loc_detail_no = loc_detail_no;
	}
	public List<String> getSupply_type_no() {
		return supply_type_no;
	}
	public void setSupply_type_no(List<String> supply_type_no) {
		this.supply_type_no = supply_type_no;
	}
	public String getArea_grade_no() {
		return area_grade_no;
	}
	public void setArea_grade_no(String area_grade_no) {
		this.area_grade_no = area_grade_no;
	}
	public String getHead_category() {
		return head_category;
	}
	public void setHead_category(String head_category) {
		this.head_category = head_category;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRent_deposit() {
		return rent_deposit;
	}
	public void setRent_deposit(String rent_deposit) {
		this.rent_deposit = rent_deposit;
	}
	public String getMove_date() {
		return move_date;
	}
	public void setMove_date(String move_date) {
		this.move_date = move_date;
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
