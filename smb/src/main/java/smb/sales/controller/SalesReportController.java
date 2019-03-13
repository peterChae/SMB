package smb.sales.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import smb.common.util.AjaxResult;
import smb.sales.service.SalesReportService;

@Controller
public class SalesReportController {

	Logger log = LoggerFactory.getLogger(SalesReportController.class);
	
	@Resource(name="salesReportService")
	private SalesReportService salesReportService;
	
	@RequestMapping(value = "/SalesReport.do", method = RequestMethod.GET)
	public ModelAndView SalesReport(@RequestParam("amt_year") String amt_year) throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("/sales/sales_report");
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		mv.addObject("amt_year", amt_year);
		mv.addObject("salesReport", salesReportService.getSalesReport(amt_year));
		mv.addObject("salesReport_cost", salesReportService.getSalesReport_Cost(amt_year));
		mv.addObject("salesReport_work", salesReportService.getSalesReport_Work(amt_year));
		mv.addObject("salesReport_company", salesReportService.getSalesReport_Company(amt_year));
		mv.addObject("salesReport_brand", salesReportService.getSalesReport_Brand(amt_year));
		
		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
	
	
	@RequestMapping(value = "/getPerformRate.do", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public AjaxResult getPerformRate(@RequestParam("amt_year") String amt_year) throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		Map<String, Object> resultMap = new HashMap<String, Object>();
		AjaxResult ajaxResult = new AjaxResult();
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		resultMap.put("performRate_list", salesReportService.getPerformRate(amt_year));
		
		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		ajaxResult.setData(resultMap);
		return ajaxResult;
	}
	
	
	@RequestMapping(value = "/SmbReport.do", method = RequestMethod.GET)
	public ModelAndView SmbReport() throws Exception {
		// -----------------------------------------------------------------------------
		// New Return Object
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("/sales/smb_report");
		
		// -----------------------------------------------------------------------------
		// Return Object Data Setting
		// -----------------------------------------------------------------------------
		String amt_year = "2019";
		
		mv.addObject("amt_year", amt_year);
		mv.addObject("salesReport", salesReportService.getSalesReport(amt_year));
		mv.addObject("salesReport_cost", salesReportService.getSalesReport_Cost(amt_year));
		mv.addObject("salesReport_work", salesReportService.getSalesReport_Work(amt_year));
		mv.addObject("salesReport_company", salesReportService.getSalesReport_Company(amt_year));
		mv.addObject("salesReport_brand", salesReportService.getSalesReport_Brand(amt_year));

		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
}
