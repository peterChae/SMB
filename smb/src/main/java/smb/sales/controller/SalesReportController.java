package smb.sales.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		mv.addObject("salesReport_work", salesReportService.getSalesReport(amt_year));
		mv.addObject("salesReport_company", salesReportService.getSalesReport_Company(amt_year));
		mv.addObject("salesReport_brand", salesReportService.getSalesReport_Brand(amt_year));

		// -----------------------------------------------------------------------------
		// Return 
		// -----------------------------------------------------------------------------
		return mv;
	}
}
