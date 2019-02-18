package smb.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import smb.common.dto.DtoSales;

@Repository("salesDao")
public class SalesDao extends AbstractDao  {
	public List<DtoSales> getSalesList() throws Exception {
		return (List<DtoSales>)selectList("sales.getSalesList");
	}
}
