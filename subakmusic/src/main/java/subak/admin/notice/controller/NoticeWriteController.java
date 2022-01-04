package subak.admin.notice.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import subak.nboard.model.BoardVO;
import subak.nboard.service.WriteService;

@Controller
public class NoticeWriteController {
	/**
	 * @uml.property  name="writeService"
	 * @uml.associationEnd  
	 */
	private WriteService writeService;

	/**
	 * @param writeService
	 * @uml.property  name="writeService"
	 */
	public void setWriteService(WriteService writeService) {
		this.writeService = writeService;
	}

	@RequestMapping
	public String setView() {
		return "/admin/notice_writeForm.jsp";
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onSubmit(HttpServletRequest request, BoardVO boardVo, BindingResult bindingResult) throws Exception {
		// 글쓰기 DB에 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		boardVo.setRegdate(new Date());
		this.writeService.insertWriting(boardVo);
		return new ModelAndView("redirect:/admin/noticePage.do");
	}
	
}