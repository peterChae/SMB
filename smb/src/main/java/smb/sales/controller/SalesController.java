package smb.sales.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import smb.common.util.AjaxResult;
import smb.sales.dto.DtoSales;
import smb.sales.service.SalesService;

@Controller
public class SalesController {

	Logger log = LoggerFactory.getLogger(SalesController.class);
	
	@Resource(name="salesService")
	private SalesService salesService;
	
	
	@RequestMapping(value = "/sampleController.do", method = RequestMethod.GET)
	public ModelAndView sampleController() throws Exception {
		// -----------------------------------------------------------------------------
		// Base Type
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("sample");
		mv.addObject("return_obj", new String("test"));
		return mv;
		
		// -----------------------------------------------------------------------------
		// Base Type - Parameter Request
		// -----------------------------------------------------------------------------
		
		// 1. 
		// @RequestParam("work_id") String work_id,
		// @RequestParam("cmpy_id") String cmpy_id, ...
		
		// 2. 
		// HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// request.getRequestParam("work_id");
		
		// 3. 
		// @ModelAttribute DtoSales dto_sales

	}
	
	
	
	@RequestMapping(value = "/initSales.do", method = RequestMethod.GET)
	public ModelAndView initSales() throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("/sales/sales_list");
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("salesList", salesService.getSalesList());

		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
	
	
	@RequestMapping(value = "/insSales.do", method = RequestMethod.GET)
	public ModelAndView insSales() throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("/sales/sales_register");
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("workList",  salesService.getWorkList());
		mv.addObject("cmpyList",  salesService.getCmpyList());
		mv.addObject("brandList", salesService.getBrandList());

		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}


	@RequestMapping(value = "/insertSales.do", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public AjaxResult insertSales(@ModelAttribute DtoSales dto_sales) throws Exception {
		
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		Map<String, Object> resultMap = new HashMap<String, Object>();
		AjaxResult ajaxResult = new AjaxResult();
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		int insertCount = 0;
		insertCount = salesService.insertSalesData(dto_sales); 
		log.debug("insert sales data : " + insertCount);
		
		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		ajaxResult.setData(resultMap);
		return ajaxResult;
	}
}
