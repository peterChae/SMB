package smb.sales.dto;

import java.math.BigDecimal;

public class DtoCostSales {

	private String idx;
	private String cost_id;
	private String cost_cate_nm;
	private String cost_nm;
	private String amt_year;
	private String amt_month;
	private BigDecimal cost_money;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getCost_id() {
		return cost_id;
	}
	public void setCost_id(String cost_id) {
		this.cost_id = cost_id;
	}
	public String getCost_cate_nm() {
		return cost_cate_nm;
	}
	public void setCost_cate_nm(String cost_cate_nm) {
		this.cost_cate_nm = cost_cate_nm;
	}
	public String getCost_nm() {
		return cost_nm;
	}
	public void setCost_nm(String cost_nm) {
		this.cost_nm = cost_nm;
	}
	public String getAmt_year() {
		return amt_year;
	}
	public void setAmt_year(String amt_year) {
		this.amt_year = amt_year;
	}
	public String getAmt_month() {
		return amt_month;
	}
	public void setAmt_month(String amt_month) {
		this.amt_month = amt_month;
	}
	public BigDecimal getCost_money() {
		return cost_money.setScale(0);
	}
	public void setCost_money(BigDecimal cost_money) {
		this.cost_money = cost_money;
	}
}
