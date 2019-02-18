package smb.sales.service;

import java.util.List;

import smb.common.dto.DtoSales;

public interface SalesService {
	public List<DtoSales> getSalesList() throws Exception;
}
