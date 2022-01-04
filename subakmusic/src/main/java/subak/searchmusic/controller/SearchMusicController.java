package subak.searchmusic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.searchmusic.model.Paging;
import subak.searchmusic.model.SearchMusicVO;
import subak.searchmusic.service.SearchMusicService;

@Controller
public class SearchMusicController {
	
	/**
	 * @uml.property  name="searchmusicservice"
	 * @uml.associationEnd  
	 */
	private SearchMusicService searchmusicservice;
	/**
	 * @uml.property  name="searchmusicpaging"
	 * @uml.associationEnd  
	 */
	private Paging searchmusicpaging;
	@RequestMapping
	public ModelAndView searchMusic(HttpServletRequest request){
		
		String temppagenum=request.getParameter("pagenum");
		String searchtype=request.getParameter("searchtype");
		String tempsearchtext=request.getParameter("searchtext");
		String pagenum=temppagenum;
		String searchtext=(tempsearchtext.trim()).toUpperCase();
	
		if (temppagenum == null || temppagenum == "") {
			pagenum = "1";
		}
		int currentPage = Integer.parseInt(pagenum);
		int pageSize = 10; // 페이지당 보여줄 데이터수 10개
		int pagenavi = 5; 
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("searchtype", searchtype);
		map.put("searchtext", searchtext);
		
		int count=searchmusicservice.searchMusicCount(map);
		System.out.println(count);
		searchmusicpaging.setPaging(// 페이징 클래스 //currentpage에 따라서 글 시작 번호가 달라짐.
				pageSize, pagenavi,count,currentPage);
		
		
		
		Map<String,Object> map2=new HashMap<String,Object>();
		map2.put("searchtype",searchtype);
		map2.put("searchtext", searchtext);
		map2.put("startRow", searchmusicpaging.getWriting_Start());
		map2.put("endRow", searchmusicpaging.getWriting_End());
		
		List<SearchMusicVO> searchlist=searchmusicservice.searchMusicList(map2);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("searchlist",searchlist);
		mav.addObject("pageNum", currentPage);
		mav.addObject("sp", searchmusicpaging);
		mav.setViewName("/uploadsharealbum/searchmusiclist.jsp");
		return mav;
	}
	/**
	 * @return
	 * @uml.property  name="searchmusicservice"
	 */
	public SearchMusicService getSearchmusicservice() {
		return searchmusicservice;
	}
	/**
	 * @param searchmusicservice
	 * @uml.property  name="searchmusicservice"
	 */
	public void setSearchmusicservice(SearchMusicService searchmusicservice) {
		this.searchmusicservice = searchmusicservice;
	}
	/**
	 * @return
	 * @uml.property  name="searchmusicpaging"
	 */
	public Paging getSearchmusicpaging() {
		return searchmusicpaging;
	}
	/**
	 * @param searchmusicpaging
	 * @uml.property  name="searchmusicpaging"
	 */
	public void setSearchmusicpaging(Paging searchmusicpaging) {
		this.searchmusicpaging = searchmusicpaging;
	}
	
	
	
}
