package subak.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import subak.member.model.MemberVO;
import subak.member.service.MemberRegistService;

@Controller
public class RegistController {
	/**
	 * @uml.property  name="memberRegistService"
	 * @uml.associationEnd  
	 */
	private MemberRegistService memberRegistService;
	
	/**
	 * @param memberRegistService
	 * @uml.property  name="memberRegistService"
	 */
	public void setMemberRegistService(MemberRegistService memberRegistService) {
		this.memberRegistService = memberRegistService;
	}

	@RequestMapping
	public String setView() {
		return "/member/registForm.jsp";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onSubmit(HttpServletRequest request, MemberVO memberVO, BindingResult bindingResult)
			throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		memberVO.setRegdate(new Date());
		this.memberRegistService.insertMember(memberVO);
		return new ModelAndView("redirect:/home/home.do");
	}
	
}