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
		return salesReportDao.getSalesReport(amt_year);
	}

	@Override
	public List<DtoSalesReport> getSalesReport_Company(String amt_year) throws Exception {
		return salesReportDao.getSalesReport_Company(amt_year);
	}

	@Override
	public List<DtoSalesReport> getSalesReport_Brand(String amt_year) throws Exception {
		return salesReportDao.getSalesReport_Brand(amt_year);
	}
}
