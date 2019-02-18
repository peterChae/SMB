package smb.common.dto;

public class DtoMatchingList {
	private String brand_name;
	private String branch_id;
	private String branch_name;
	private String store_id;
	private String store_name;
	private String full_addr;
	private String distance;
	private String matching_count;
	
	public String getMatching_count() {
		return matching_count;
	}
	public void setMatching_count(String matching_count) {
		this.matching_count = matching_count;
	}
	public String getFull_addr() {
		return full_addr;
	}
	public void setFull_addr(String full_addr) {
		this.full_addr = full_addr;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(String branch_id) {
		this.branch_id = branch_id;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
}
