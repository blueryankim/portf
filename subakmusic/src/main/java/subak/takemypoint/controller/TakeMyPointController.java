package subak.takemypoint.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.takemypoint.service.TakeMyPointService;

@Controller
public class TakeMyPointController {
	/**
	 * @uml.property  name="takemypointservice"
	 * @uml.associationEnd  
	 */
	private TakeMyPointService takemypointservice;
	@RequestMapping
	public ModelAndView getMemberPoint(String id,HttpServletRequest request){
		
		HttpSession session=request.getSession(false);
		int point=takemypointservice.getMemberPoint(id);
		ModelAndView mav=new ModelAndView();
		session.setAttribute("point", point);
		mav.addObject("point",point);
		mav.setViewName("/songpurchase/pointcheck.jsp");
		return mav;
	}
	
	/**
	 * @return
	 * @uml.property  name="takemypointservice"
	 */
	public TakeMyPointService getTakemypointservice() {
		return takemypointservice;
	}
	/**
	 * @param takemypointservice
	 * @uml.property  name="takemypointservice"
	 */
	public void setTakemypointservice(TakeMyPointService takemypointservice) {
		this.takemypointservice = takemypointservice;
	}
	
	
}
