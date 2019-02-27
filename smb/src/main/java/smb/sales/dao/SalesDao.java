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
	
	@SuppressWarnings("unchecked")
	public List<DtoSales> getSalesList() throws Exception {
		return (List<DtoSales>)selectList("sales.getSalesList");
	}

	public DtoSales getSalesData(String idx) throws Exception {
		return (DtoSales)selectOne("sales.getSalesData", idx);
	}

	@SuppressWarnings("unchecked")
	public List<DtoWork> getWorkList() throws Exception {
		return (List<DtoWork>)selectList("sales.getWorkList");
	}
	
	@SuppressWarnings("unchecked")
	public List<DtoCompany> getCmpyList() throws Exception {
		return (List<DtoCompany>)selectList("sales.getCmpyList");
	}
	
	@SuppressWarnings("unchecked")
	public List<DtoBrand> getBrandList() throws Exception {
		return (List<DtoBrand>)selectList("sales.getBrandList");
	}

	public Integer insertSalesData(DtoSales dto_sales) throws Exception {
		return (Integer)insert("sales.insertSalesData", dto_sales);
	}

	public Integer updateSalesData(DtoSales dto_sales) throws Exception {
		return (Integer)update("sales.updateSalesData", dto_sales);
	}

	public Integer deleteSalesData(String idx) throws Exception {
		return (Integer)delete("sales.deleteSalesData", idx);
	}
	
}
