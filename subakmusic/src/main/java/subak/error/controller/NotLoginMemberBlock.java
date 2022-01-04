package subak.error.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class NotLoginMemberBlock implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getAttribute("utf-8");

		ModelAndView mav = new ModelAndView();
			mav.setViewName("/error/notLoginMemberBlock.jsp");
		
		return mav;
	}
	
}