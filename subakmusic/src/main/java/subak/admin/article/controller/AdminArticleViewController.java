package subak.admin.article.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.admin.article.service.ArticleListService;
import subak.fboard.model.FBoardVO;
import subak.fboard.model.FPaging;

@Controller
public class AdminArticleViewController {
	/**
	 * @uml.property  name="articleListService"
	 * @uml.associationEnd  
	 */
	private ArticleListService articleListService;
	/**
	 * @uml.property  name="fPaging"
	 * @uml.associationEnd  
	 */
	private FPaging fPaging;
	
	/**
	 * @param articleListService
	 * @uml.property  name="articleListService"
	 */
	public void setArticleListService(ArticleListService articleListService) {
		this.articleListService = articleListService;
	}

	/**
	 * @param fPaging
	 * @uml.property  name="fPaging"
	 */
	public void setfPaging(FPaging fPaging) {
		this.fPaging = fPaging;
	}

	@RequestMapping
	public ModelAndView setView(HttpServletRequest request, HttpSession session){
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mav.setViewName("redirect:/home/home.do");
			return mav;
		} else if (!session.getAttribute("id").equals("admin")) {
			mav.setViewName("redirect:/home/home.do");
			return mav;
		}
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		int pageNavi = 5;
		Map<String, Object> map = new HashMap<String, Object>();
		
		int count= articleListService.getArticleCount(map);
		
		int number = count - (currentPage - 1)*pageSize;
		fPaging.setPaging(pageSize, pageNavi, count, currentPage);
		map.put("starRow", fPaging.getWriting_Start());
		map.put("endRow", fPaging.getWriting_End());
		List<FBoardVO> articleList = articleListService.getArticleList(map);
		Map<String,Object> model = new HashMap<String,Object>();
		
		model.put("articleList", articleList);
		model.put("count", count);
		model.put("number", number);
		model.put("pageNum", pageNum);
		model.put("fp",fPaging);
		mav.setViewName("/admin/admin_article.jsp");
		mav.addAllObjects(model);
		return mav;
	}
}
