package subak.linkmedia.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import subak.linkmedia.model.LinkMediaVO;
import subak.linkmedia.model.Paging;
import subak.linkmedia.service.LinkMediaService;

@Controller
public class LinkMediaController {
	
	/**
	 * @uml.property  name="linkmediaservice"
	 * @uml.associationEnd  
	 */
	private LinkMediaService linkmediaservice;
	/**
	 * @uml.property  name="linkmediapaging"
	 * @uml.associationEnd  
	 */
	private Paging linkmediapaging;
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getMediaLink(HttpServletRequest request,HttpServletResponse response){
		
		String pageNum=request.getParameter("pageNum");
		String search_type=request.getParameter("search_type");
		String tempchoosedmedianum=request.getParameter("choosedaddrnum");
		int choosedmedianum;
		if(pageNum==""||pageNum==null){
			pageNum="1";
		}
		
		if(search_type==""||search_type==null){
			search_type="popsong";
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("search_type", search_type);
		
		int count=linkmediaservice.getLinkMediaCount(map);
		
		int currentPage=Integer.parseInt(pageNum);
		int pageSize=3;
		int pagenavi=3;
		
		Map<String,Object> map2=new HashMap<String,Object>();
		linkmediapaging.setPaging(pageSize, pagenavi, count, currentPage);
		
		
		
		map2.put("startRow", linkmediapaging.getWriting_Start());
		map2.put("endRow", linkmediapaging.getWriting_End());
		map2.put("search_type", search_type);
		List<LinkMediaVO> linkmedialist=linkmediaservice.getLinkMediaList(map2);
		
		String choosedmediaaddr;
		
		
		
		if(tempchoosedmedianum!="" && tempchoosedmedianum!=null){
			choosedmedianum=Integer.parseInt(tempchoosedmedianum);
			choosedmediaaddr=linkmediaservice.getChoosedMediaAddr(choosedmedianum);
			ModelAndView mav=new ModelAndView();
			mav.addObject("linklist",linkmedialist);
			mav.addObject("firstlist",linkmedialist.get(0));
			mav.addObject("lastpage",linkmediapaging.getPage_Count());
			mav.addObject("choosedmedianum",choosedmedianum);
			mav.addObject("choosedmediaaddr",choosedmediaaddr);
			mav.addObject("search_type",search_type);
			mav.setViewName("/linkmedia/linkmediamain.jsp");
			return mav;
		
		}
		
		if(tempchoosedmedianum==""||tempchoosedmedianum==null){
			tempchoosedmedianum="";
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("linklist",linkmedialist);
		mav.addObject("firstlist",linkmedialist.get(0));
		mav.addObject("lastpage",linkmediapaging.getPage_Count());
		mav.addObject("choosedmedianum",tempchoosedmedianum);
		mav.addObject("search_type",search_type);
		mav.setViewName("/linkmedia/linkmediamain.jsp");
		return mav;
	
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView getMediaLinkForAjax(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		String temppageNum=request.getParameter("pageNum");
		String search_type=request.getParameter("search_type");
		int pageNum=Integer.parseInt(temppageNum);
		
		if(temppageNum==""||temppageNum==null){
			pageNum=1;
		}

		if(search_type==""||search_type==null){
			search_type="popsong";
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("search_type", search_type);
		
		int count=linkmediaservice.getLinkMediaCount(map);
		
		int currentPage=pageNum;
		int pageSize=3;
		int pagenavi=3;
		
		Map<String,Object> map2=new HashMap<String,Object>();
		linkmediapaging.setPaging(pageSize, pagenavi, count, currentPage);
		
		map2.put("startRow", linkmediapaging.getWriting_Start());
		map2.put("endRow", linkmediapaging.getWriting_End());
		map2.put("search_type", search_type);
		List<LinkMediaVO> linkmedialist=linkmediaservice.getLinkMediaList(map2);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("linklist",linkmedialist);
		mav.setViewName("/linkmedia/linkmediaajax.jsp");
		
		return mav;
	}
	
	/**
	 * @return
	 * @uml.property  name="linkmediaservice"
	 */
	public LinkMediaService getLinkmediaservice() {
		return linkmediaservice;
	}
	/**
	 * @param linkmediaservice
	 * @uml.property  name="linkmediaservice"
	 */
	public void setLinkmediaservice(LinkMediaService linkmediaservice) {
		this.linkmediaservice = linkmediaservice;
	}
	/**
	 * @return
	 * @uml.property  name="linkmediapaging"
	 */
	public Paging getLinkmediapaging() {
		return linkmediapaging;
	}
	/**
	 * @param linkmediapaging
	 * @uml.property  name="linkmediapaging"
	 */
	public void setLinkmediapaging(Paging linkmediapaging) {
		this.linkmediapaging = linkmediapaging;
	}
	

	
	
	
}
