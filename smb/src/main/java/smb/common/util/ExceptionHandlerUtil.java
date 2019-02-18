package smb.common.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

public class ExceptionHandlerUtil {
	
	@ExceptionHandler(Exception.class)
	public ModelAndView common(HttpServletRequest req, Exception e) {
		Logger log = LoggerFactory.getLogger(ExceptionHandlerUtil.class);
		
		log.info(e.toString());
		
		ModelAndView mv = new ModelAndView("/err.jsp");
		mv.addObject("exception", e);
		mv.addObject("url", req.getRequestURL());
		
		return mv;
	}
}
