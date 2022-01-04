package subak.admin.article.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import subak.admin.article.service.ArticleDeleteService;

@Controller
public class DeleteArticleController {
	/**
	 * @uml.property  name="articleDeleteService"
	 * @uml.associationEnd  
	 */
	private ArticleDeleteService articleDeleteService;

	/**
	 * @param articleDeleteService
	 * @uml.property  name="articleDeleteService"
	 */
	public void setArticleDeleteService(ArticleDeleteService articleDeleteService) {
		this.articleDeleteService = articleDeleteService;
	}
	
	@RequestMapping
	public ModelAndView setView(@RequestParam ("num")int num){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:articleAdminPage.do");
		
		articleDeleteService.deleteArticle(num);
		return mav;
	}

}
