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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import smb.common.util.AjaxResult;
import smb.sales.dto.DtoCostSales;
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
	
	
	
	@RequestMapping(value = "/SalesList.do", method = RequestMethod.GET)
	public ModelAndView SalesList() throws Exception {
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
	
	
	@RequestMapping(value = "/CostSalesList.do", method = RequestMethod.GET)
	public ModelAndView CostSalesList() throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("/sales/cost_sales_list");
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("costSalesList", salesService.getCostSalesList());

		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
	
	
	@RequestMapping(value = "/SalesInsertForm.do", method = RequestMethod.GET)
	public ModelAndView SalesInsertForm() throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("/sales/sales_insert");
		
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
	
	
	@RequestMapping(value = "/CostSalesInsertForm.do", method = RequestMethod.GET)
	public ModelAndView CostSalesInsertForm() throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("/sales/cost_sales_insert");
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("costList",  salesService.getCostList());

		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
	
	
	@RequestMapping(value = "/SalesUpdateForm.do", method = RequestMethod.GET)
	public ModelAndView SalesUpdateForm(@RequestParam("idx") String idx) throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("/sales/sales_update");
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("workList",  salesService.getWorkList());
		mv.addObject("cmpyList",  salesService.getCmpyList());
		mv.addObject("brandList", salesService.getBrandList());
		mv.addObject("salesData", salesService.getSalesData(idx));
		
		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}


	@RequestMapping(value = "/SalesInsert.do", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public AjaxResult SalesInsert(@ModelAttribute DtoSales dto_sales) throws Exception {
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
	
	

	@RequestMapping(value = "/CostSalesInsert.do", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public AjaxResult CostSalesInsert(@ModelAttribute DtoCostSales dto_cost_sales) throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		Map<String, Object> resultMap = new HashMap<String, Object>();
		AjaxResult ajaxResult = new AjaxResult();
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		int insertCount = 0;
		insertCount = salesService.insertCostSalesData(dto_cost_sales); 
		log.debug("insert sales data : " + insertCount);
		
		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		ajaxResult.setData(resultMap);
		return ajaxResult;
	}
	
	
	@RequestMapping(value = "/SalesUpdate.do", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public AjaxResult SalesUpdate(@ModelAttribute DtoSales dto_sales) throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		Map<String, Object> resultMap = new HashMap<String, Object>();
		AjaxResult ajaxResult = new AjaxResult();
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		int updateCount = 0;
		updateCount = salesService.updateSalesData(dto_sales); 
		log.debug("update sales data : " + updateCount);
		
		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		ajaxResult.setData(resultMap);
		return ajaxResult;
	}
	
	
	@RequestMapping(value = "/SalesDelete.do", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public AjaxResult SalesDelete(@RequestParam("idx") String idx) throws Exception {
		
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		Map<String, Object> resultMap = new HashMap<String, Object>();
		AjaxResult ajaxResult = new AjaxResult();
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		int deleteCount = 0;
		deleteCount = salesService.deleteSalesData(idx); 
		log.debug("delete sales data : " + deleteCount + "(" + idx + ")");
		
		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		ajaxResult.setData(resultMap);
		return ajaxResult;
	}
}
