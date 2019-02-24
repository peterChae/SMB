package smb.sales.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import smb.common.dao.AbstractDao;
import smb.sales.dto.DtoBrand;
import smb.sales.dto.DtoCompany;
import smb.sales.dto.DtoSales;
import smb.sales.dto.DtoWork;

@Repository("salesDao")
public class SalesDao extends AbstractDao  {
	
	Logger log = LoggerFactory.getLogger(SalesDao.class);
	
	public List<DtoSales> getSalesList() throws Exception {
		return (List<DtoSales>)selectList("sales.getSalesList");
	}
	
	public List<DtoWork> getWorkList() throws Exception {
		return (List<DtoWork>)selectList("sales.getWorkList");
	}
	
	public List<DtoCompany> getCmpyList() throws Exception {
		return (List<DtoCompany>)selectList("sales.getCmpyList");
	}
	
	public List<DtoBrand> getBrandList() throws Exception {
		return (List<DtoBrand>)selectList("sales.getBrandList");
	}
}
