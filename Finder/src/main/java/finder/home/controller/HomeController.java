package finder.home.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import finder.home.model.HomeVO;
import finder.home.model.LoginerInforVO;
import finder.home.service.HomeService;

@Controller
public class HomeController {
	
	private HomeService hs;
	private LoginerInforVO livo;
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView getHomeContentPost(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=(String)request.getParameter("loginid");
		System.out.println(id);
		session=request.getSession();
		session.setAttribute("id", id);
		session.setAttribute("name", hs.getMyName((String)session.getAttribute("id")));
		List<HomeVO> homealbumlist=hs.getHomeAlbumList();
		List<HomeVO> homebooklist=hs.getHomeBookList();
		List<HomeVO> homewritinglist=hs.getHomeWritingList();
		livo.setId((String)session.getAttribute("id"));
		livo.setMyalbumcount(hs.getMyAlbumCount((String)session.getAttribute("id")));
		livo.setMybookcount(hs.getMyBookCount((String)session.getAttribute("id")));
		livo.setMywritingcount(hs.getMyWritingCount((String)session.getAttribute("id")));
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("homealbumlist",homealbumlist);
		model.put("homebooklist",homebooklist);
		model.put("homewritinglist",homewritinglist);
		model.put("loginerinfor", livo);
		
		ModelAndView mav=new ModelAndView();
		mav.addAllObjects(model);
		mav.setViewName("/home/homepage.jsp");
		
		return mav;
	
	}
	
	@RequestMapping(method=RequestMethod.GET)
public ModelAndView getHomeContentGet(HttpSession session,HttpServletRequest request) throws Exception{
		
		
		session=request.getSession();
		List<HomeVO> homealbumlist=hs.getHomeAlbumList();
		List<HomeVO> homebooklist=hs.getHomeBookList();
		List<HomeVO> homewritinglist=hs.getHomeWritingList();
		livo.setId((String)session.getAttribute("id"));
		livo.setMyalbumcount(hs.getMyAlbumCount((String)session.getAttribute("id")));
		livo.setMybookcount(hs.getMyBookCount((String)session.getAttribute("id")));
		livo.setMywritingcount(hs.getMyWritingCount((String)session.getAttribute("id")));
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("homealbumlist",homealbumlist);
		model.put("homebooklist",homebooklist);
		model.put("homewritinglist",homewritinglist);
		model.put("loginerinfor", livo);
		
		ModelAndView mav=new ModelAndView();
		mav.addAllObjects(model);
		mav.setViewName("/home/homepage.jsp");
		
		return mav;
	
	}

	public HomeService getHs() {
		return hs;
	}

	public void setHs(HomeService hs) {
		this.hs = hs;
	}

	public LoginerInforVO getLivo() {
		return livo;
	}

	public void setLivo(LoginerInforVO livo) {
		this.livo = livo;
	}
	

	

}
