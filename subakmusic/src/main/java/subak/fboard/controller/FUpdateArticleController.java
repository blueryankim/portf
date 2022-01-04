package subak.fboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import subak.fboard.model.FBoardVO;
import subak.fboard.service.FUpdateArticleService;


@Controller
public class FUpdateArticleController {
	/**
	 * @uml.property  name="updateArticleService"
	 * @uml.associationEnd  
	 */
	private FUpdateArticleService updateArticleService;

	/**
	 * @param updateArticleService
	 * @uml.property  name="updateArticleService"
	 */
	public void setUpdateArticleService(
			FUpdateArticleService updateArticleService) {
		this.updateArticleService = updateArticleService;
	}

	@RequestMapping
	public ModelAndView setView(Integer num) {
		FBoardVO boardVo = this.updateArticleService.getArticle(num);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("vo", boardVo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/fboard/fupdateForm.jsp");
		mav.addAllObjects(model);
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onSubmit(HttpServletRequest request, FBoardVO boardVo,
			BindingResult bindingResult) throws Exception {
		String pass = this.updateArticleService.getPass(boardVo.getNum());
		if (boardVo.getPass().equals(pass)) {
			this.updateArticleService.updateArticle(boardVo);
			return new ModelAndView("redirect:/fboard/flist.do");
		} else {
			boardVo = this.updateArticleService.getArticle(boardVo.getNum());
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("vo", boardVo);
			String passerror = "pass";
			model.put("value", passerror);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/fboard/fupdateForm.jsp");
			mav.addAllObjects(model);
			return mav;
		}
	}
}