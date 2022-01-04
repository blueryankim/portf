package subak.fboard.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.fboard.model.FBoardVO;
import subak.fboard.service.FGetArticleService;


@Controller
public class FGetArticleController {
	/**
	 * @uml.property  name="getArticleService"
	 * @uml.associationEnd  
	 */
	private FGetArticleService getArticleService;

	/**
	 * @param getArticleService
	 * @uml.property  name="getArticleService"
	 */
	public void setGetArticleService(FGetArticleService getArticleService) {
		this.getArticleService = getArticleService;
	}

	@RequestMapping
	public ModelAndView getArticle(Integer num) {
		FBoardVO boardVo = this.getArticleService.getArticle(num);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("vo", boardVo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/fboard/fcontent.jsp");
		mav.addAllObjects(model);
		return mav;
	}
}