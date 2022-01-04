package subak.myPage.controller;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import subak.myPage.model.MemberVO;
import subak.myPage.service.MPDeleteMemberService;

@Controller
public class MPDeleteMemberController {
	/**
	 * @uml.property  name="mpDeleteMemberService"
	 * @uml.associationEnd  
	 */
	private MPDeleteMemberService mpDeleteMemberService;

	/**
	 * @param mpDeleteMemberService
	 * @uml.property  name="mpDeleteMemberService"
	 */
	public void setMpDeleteMemberService(MPDeleteMemberService mpDeleteMemberService) {
		this.mpDeleteMemberService = mpDeleteMemberService;
	}
	
	@RequestMapping
	public ModelAndView setView(String userID) {
		// 로그인 전
		if(userID == null || userID.equals(null) || userID == "" || userID.equals("")) {
			return new ModelAndView("redirect:/error/loginRequest.do");
		}
		// 로그인 후
		else {
			ModelAndView mav = new ModelAndView("/myPage/mpDeleteMember.jsp");
				mav.addObject("userID", userID);
			return mav;
		}
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView modelView(HttpServletRequest request, HttpSession session, MemberVO memberVO) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String userID = (String) session.getAttribute("id");
		String dbpass = this.mpDeleteMemberService.getPass(userID);
		//System.out.println("::::: " + memberVO.getPass() + " / " + dbpass);
		
		ModelAndView mav = new ModelAndView("/myPage/mpDeleteMember.jsp");
		
		if(memberVO.getPass().equals(dbpass)) {
			this.mpDeleteMemberService.deleteMember(userID);
			mav.addObject("userID", userID);
			mav.addObject("value", "successDelete");
		} else {
			mav.addObject("userID", userID);
			mav.addObject("value", "passError");
		}
		
		return mav;
	}
	
}