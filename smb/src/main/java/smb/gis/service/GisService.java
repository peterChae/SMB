package smb.gis.service;

import java.util.List;

import smb.common.dto.DtoBranch;
import smb.common.dto.DtoDeliveryStore;
import smb.common.dto.DtoMatchingList;
import smb.common.dto.DtoUser;

public interface GisService {
	
	/**
	 * GisContoller - initGis 
	 */
	String getDeliveryCount() throws Exception;
	String getBranchCount(String brand) throws Exception;
	
	/**
	 * GisContoller - getDeliveryArea 
	 */
	List<DtoDeliveryStore> getDeliveryStoreList() throws Exception;
	List<DtoBranch> getBranchList(String brand) throws Exception;
	List<DtoMatchingList> getMatchingList(String distance, String brand) throws Exception;
	List<DtoMatchingList> getUnMatchingList(String distance, String brand) throws Exception;
	
	String getMatchingCount(String distance, String brand) throws Exception; 
	String getUnMatchingCount(String distance, String brand) throws Exception;
	
	/**
	 * GisController - getDeliveryStoreList 
	 */
	List<DtoDeliveryStore> getAreaCountList() throws Exception;

	/**
	 * GisController - setBranchAddress
	 */
	List<DtoBranch> getTargetBranchList(String brand) throws Exception;
	Integer insertBranchConvertAddr(DtoBranch dto_branch) throws Exception;
	
	/**
	 * GisController - setBranchDistance
	 */
	Integer insertMatchingData(DtoMatchingList dto_matchinglist) throws Exception;
	
	
	DtoUser getUserInfo() throws Exception;
}
