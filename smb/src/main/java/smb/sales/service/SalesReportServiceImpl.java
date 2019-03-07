package smb.sales.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import smb.sales.dao.SalesReportDao;
import smb.sales.dto.DtoSalesReport;

@Service("salesReportService")
public class SalesReportServiceImpl implements SalesReportService {

	Logger log = LoggerFactory.getLogger(SalesReportServiceImpl.class);
	
	@Resource(name="salesReportDao")
	private SalesReportDao salesReportDao;

	@Override
	public List<DtoSalesReport> getSalesReport(String amt_year) throws Exception {
		
		// --------------------------------------------------------------------
		// 1. Delete Temp Table Data
		// --------------------------------------------------------------------
		if(salesReportDao.deleteSalesReportTempData(amt_year) < 0) {
			log.debug("Sales Report Temp Data Delete Error");
		}
		
		// --------------------------------------------------------------------
		// 2. Insert Temp Table Data
		// --------------------------------------------------------------------
		if(salesReportDao.insertSalesReportTempData(amt_year) < 0) {
			log.debug("Sales Report Temp Data Insert Error");
		}
		
		// --------------------------------------------------------------------
		// 3. Select Sales Report
		// --------------------------------------------------------------------
		List<DtoSalesReport> list = salesReportDao.getSalesReport();
		
		// --------------------------------------------------------------------
		// 4. Delete Temp Table Data
		// --------------------------------------------------------------------
		if(salesReportDao.deleteSalesReportTempData(amt_year) < 0) {
			log.debug("Sales Report Temp Data Delete Error");
		}

		return list;
	}

	@Override
	public List<DtoSalesReport> getSalesReport_Cost(String amt_year) throws Exception {
		return salesReportDao.getSalesReport_Cost(amt_year);
	}
	
	@Override
	public List<DtoSalesReport> getSalesReport_Work(String amt_year) throws Exception {
		return salesReportDao.getSalesReport_Work(amt_year);
	}

	@Override
	public List<DtoSalesReport> getSalesReport_Company(String amt_year) throws Exception {
		return salesReportDao.getSalesReport_Company(amt_year);
	}

	@Override
	public List<DtoSalesReport> getSalesReport_Brand(String amt_year) throws Exception {
		return salesReportDao.getSalesReport_Brand(amt_year);
	}
	
	
	@Override
	public List<DtoSalesReport> getPerformRate(String amt_year) throws Exception {
		return salesReportDao.getPerformRate(amt_year);
	}
}
