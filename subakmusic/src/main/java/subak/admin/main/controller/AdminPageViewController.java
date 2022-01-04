package subak.admin.main.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.admin.article.service.ArticleListService;
import subak.admin.member.service.MemberListService;
import subak.searchmusic.service.SearchMusicService;

@Controller
public class AdminPageViewController {
	/**
	 * @uml.property  name="memberListService"
	 * @uml.associationEnd  
	 */
	private MemberListService memberListService;
	/**
	 * @uml.property  name="articleListService"
	 * @uml.associationEnd  
	 */
	private ArticleListService articleListService;
	/**
	 * @uml.property  name="searchMusicService"
	 * @uml.associationEnd  
	 */
	private SearchMusicService searchMusicService;
	
	
	/**
	 * @param memberListService
	 * @uml.property  name="memberListService"
	 */
	public void setMemberListService(MemberListService memberListService) {
		this.memberListService = memberListService;
	}


	/**
	 * @param articleListService
	 * @uml.property  name="articleListService"
	 */
	public void setArticleListService(ArticleListService articleListService) {
		this.articleListService = articleListService;
	}


	/**
	 * @param searchMusicService
	 * @uml.property  name="searchMusicService"
	 */
	public void setSearchMusicService(SearchMusicService searchMusicService) {
		this.searchMusicService = searchMusicService;
	}


	@RequestMapping
	public ModelAndView setView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mav.setViewName("redirect:/home/home.do");
			return mav;
		} else if (!session.getAttribute("id").equals("admin")) {
			mav.setViewName("redirect:/home/home.do");
			return mav;
		}
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("searchtype", "singer");
		map.put("searchtext","");
				
		Map<String,Object> model = new HashMap<String, Object>();
		model.put("MemberCount", memberListService.getListCount(null));
		model.put("MusicCount", searchMusicService.searchMusicCount(map));
		model.put("ArticleCount", articleListService.getArticleCount(null));
		
		mav.addAllObjects(model);
		mav.setViewName("/admin/admin_main.jsp");
		return mav;
	}
}
