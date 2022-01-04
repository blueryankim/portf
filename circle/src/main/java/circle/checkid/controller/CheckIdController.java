package circle.checkid.controller;

import javax.servlet.http.HttpServletRequest
;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import circle.checkid.service.CheckIdService;

@Controller
public class CheckIdController {

	private CheckIdService checkidservice;

	@RequestMapping
	public ModelAndView checkId(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		int checkIdFlag = checkidservice.checkId(id);
		System.out.println(checkIdFlag);
		ModelAndView mav = new ModelAndView();
		mav.addObject("checkIdflag", checkIdFlag);
		mav.setViewName("/checkid/checkid.jsp");
		return mav;

	}

	public void setCheckidservice(CheckIdService checkidservice) {
		this.checkidservice = checkidservice;
	}

	

}
