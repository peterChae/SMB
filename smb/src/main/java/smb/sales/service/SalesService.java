package smb.sales.service;

import java.util.List;

import smb.sales.dto.DtoBrand;
import smb.sales.dto.DtoCompany;
import smb.sales.dto.DtoSales;
import smb.sales.dto.DtoWork;

public interface SalesService {
	public List<DtoSales> getSalesList() throws Exception;
	
	public List<DtoWork> getWorkList() throws Exception;
	public List<DtoCompany> getCmpyList() throws Exception;
	public List<DtoBrand> getBrandList() throws Exception;
}
