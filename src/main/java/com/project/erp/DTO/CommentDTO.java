package com.project.erp.DTO;


public class CommentDTO {
	
	private int com_no;
	private int b_no;
	private int mem_no;
	private String com_contents;
	private String com_reg_date;
	private int group_no;
	private int print_no;
	private int print_level;
	
	private int selectPageNo=1; //유저가 선택한 페이지번호가 저장되는 속성변수, 반드시 디폴트값이 있어야 DB연동시 에러가 없음
	private int rowCntPerPage=5; //한화면에 보여줄 행의 개수가 저장되는 속성변수
	
	
	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getCom_contents() {
		return com_contents;
	}
	public void setCom_contents(String com_contents) {
		this.com_contents = com_contents;
	}
	public String getCom_reg_date() {
		return com_reg_date;
	}
	public void setCom_reg_date(String com_reg_date) {
		this.com_reg_date = com_reg_date;
	}
	public int getGroup_no() {
		return group_no;
	}
	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}
	public int getPrint_no() {
		return print_no;
	}
	public void setPrint_no(int print_no) {
		this.print_no = print_no;
	}
	public int getPrint_level() {
		return print_level;
	}
	public void setPrint_level(int print_level) {
		this.print_level = print_level;
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
