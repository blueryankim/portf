package subak.fboard.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import subak.fboard.model.FBoardVO;
import subak.fboard.service.FWriteService;


@Controller
public class FWriteController {
	/**
	 * @uml.property  name="writeService"
	 * @uml.associationEnd  
	 */
	private FWriteService writeService;

	/**
	 * @param writeService
	 * @uml.property  name="writeService"
	 */
	public void setWriteService(FWriteService writeService) {
		this.writeService = writeService;
	}

	@RequestMapping
	public String setView() {
		return "/fboard/fwriteForm.jsp";
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onSubmit(HttpServletRequest request, FBoardVO boardVo,
			BindingResult bindingResult) throws Exception {
		// 글쓰기 DB에 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		boardVo.setRegdate(new Date());
		this.writeService.insertWriting(boardVo);
		return new ModelAndView("redirect:/fboard/flist.do");
	}
}