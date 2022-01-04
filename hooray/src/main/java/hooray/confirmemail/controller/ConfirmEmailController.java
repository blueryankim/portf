package hooray.confirmemail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hooray.confirmemail.service.ConfirmEmailService;

@Controller
public class ConfirmEmailController {

	private ConfirmEmailService checkidservice;

	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String checkId(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		String email =  request.getParameter("email");
		System.out.println(request.getParameter("email"));
		int flag = checkidservice.checkId(email);
		System.out.println(flag);
		String checkIdFalg=String.valueOf(flag);
		
		return checkIdFalg;

	}

	public void setCheckidservice(ConfirmEmailService checkidservice) {
		this.checkidservice = checkidservice;
	}

	

}
