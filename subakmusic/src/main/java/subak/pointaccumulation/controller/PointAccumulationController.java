package subak.pointaccumulation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import subak.pointaccumulation.model.PointAccumulationVO;
import subak.pointaccumulation.service.PointAccumulationService;

@Controller
public class PointAccumulationController {
	private PointAccumulationService pointaccumulationservice;
	@RequestMapping
	public ModelAndView pointAccumulation(PointAccumulationVO pointaccumulationvo,HttpServletRequest request){
		
		
		
		pointaccumulationservice.pointAccumulation(pointaccumulationvo);
		int point=pointaccumulationservice.getMyPoint(pointaccumulationvo.getId());

		HttpSession session=request.getSession(false);
		session.setAttribute("point", point);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/main/pointaccumulation.jsp");
		mav.addObject("point",pointaccumulationvo.getPoint());
		return mav;
	}
	public PointAccumulationService getPointaccumulationservice() {
		return pointaccumulationservice;
	}
	public void setPointaccumulationservice(
			PointAccumulationService pointaccumulationservice) {
		this.pointaccumulationservice = pointaccumulationservice;
	}
	
	
}
