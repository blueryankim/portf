package subak.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import subak.member.service.IdCheckService;

@Controller
public class IdCheckController {
	/**
	 * @uml.property  name="idCheckService"
	 * @uml.associationEnd  
	 */
	private IdCheckService idCheckService;

	/**
	 * @param idCheckService
	 * @uml.property  name="idCheckService"
	 */
	public void setIdCheckService(IdCheckService idCheckService) {
		this.idCheckService = idCheckService;
	}
	
	@RequestMapping
	public String setView() {
		return "/member/idCheck.jsp";
	}
	
	
	/*@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onSubmit(HttpServletRequest request, String id, BindingResult bindingResult)
			throws Exception {
		this.idCheckService.idCheck(id);
		return new ModelAndView("redirect:/member/registForm.do");
	}*/
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onSubmit(String id) {
		Integer check = this.idCheckService.selectId(id);
		String checkid = id;
		if (check == 0) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("id", checkid);
			mav.addObject("value", "ok");
			mav.setViewName("/member/idCheck.jsp");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView();
			mav.addObject("value", "nono");
			mav.setViewName("/member/idCheck.jsp");
			return mav;
		}
	}

	
}