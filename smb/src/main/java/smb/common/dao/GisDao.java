package smb.common.dao;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import smb.common.dto.DtoBranch;
import smb.common.dto.DtoDeliveryStore;
import smb.common.dto.DtoMatchingList;

@Repository("gisDao")
public class GisDao extends AbstractDao {
	Logger log = LoggerFactory.getLogger(GisDao.class);
	
	public String getDeliveryCount() throws Exception {
		return (String)selectOne("gis.deliveryCount");
	}
	
	public String getBranchCount(String brand) throws Exception {
		return (String)selectOne("gis.branchCount", brand);
	}
	
	public List<DtoDeliveryStore> getDeliveryStoreList() throws Exception {
		return (List<DtoDeliveryStore>)selectList("gis.getDeliveryStoreList");
	}
	
	public List<DtoBranch> getBranchList(String brand) throws Exception {
		return selectList("gis.getBranchList", brand);
	}
	
	public List<DtoMatchingList> getMatchingList(String distance, String brand) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("distance", distance);
		map.put("brand", brand);
		
		return selectList("gis.getMatchingList", map);
	}
	
	public List<DtoMatchingList> getUnMatchingList(String distance, String brand) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("distance", distance);
		map.put("brand", brand);

		return selectList("gis.getUnMatchingList", map);
	}
	
	public String getMatchingCount(String distance, String brand) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("distance", distance);
		map.put("brand", brand);

		return (String)selectOne("gis.getMatchingCount", map);
	}
	
	public String getUnMatchingCount(String distance, String brand) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("distance", distance);
		map.put("brand", brand);

		return (String)selectOne("gis.getUnMatchingCount", map);
	}
	
	public List<DtoDeliveryStore> getAreaCountList() throws Exception {
		return selectList("gis.getAreaCountList");
	}
	
	public List<DtoBranch> getTargetBranchList(String brand) throws Exception {
		return selectList("gis.getTargetBranchList", brand);
	}
	
	public Integer insertBranchConvertAddr(DtoBranch dto_branch) throws Exception {
		return (Integer)insert("gis.insertBranchConvertAddr", dto_branch);
	}

	public Integer insertMatchingData(DtoMatchingList dto_matchinglist) throws Exception {
		return (Integer)insert("gis.insertMatchingData", dto_matchinglist);
	}
}
