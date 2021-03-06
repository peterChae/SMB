package smb.sales.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import smb.sales.dao.SalesDao;
import smb.sales.dto.DtoBrand;
import smb.sales.dto.DtoCompany;
import smb.sales.dto.DtoCost;
import smb.sales.dto.DtoCostSales;
import smb.sales.dto.DtoSales;
import smb.sales.dto.DtoWork;

@Service("salesService")
public class SalesServiceImpl implements SalesService {

	Logger log = LoggerFactory.getLogger(SalesServiceImpl.class);
	
	@Resource(name="salesDao")
	private SalesDao salesDao;

	@Override
	public List<DtoSales> getSalesList() throws Exception {
		return salesDao.getSalesList();
	}

	@Override
	public DtoSales getSalesData(String idx) throws Exception {
		return salesDao.getSalesData(idx);
	}

	@Override
	public List<DtoWork> getWorkList() throws Exception {
		return salesDao.getWorkList();
	}
	
	@Override
	public List<DtoCompany> getCmpyList() throws Exception {
		return salesDao.getCmpyList();
	}
	
	@Override
	public List<DtoBrand> getBrandList() throws Exception {
		return salesDao.getBrandList();
	}
	
	@Override
	public Integer insertSalesData(DtoSales dto_sales) throws Exception {
		return salesDao.insertSalesData(dto_sales);
	}
	
	@Override
	public Integer updateSalesData(DtoSales dto_sales) throws Exception {
		return salesDao.updateSalesData(dto_sales);
	}

	@Override
	public Integer deleteSalesData(String idx) throws Exception {
		return salesDao.deleteSalesData(idx);
	}
	
	@Override
	public List<DtoCostSales> getCostSalesList() throws Exception {
		return salesDao.getCostSalesList();
	}
	
	@Override
	public List<DtoCost> getCostList() throws Exception {
		return salesDao.getCostList();
	}
	
	@Override
	public Integer insertCostSalesData(DtoCostSales dto_cost_sales) throws Exception {
		return salesDao.insertCostSalesData(dto_cost_sales);
	}

}
