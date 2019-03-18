package smb.common.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import smb.common.service.LoginService;

@Controller
public class LoginController {

	Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value = "/Login.do", method = RequestMethod.GET)
	public String Login() throws Exception {
		log.debug("####");
		return "/login/login";
	}
	
	
	@RequestMapping(value = "/Logout.do", method = RequestMethod.GET)
	public String Logout() throws Exception {
		return "/login/login";
	}
	
	
	@RequestMapping(value = "/CheckLogin.do", method = RequestMethod.POST)
	public ModelAndView CheckLoginPost() throws Exception {
		// -----------------------------------------------------------------------------
		// Base Type
		// -----------------------------------------------------------------------------
		ModelAndView mv = new ModelAndView("/index");
		
		return mv;
	}
}
