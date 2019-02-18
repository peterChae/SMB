package smb.sales.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import smb.common.dao.SalesDao;
import smb.common.dto.DtoSales;
import smb.gis.service.GisServiceImpl;

@Service("salesService")
public class SalesServiceImpl implements SalesService {

	Logger log = LoggerFactory.getLogger(GisServiceImpl.class);
	
	@Resource(name="salesDao")
	private SalesDao salesDao;

	@Override
	public List<DtoSales> getSalesList() throws Exception {
		return salesDao.getSalesList();
	}

}
