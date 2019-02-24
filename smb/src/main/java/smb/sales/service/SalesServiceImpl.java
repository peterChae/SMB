package smb.sales.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import smb.gis.service.GisServiceImpl;
import smb.sales.dao.SalesDao;
import smb.sales.dto.DtoBrand;
import smb.sales.dto.DtoCompany;
import smb.sales.dto.DtoSales;
import smb.sales.dto.DtoWork;

@Service("salesService")
public class SalesServiceImpl implements SalesService {

	Logger log = LoggerFactory.getLogger(GisServiceImpl.class);
	
	@Resource(name="salesDao")
	private SalesDao salesDao;

	@Override
	public List<DtoSales> getSalesList() throws Exception {
		return salesDao.getSalesList();
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

}
