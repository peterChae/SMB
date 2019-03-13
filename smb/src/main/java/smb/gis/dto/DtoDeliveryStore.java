package smb.gis.dto;

import java.io.Serializable;

public class DtoDeliveryStore implements Serializable {
	
	private String store_id;
	private String store_name;
	private String full_addr;
	private String si;
	private String gu;
	private String dong;
	private String flag;
	private String lat;
	private String lng;
	private String count;
	
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getCount() {
		return this.count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
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
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
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

}

