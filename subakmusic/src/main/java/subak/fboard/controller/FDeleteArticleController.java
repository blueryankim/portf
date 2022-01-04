package subak.fboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import subak.fboard.model.FBoardVO;
import subak.fboard.service.FDeleteArticleService;

@Controller
public class FDeleteArticleController {
	/**
	 * @uml.property  name="deleteArticleService"
	 * @uml.associationEnd  
	 */
	private FDeleteArticleService deleteArticleService;

	/**
	 * @param deleteArticleService
	 * @uml.property  name="deleteArticleService"
	 */
	public void setDeleteArticleService(FDeleteArticleService deleteArticleService) {
		this.deleteArticleService = deleteArticleService;
	}

	@RequestMapping
	public ModelAndView setView(Integer num) {
		ModelAndView mav = new ModelAndView("/fboard/fdeleteForm.jsp");
		mav.addObject("num", num);
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onSubmit(Integer num, FBoardVO boardVo) {
		String dbpass = this.deleteArticleService.getPass(num);
		if (boardVo.getPass().equals(dbpass)) {
			this.deleteArticleService.deleteArticle(boardVo.getNum());
			ModelAndView mav = new ModelAndView("/fboard/fdeleteForm.jsp");
			mav.addObject("num", num);
			mav.addObject("value", "successDelete");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("/fboard/fdeleteForm.jsp");
			mav.addObject("num", num);
			mav.addObject("value", "passerror");
			return mav;
		}
	}
}