package smb.gis.dto;

import java.io.Serializable;

public class DtoBranch implements Serializable {

	protected static final long serialVersionUID = 7024620274917574870L;
	
	private String brand_name;
	private String branch_id;
	private String branch_name;
	private String full_addr;
	private String si;
	private String gu;
	private String dong;
	private String bunji;
	private String doro_nm;
	private String bul_no;
	private String lat;
	private String lng;
	private String flag;
	
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
	public String getFull_addr() {
		return full_addr;
	}
	public void setFull_addr(String full_addr) {
		this.full_addr = full_addr;
	}
	public String getSi() {
		return si;
	}
	public void setSi(String si) {
		this.si = si;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	public String getDoro_nm() {
		return doro_nm;
	}
	public void setDoro_nm(String doro_nm) {
		this.doro_nm = doro_nm;
	}
	public String getBul_no() {
		return bul_no;
	}
	public void setBul_no(String bul_no) {
		this.bul_no = bul_no;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}