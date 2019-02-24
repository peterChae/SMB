package smb.sales.dto;

import java.math.BigDecimal;

public class DtoSales {
	private String		work_id;
	private String		work_nm;
	private String		cmpy_id;
	private String		cmpy_nm;
	private String		brand_id;
	private String		brand_nm;
	private String		amt_year;
	private String		amt_month;
	private BigDecimal	sales_money;
	private BigDecimal	amt_money;
	private BigDecimal	amt_kakao_money;
	private BigDecimal	net_sales_money;
	private BigDecimal	refund_money;
	private Integer		perform_count;
	
	public String getWork_id() {
		return work_id;
	}
	public void setWork_id(String work_id) {
		this.work_id = work_id;
	}
	public String getWork_nm() {
		return work_nm;
	}
	public void setWork_nm(String work_nm) {
		this.work_nm = work_nm;
	}
	public String getCmpy_id() {
		return cmpy_id;
	}
	public void setCmpy_id(String cmpy_id) {
		this.cmpy_id = cmpy_id;
	}
	public String getCmpy_nm() {
		return cmpy_nm;
	}
	public void setCmpy_nm(String cmpy_nm) {
		this.cmpy_nm = cmpy_nm;
	}
	public String getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}
	public String getBrand_nm() {
		return brand_nm;
	}
	public void setBrand_nm(String brand_nm) {
		this.brand_nm = brand_nm;
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
	public BigDecimal getSales_money() {
		return sales_money;
	}
	public void setSales_money(BigDecimal sales_money) {
		this.sales_money = sales_money;
	}
	public BigDecimal getAmt_money() {
		return amt_money;
	}
	public void setAmt_money(BigDecimal amt_money) {
		this.amt_money = amt_money;
	}
	public BigDecimal getAmt_kakao_money() {
		return amt_kakao_money;
	}
	public void setAmt_kakao_money(BigDecimal amt_kakao_money) {
		this.amt_kakao_money = amt_kakao_money;
	}
	public BigDecimal getNet_sales_money() {
		return net_sales_money;
	}
	public void setNet_sales_money(BigDecimal net_sales_money) {
		this.net_sales_money = net_sales_money;
	}
	public BigDecimal getRefund_money() {
		return refund_money;
	}
	public void setRefund_money(BigDecimal refund_money) {
		this.refund_money = refund_money;
	}
	public Integer getPerform_count() {
		return perform_count;
	}
	public void setPerform_count(Integer perform_count) {
		this.perform_count = perform_count;
	}
}
