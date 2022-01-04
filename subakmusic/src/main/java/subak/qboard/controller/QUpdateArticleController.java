package subak.qboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import subak.qboard.model.QBoardVO;
import subak.qboard.service.QUpdateArticleService;


@Controller
public class QUpdateArticleController {
	/**
	 * @uml.property  name="updateArticleService"
	 * @uml.associationEnd  
	 */
	private QUpdateArticleService updateArticleService;

	/**
	 * @param updateArticleService
	 * @uml.property  name="updateArticleService"
	 */
	public void setUpdateArticleService(
			QUpdateArticleService updateArticleService) {
		this.updateArticleService = updateArticleService;
	}

	@RequestMapping
	public ModelAndView setView(Integer num) {
		QBoardVO boardVo = this.updateArticleService.getArticle(num);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("vo", boardVo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/qboard/updateForm.jsp");
		mav.addAllObjects(model);
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onSubmit(HttpServletRequest request, QBoardVO boardVo,
			BindingResult bindingResult) throws Exception {
		String pass = this.updateArticleService.getPass(boardVo.getNum());
		if (boardVo.getPass().equals(pass)) {
			this.updateArticleService.updateArticle(boardVo);
			return new ModelAndView("redirect:/qboard/list.do");
		} else {
			boardVo = this.updateArticleService.getArticle(boardVo.getNum());
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("vo", boardVo);
			String passerror = "pass";
			model.put("value", passerror);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/qboard/updateForm.jsp");
			mav.addAllObjects(model);
			return mav;
		}
	}
}