package subak.uprecommendation.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.uprecommendation.service.UpRecommendationService;

@Controller
public class UpRecommendationController {

	/**
	 * @uml.property  name="uprecommendationservice"
	 * @uml.associationEnd  
	 */
	private UpRecommendationService uprecommendationservice;
	@RequestMapping
	public ModelAndView upRecommend(HttpServletRequest request){
		
		String templistnum=request.getParameter("listnum");
		int listnum=Integer.parseInt(templistnum);
		
		uprecommendationservice.upRecommendation(listnum);
		int recomcount=uprecommendationservice.getRecomCount(listnum);	

		ModelAndView mav=new ModelAndView();
		mav.addObject("recomcount",recomcount);
		mav.setViewName("/sharealbum/setrecomcount.jsp");
		return mav;
	
	}
	/**
	 * @return
	 * @uml.property  name="uprecommendationservice"
	 */
	public UpRecommendationService getUprecommendationservice() {
		return uprecommendationservice;
	}
	/**
	 * @param uprecommendationservice
	 * @uml.property  name="uprecommendationservice"
	 */
	public void setUprecommendationservice(
			UpRecommendationService uprecommendationservice) {
		this.uprecommendationservice = uprecommendationservice;
	}
	
	
}
