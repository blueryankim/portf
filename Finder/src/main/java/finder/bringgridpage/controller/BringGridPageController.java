package finder.bringgridpage.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import finder.bringgridpage.model.BringGridPageVO;
import finder.bringgridpage.service.BringGridPageService;
import finder.home.model.LoginerInforVO;
import finder.home.service.HomeService;

@Controller
public class BringGridPageController {
	
	private BringGridPageService bgps;
	private LoginerInforVO livo;
	private HomeService hs;
	
	@RequestMapping(method=RequestMethod.GET)
	ModelAndView bringGridPage(HttpServletRequest request,HttpSession session)throws Exception{
		
		session=request.getSession();
		String id=(String)session.getAttribute("id");
		String flag=(String)request.getParameter("flag");
		
		livo.setId(id);
		livo.setMyalbumcount(bgps.getMyAlbumCount((String)session.getAttribute("id")));
		livo.setMybookcount(bgps.getMyBookCount((String)session.getAttribute("id")));
		livo.setMywritingcount(bgps.getMyWritingCount((String)session.getAttribute("id")));
		
		List<BringGridPageVO> gridlist=bgps.bringGridPage(flag);
		
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView mav=new ModelAndView();
		
		if(flag=="bookgrid" || flag.equals("bookgrid")){
			
			if(!gridlist.isEmpty()){
			int lastindex;
			lastindex=gridlist.size();
			System.out.println(lastindex);
			BringGridPageVO lastone=gridlist.get(lastindex-1);
			session.setAttribute("booklastcontenttime", (Date)lastone.getRegdate());
			System.out.println((Date)lastone.getRegdate());
			}
			
			model.put("bookgridlist",gridlist);
			model.put("loginerinfor", livo);
			mav.addAllObjects(model);
			mav.setViewName("/gridpage/bookgridpage.jsp");
			return mav;
			
		}
		
		else if(flag=="albumgrid" || flag.equals("albumgrid")){
			if(!gridlist.isEmpty()){
			int lastindex;
			lastindex=gridlist.size();
			System.out.println(lastindex);
			BringGridPageVO lastone=gridlist.get(lastindex-1);
			session.setAttribute("albumlastcontenttime", (Date)lastone.getRegdate());
			System.out.println((Date)lastone.getRegdate());
			}
			
			model.put("albumgridlist",gridlist);
			model.put("loginerinfor", livo);
			mav.addAllObjects(model);
			mav.setViewName("/gridpage/albumgridpage.jsp");
			return mav;
		}
		
		else{
			if(!gridlist.isEmpty()){
			int lastindex;
			lastindex=gridlist.size();
			BringGridPageVO lastone=gridlist.get(lastindex-1);
			session.setAttribute("writinglastcontenttime", (Date)lastone.getRegdate());
			}
		
			model.put("writinggridlist",gridlist);
			model.put("loginerinfor", livo);
			mav.addAllObjects(model);
			mav.setViewName("/gridpage/writinggridpage.jsp");
			return mav;
		}
		
	}

	@RequestMapping(method=RequestMethod.POST)
	ModelAndView bringGridPageAjax(HttpServletRequest request,HttpSession session)throws Exception{
		
		session=request.getSession();
	
		String flag=(String)request.getParameter("flag");
		System.out.println(flag);
		
		Map<String,Object> morecontent=new HashMap<String,Object>();
		morecontent.put("flag", flag);
		morecontent.put("lastcontenttime", (Date)session.getAttribute("lastcontenttime"));
		
		List<BringGridPageVO> gridlist=bgps.bringGridContents(morecontent);
		System.out.println(gridlist.size());
		
		Map<String, Object> model = new HashMap<String, Object>();
		ModelAndView mav=new ModelAndView();
		
		if(flag=="bookgrid" || flag.equals("bookgrid")){
			
			if(!gridlist.isEmpty()){
			int lastindex;
			lastindex=gridlist.size();
			System.out.println(lastindex+"");
			BringGridPageVO lastone=gridlist.get(lastindex-1);
			session.setAttribute("booklastcontenttime", (Date)lastone.getRegdate());
			}
			
			model.put("gridlist",gridlist);
			mav.addAllObjects(model);
			mav.setViewName("/gridpage/getmoregridcontent.jsp");
			return mav;
			
		}
		
		else if(flag=="albumgrid" || flag.equals("albumgrid")){
			
			if(!gridlist.isEmpty()){
			int lastindex;
			lastindex=gridlist.size();
			BringGridPageVO lastone=gridlist.get(lastindex-1);
			session.setAttribute("albumlastcontenttime", (Date)lastone.getRegdate());
			}
			
			model.put("gridlist",gridlist);
			mav.addAllObjects(model);
			mav.setViewName("/gridpage/getmoregridcontent.jsp");
			return mav;
		}
		
		else{
			if(!gridlist.isEmpty()){
			int lastindex;
			lastindex=gridlist.size();
			BringGridPageVO lastone=gridlist.get(lastindex-1);
			session.setAttribute("writinglastcontenttime", (Date)lastone.getRegdate());
			}
			
			model.put("gridlist",gridlist);
			mav.addAllObjects(model);
			mav.setViewName("/gridpage/getmoregridcontent.jsp");
			return mav;
		}
		
	}
	
	
	public BringGridPageService getBgps() {
		return bgps;
	}

	public void setBgps(BringGridPageService bgps) {
		this.bgps = bgps;
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
