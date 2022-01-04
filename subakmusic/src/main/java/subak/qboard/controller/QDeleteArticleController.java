package subak.qboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import subak.qboard.model.QBoardVO;
import subak.qboard.service.QDeleteArticleService;


@Controller
public class QDeleteArticleController {
	/**
	 * @uml.property  name="deleteArticleService"
	 * @uml.associationEnd  
	 */
	private QDeleteArticleService deleteArticleService;

	/**
	 * @param deleteArticleService
	 * @uml.property  name="deleteArticleService"
	 */
	public void setDeleteArticleService(
			QDeleteArticleService deleteArticleService) {
		this.deleteArticleService = deleteArticleService;
	}

	@RequestMapping
	public ModelAndView setView(Integer num) {
		ModelAndView mav = new ModelAndView("/qboard/deleteForm.jsp");
		mav.addObject("num", num);
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onSubmit(Integer num, QBoardVO boardVo) {
		String dbpass = this.deleteArticleService.getPass(num);
		if (boardVo.getPass().equals(dbpass)) {
			this.deleteArticleService.deleteArticle(boardVo.getNum());
			ModelAndView mav = new ModelAndView("/qboard/deleteForm.jsp");
			mav.addObject("num", num);
			mav.addObject("value", "successDelete");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("/qboard/deleteForm.jsp");
			mav.addObject("num", num);
			mav.addObject("value", "passerror");
			return mav;
		}
	}
}