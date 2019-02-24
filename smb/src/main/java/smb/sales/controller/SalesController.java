package smb.sales.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import smb.sales.service.SalesService;

@Controller
public class SalesController {

	Logger log = LoggerFactory.getLogger(SalesController.class);
	
	@Resource(name="salesService")
	private SalesService salesService;
	
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
}
