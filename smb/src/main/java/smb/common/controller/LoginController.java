package smb.common.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import smb.common.service.LoginService;

@Controller
public class LoginController {

	Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired 
	private PasswordEncoder passwordEncoder;
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value = "/Login.do", method = RequestMethod.GET)
	public String Login() throws Exception {
		return "/login/login";
	}
	
	
	@RequestMapping(value = "/Logout.do", method = RequestMethod.GET)
	public String Logout() throws Exception {
		return "/login/login";
	}
	
	
	@RequestMapping(value = "/CheckLogin.do", method = RequestMethod.GET)
	public ModelAndView CheckLoginPost(@RequestParam(value="error", required=false) String error, Model model) throws Exception {
		// -----------------------------------------------------------------------------
		// Base Type
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("/sales/sales_list");
		
		model.addAttribute("error", error);

		// Sha 암호값을 보기 위한 테스트용. 
		String guest_password = passwordEncoder.encodePassword("guest", null); 
		String admin_password = passwordEncoder.encodePassword("admin", null); 

		log.info(guest_password + "//" + admin_password);

		return mv;
	}
}
