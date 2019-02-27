package smb.sales.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import smb.common.dao.AbstractDao;
import smb.sales.dto.DtoSalesReport;

@Repository("salesReportDao")
public class SalesReportDao extends AbstractDao  {
	
	Logger log = LoggerFactory.getLogger(SalesReportDao.class);
	
	@SuppressWarnings("unchecked")
	public List<DtoSalesReport> getSalesReport(String amt_year) throws Exception {
		return (List<DtoSalesReport>)selectList("sales_report.getSalesReport", amt_year);
	}

	@SuppressWarnings("unchecked")
	public List<DtoSalesReport> getSalesReport_Company(String amt_year) throws Exception {
		return (List<DtoSalesReport>)selectList("sales_report.getSalesReport_Company", amt_year);
	}

	@SuppressWarnings("unchecked")
	public List<DtoSalesReport> getSalesReport_Brand(String amt_year) throws Exception {
		return (List<DtoSalesReport>)selectList("sales_report.getSalesReport_Brand", amt_year);
	}
}
