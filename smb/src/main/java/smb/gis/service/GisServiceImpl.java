package smb.gis.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import smb.common.dao.GisDao;
import smb.common.dto.DtoBranch;
import smb.common.dto.DtoDeliveryStore;
import smb.common.dto.DtoMatchingList;

@Service("gisService")
public class GisServiceImpl implements GisService
{
	Logger log = LoggerFactory.getLogger(GisServiceImpl.class);
	
	@Resource(name="gisDao")
	private GisDao gisDao;
	
	@Override
	public String getDeliveryCount() throws Exception {
		return gisDao.getDeliveryCount();
	}
	
	@Override
	public String getBranchCount(String brand) throws Exception {
		return gisDao.getBranchCount(brand);
	}
	
	@Override
	public List<DtoDeliveryStore> getDeliveryStoreList() throws Exception {
		return gisDao.getDeliveryStoreList();
	}
	
	@Override
	public List<DtoBranch> getBranchList(String brand) throws Exception {
		return gisDao.getBranchList(brand);
	}
	
	@Override
	public List<DtoMatchingList> getMatchingList(String distance, String brand) throws Exception {
		return gisDao.getMatchingList(distance, brand);
	}
	
	@Override
	public List<DtoMatchingList> getUnMatchingList(String distance, String brand) throws Exception {
		return gisDao.getUnMatchingList(distance, brand);
	}
	
	@Override
	public String getMatchingCount(String distance, String brand) throws Exception {
		return gisDao.getMatchingCount(distance, brand);
	}
	
	@Override
	public String getUnMatchingCount(String distance, String brand) throws Exception {
		return gisDao.getUnMatchingCount(distance, brand);
	}

	@Override
	public List<DtoDeliveryStore> getAreaCountList() throws Exception {
		return gisDao.getAreaCountList();
	}
	
	@Override
	public List<DtoBranch> getTargetBranchList(String brand) throws Exception {
		return gisDao.getTargetBranchList(brand);
	}
	
	@Override
	public Integer insertBranchConvertAddr(DtoBranch dto_branch) throws Exception {
		return gisDao.insertBranchConvertAddr(dto_branch);
	}
	
	@Override
	public Integer insertMatchingData(DtoMatchingList dto_matchinglist) throws Exception {
		return gisDao.insertMatchingData(dto_matchinglist);
	}
}
