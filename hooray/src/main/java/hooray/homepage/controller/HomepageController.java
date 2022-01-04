package hooray.homepage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hooray.homepage.model.HomepageVO;
import hooray.homepage.service.HomepageService;

@Controller
public class HomepageController {
	
	private HomepageService homepageService;
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getHomepageContent(HttpSession session, HttpServletRequest request){
		
		String email;
		
		session=request.getSession();
		
		email=(String)session.getAttribute("email");
		
		
		List<HomepageVO> homeHotList=homepageService.getHomeHotList(); 
		List<HomepageVO> homeNewList=homepageService.getHomeNewList();
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		
		
		
		if(email!=null||email!=""||!email.equals("")){
			map.put("email", email);
		}
			map.put("homeHotList", homeHotList);
			map.put("homeNewList", homeNewList);
		
			ModelAndView mav=new ModelAndView();
		
			mav.addAllObjects(map);
			mav.setViewName("/main/mainpage.jsp");
		
		return mav;
	}
	
	public HomepageService getHomePageService() {
		return homepageService;
	}
	public void setHomePageService(HomepageService homePageService) {
		this.homepageService = homePageService;
	}
	
	

}
