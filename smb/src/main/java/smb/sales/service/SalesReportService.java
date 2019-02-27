package smb.sales.service;

import java.util.List;

import smb.sales.dto.DtoSalesReport;

public interface SalesReportService {
	public List<DtoSalesReport> getSalesReport(String amt_year) throws Exception;
	public List<DtoSalesReport> getSalesReport_Company(String amt_year) throws Exception;
	public List<DtoSalesReport> getSalesReport_Brand(String amt_year) throws Exception;
}
