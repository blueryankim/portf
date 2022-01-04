package subak.admin.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import subak.admin.member.service.MemberDeleteService;

@Controller
public class DeleteMemberController {
	
	/**
	 * @uml.property  name="memberDeleteService"
	 * @uml.associationEnd  
	 */
	public MemberDeleteService memberDeleteService;
	
	/**
	 * @param memberDeleteService
	 * @uml.property  name="memberDeleteService"
	 */
	public void setMemberDeleteService(MemberDeleteService memberDeleteService) {
		this.memberDeleteService = memberDeleteService;
	}

	@RequestMapping
	public ModelAndView setView(@RequestParam ("id")String id){
		ModelAndView mav = new ModelAndView();
		System.out.println("지우는 컨트롤러 "+id);
		mav.setViewName("redirect:memberAdminPage.do");
		
		memberDeleteService.deleteMember(id);
		return mav;
	}
}
