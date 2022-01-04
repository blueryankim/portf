package hooray.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hooray.project.service.PlusCountService;

@Controller
public class PlusCountController {

	
	private PlusCountService plusCountService;
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String plusCount(HttpServletRequest request){
		
		
		int projectNum=Integer.valueOf(request.getParameter("pjn"));
		plusCountService.plusCount(projectNum);
		
		return "1";
		
	}
	
	public PlusCountService getPlusCountService() {
		return plusCountService;
	}
	public void setPlusCountService(PlusCountService plusCountService) {
		this.plusCountService = plusCountService;
	}
	
	
}
