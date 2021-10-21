package com.project.erp.DTO;


public class StaDTO {
	
	private int loc_no;
	private String loc_name;
	private int loc_count;
	
	private int supply_type_no;
	private String supply_type_name;
	private int supply_count;
	
	public int getLoc_no() {
		return loc_no;
	}
	public void setLoc_no(int loc_no) {
		this.loc_no = loc_no;
	}
	public String getLoc_name() {
		return loc_name;
	}
	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}
	public int getLoc_count() {
		return loc_count;
	}
	public void setLoc_count(int loc_count) {
		this.loc_count = loc_count;
	}
	public int getSupply_type_no() {
		return supply_type_no;
	}
	public void setSupply_type_no(int supply_type_no) {
		this.supply_type_no = supply_type_no;
	}
	public String getSupply_type_name() {
		return supply_type_name;
	}
	public void setSupply_type_name(String supply_type_name) {
		this.supply_type_name = supply_type_name;
	}
	public int getSupply_count() {
		return supply_count;
	}
	public void setSupply_count(int supply_count) {
		this.supply_count = supply_count;
	}

}