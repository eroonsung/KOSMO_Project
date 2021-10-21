package com.project.erp.DTO;


public class BoardDTO {
	//public class BoardVO{
	private int b_no;
	private String subject;
	private String writer;
	private String nickname;
	private String reg_date;
	private int readcount;
	private String content;
	private int com_no;
	private String pic;
	
	
	private String is_del;
	
	private String head_category_no;
	private String head_category_name;
	
	private String mem_no;

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getIs_del() {
		return is_del;
	}

	public void setIs_del(String is_del) {
		this.is_del = is_del;
	}

	public String getHead_category_no() {
		return head_category_no;
	}

	public void setHead_category_no(String head_category_no) {
		this.head_category_no = head_category_no;
	}

	public String getHead_category_name() {
		return head_category_name;
	}

	public void setHead_category_name(String head_category_name) {
		this.head_category_name = head_category_name;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public int getCom_no() {
		return com_no;
	}

	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}

	//===================================================

	
	

}
