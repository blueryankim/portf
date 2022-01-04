package subak.qboard.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.qboard.model.QBoardVO;
import subak.qboard.service.QGetArticleService;


@Controller
public class QGetArticleController {
	/**
	 * @uml.property  name="getArticleService"
	 * @uml.associationEnd  
	 */
	private QGetArticleService getArticleService;

	/**
	 * @param getArticleService
	 * @uml.property  name="getArticleService"
	 */
	public void setGetArticleService(QGetArticleService getArticleService) {
		this.getArticleService = getArticleService;
	}

	@RequestMapping
	public ModelAndView getArticle(Integer num) {
		QBoardVO boardVo = this.getArticleService.getArticle(num);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("vo", boardVo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/qboard/content.jsp");
		mav.addAllObjects(model);
		return mav;
	}
}