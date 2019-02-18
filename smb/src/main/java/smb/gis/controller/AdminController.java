package smb.gis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.gavaghan.geodesy.Ellipsoid;
import org.gavaghan.geodesy.GeodeticCalculator;
import org.gavaghan.geodesy.GlobalPosition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import smb.common.dto.DtoBranch;
import smb.common.dto.DtoDeliveryStore;
import smb.common.dto.DtoMatchingList;
import smb.common.util.KaKaoAddrConvert;
import smb.gis.service.GisService;


@Controller
public class AdminController {
	
	Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Resource(name="gisService")
	private GisService gisService;
	
	@RequestMapping(value = "/admin/setBranchAddress.do", method = RequestMethod.GET)
	public ModelAndView setBranchAddress(@RequestParam("brand") String brand) throws Exception {
		
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("/initGis");
		
		// -----------------------------------------------------------------------------
		// Get Target Branch Data
		// -----------------------------------------------------------------------------
		List<DtoBranch> list_BranchList = gisService.getTargetBranchList(brand);
		
		
		// -----------------------------------------------------------------------------
		// KaKao GIS Convert & Insert
		// -----------------------------------------------------------------------------
		DtoBranch dto_branch = new DtoBranch();
		for(int i=0; i<list_BranchList.size(); i++){
			Map<String,String> result_map = new HashMap<String, String>();
			
			result_map = KaKaoAddrConvert.KakaoGisPoint(list_BranchList.get(i).getFull_addr());
			
			if(result_map.get("x") != null && result_map.get("y") != null){
				dto_branch.setBrand_name(brand);
				dto_branch.setBranch_id(list_BranchList.get(i).getBranch_id());
				dto_branch.setBranch_name(list_BranchList.get(i).getBranch_name());
				dto_branch.setLat(result_map.get("x"));
				dto_branch.setLng(result_map.get("y"));
				dto_branch.setFull_addr(result_map.get("full_addr"));
				dto_branch.setSi(result_map.get("si"));
				dto_branch.setGu(result_map.get("gu"));
				dto_branch.setDong(result_map.get("dong"));
				dto_branch.setFlag("Y");
			} else {
				dto_branch.setBrand_name(brand);
				dto_branch.setBranch_id(list_BranchList.get(i).getBranch_id());
				dto_branch.setBranch_name(list_BranchList.get(i).getBranch_name());
				dto_branch.setLat(result_map.get(""));
				dto_branch.setLng(result_map.get(""));
				dto_branch.setFull_addr(list_BranchList.get(i).getFull_addr());
				dto_branch.setSi("");
				dto_branch.setGu("");
				dto_branch.setDong("");
				dto_branch.setFlag("N");
			}
			
			if(!gisService.insertBranchConvertAddr(dto_branch).toString().equals("1")) {
				log.debug(dto_branch.getBranch_id() + " : DB Insert Fail");
			}
		}
		
		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
	
	
	@RequestMapping(value = "/admin/setBranchDistance.do", method = RequestMethod.GET)
	public ModelAndView setBranchDistance(@RequestParam("brand") String brand) throws Exception {
		
		// -----------------------------------------------------------------------------
		// New Return Object 
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("/initGis");
		
		// -----------------------------------------------------------------------------
		// DeliveryStore, Branch, Matching, UnMatching -> Get Data (List<Dto>)
		// -----------------------------------------------------------------------------
		List<DtoDeliveryStore>	list_deliveryStore	= gisService.getDeliveryStoreList();
		List<DtoBranch>			list_branch			= gisService.getBranchList(brand);
		
		DtoDeliveryStore dto_deliveryStore = null;
		DtoBranch dto_branch = null;
		
		for(int i=0; i<list_deliveryStore.size(); i++) {
			dto_deliveryStore = list_deliveryStore.get(i);
			
			for(int j=0; j<list_branch.size(); j++) {
				dto_branch = list_branch.get(j);

				double lat1 = Double.parseDouble(dto_deliveryStore.getLat());
				double lon1 = Double.parseDouble(dto_deliveryStore.getLng());
				double lat2 = Double.parseDouble(dto_branch.getLng());
				double lon2 = Double.parseDouble(dto_branch.getLat());
				
				// 좌표의 거리 구하기
				GeodeticCalculator geoCalc = new GeodeticCalculator();
		        Ellipsoid reference = Ellipsoid.WGS84;  
		        GlobalPosition pointA = new GlobalPosition(lat1, lon1, 0.0); // Point A
		        GlobalPosition userPos = new GlobalPosition(lat2, lon2, 0.0); // Point B
		        double dist = geoCalc.calculateGeodeticCurve(reference, userPos, pointA).getEllipsoidalDistance();
		        
//		        if(dist >= 1 && dist < 1001) {
		        if(dist < 3001) {
		        	
		        	DtoMatchingList dto_matchinglist = new DtoMatchingList();
		        	dto_matchinglist.setBrand_name(dto_branch.getBrand_name());
		        	dto_matchinglist.setBranch_id(dto_branch.getBranch_id());
		        	dto_matchinglist.setBranch_name(dto_branch.getBranch_name());
		        	dto_matchinglist.setStore_id(dto_deliveryStore.getStore_id());
		        	dto_matchinglist.setStore_name(dto_deliveryStore.getStore_name());
		        	dto_matchinglist.setDistance(String.valueOf(Math.round(dist)));
		        	
		        	gisService.insertMatchingData(dto_matchinglist);
		        	dto_matchinglist = null;
		        }
		        dto_branch = null;
			}
			dto_deliveryStore = null;
		}

		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
	
	private double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
	
	private double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }
	
}
