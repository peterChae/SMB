package smb.gis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import smb.common.util.AjaxResult;
import smb.gis.dto.DtoBranch;
import smb.gis.dto.DtoDeliveryStore;
import smb.gis.dto.DtoMatchingList;
import smb.gis.dto.DtoUser;
import smb.gis.service.GisService;

@Controller
public class GisController {
	
	Logger log = LoggerFactory.getLogger(GisController.class);
	
	@Resource(name="gisService")
	private GisService gisService;
	
	@RequestMapping(value = "/initGis.do", method = RequestMethod.GET)
	public String initGis(@RequestParam("brand") String brand) throws Exception {
		
		// -----------------------------------------------------------------------------
		// Redirect Return
		// -----------------------------------------------------------------------------
		if(brand.toLowerCase().equals("burgerking"))
			return "redirect:BurgerKing.do";
		else if(brand.toLowerCase().equals("droptop"))
			return "redirect:DropTop.do";
		else if(brand.toLowerCase().equals("quiznos"))
			return "redirect:Quiznos.do";
		else if(brand.toLowerCase().equals("norang"))
			return "redirect:Norang.do";
		else if(brand.toLowerCase().equals("meagcoffee"))
			return "redirect:MeagCoffee.do";
		else
			return "gis/main";
	}
	
	@RequestMapping(value = "/Quiznos.do", method = RequestMethod.GET)
	public ModelAndView Quiznos() throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("gis/gis_main");
		String brand = "QUIZNOS";
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("brand", brand);
		mv.addObject("deliveryCount", gisService.getDeliveryCount());
		mv.addObject("branchCount", gisService.getBranchCount(brand));

		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
	
	@RequestMapping(value = "/MegaCoffee.do", method = RequestMethod.GET)
	public ModelAndView MegaCoffee() throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("gis/gis_main");
		String brand = "MegaCoffee";
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("brand", brand);
		mv.addObject("deliveryCount", gisService.getDeliveryCount());
		mv.addObject("branchCount", gisService.getBranchCount(brand));

		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
	
	
	@RequestMapping(value = "/Norang.do", method = RequestMethod.GET)
	public ModelAndView Norang() throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("gis/gis_main");
		String brand = "NORANG";
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("brand", brand);
		mv.addObject("deliveryCount", gisService.getDeliveryCount());
		mv.addObject("branchCount", gisService.getBranchCount(brand));

		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}

	
	@RequestMapping(value = "/BurgerKing.do", method = RequestMethod.GET)
	public ModelAndView BurgerKing() throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("gis/gis_main");
		String brand = "BurgerKing";
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("brand", brand);
		mv.addObject("deliveryCount", gisService.getDeliveryCount());
		mv.addObject("branchCount", gisService.getBranchCount(brand));

		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
	
	@RequestMapping(value = "/DropTop.do", method = RequestMethod.GET)
	public ModelAndView DropTop() throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("gis/gis_main");
		String brand = "DropTop";
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("brand", brand);
		mv.addObject("deliveryCount", gisService.getDeliveryCount());
		mv.addObject("branchCount", gisService.getBranchCount(brand));

		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
	
	@RequestMapping(value = "/gis/getDeliveryArea.do", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public AjaxResult getDeliveryArea(String distance, String brand) throws Exception {
		
		// -----------------------------------------------------------------------------
		// New Return Object 
		// -----------------------------------------------------------------------------
		Map<String, Object> resultMap = new HashMap<String, Object>();
		AjaxResult ajaxResult = new AjaxResult();
		
		// -----------------------------------------------------------------------------
		// DeliveryStore, Branch, Matching, UnMatching -> Get Data (List<Dto>)
		// -----------------------------------------------------------------------------
		List<DtoDeliveryStore>	list_deliveryStore	= gisService.getDeliveryStoreList();
		List<DtoBranch>			list_branch			= gisService.getBranchList(brand);
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		resultMap.put("distance", distance);	
		resultMap.put("DeliveryStoreList", list_deliveryStore);
		resultMap.put("BranchList", list_branch);
		resultMap.put("countMatchingBranch", gisService.getMatchingCount(distance, brand));
		resultMap.put("countUnMatchingBranch", gisService.getUnMatchingCount(distance, brand));
		
		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		ajaxResult.setData(resultMap);
		return ajaxResult;
	}
	
	
	@RequestMapping(value = "/gis/getAreaCountList.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getAreaCountList() throws Exception {
		
		// -----------------------------------------------------------------------------
		// New Return Object 
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("gis/pop_DeliveryStoreList");
		List<DtoDeliveryStore> list_areaCount = gisService.getAreaCountList();
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("areaCountMap", list_areaCount);
		
		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
	
	
	@RequestMapping(value = "/gis/getMatchingList.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getMatchingList(@RequestParam("distance") String distance, 
										@RequestParam("brand") String brand) throws Exception {

		// -----------------------------------------------------------------------------
		// New Return Object 
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("gis/pop_MatchingList");
		List<DtoMatchingList> list_matchingList = gisService.getMatchingList(distance, brand);
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("matchingList", list_matchingList);
		
		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
	
	@RequestMapping(value = "/gis/getUnMatchingList.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getUnMatchingList(@RequestParam("distance") String distance, @RequestParam("brand") String brand) throws Exception {

		// -----------------------------------------------------------------------------
		// New Return Object 
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("gis/pop_UnMatchingList");
		List<DtoMatchingList> list_unMatchingList = gisService.getUnMatchingList(distance, brand);
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("unMatchingList", list_unMatchingList);
		
		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
}
