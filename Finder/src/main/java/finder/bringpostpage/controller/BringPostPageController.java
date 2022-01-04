package finder.bringpostpage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import finder.home.model.LoginerInforVO;
import finder.home.service.HomeService;

@Controller
public class BringPostPageController {

	private LoginerInforVO livo;
	private HomeService hs;
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView bringPostPage(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=(String)session.getAttribute("id");
	
	
		livo.setId(id);
		livo.setMyalbumcount(hs.getMyAlbumCount((String)session.getAttribute("id")));
		livo.setMybookcount(hs.getMyBookCount((String)session.getAttribute("id")));
		livo.setMywritingcount(hs.getMyWritingCount((String)session.getAttribute("id")));
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/makecontent/makecontentpage.jsp");
		mav.addObject("loginerinfor", livo);
		return mav;
		
}
	public LoginerInforVO getLivo() {
		return livo;
	}
	public void setLivo(LoginerInforVO livo) {
		this.livo = livo;
	}
	public HomeService getHs() {
		return hs;
	}
	public void setHs(HomeService hs) {
		this.hs = hs;
	}
	
	
}