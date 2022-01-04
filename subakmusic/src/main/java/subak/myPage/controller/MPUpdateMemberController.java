package subak.myPage.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import subak.myPage.model.MemberVO;
import subak.myPage.service.MPUpdateMemberService;

@Controller
public class MPUpdateMemberController {
	/**
	 * @uml.property  name="mpUpdateMemberService"
	 * @uml.associationEnd  
	 */
	private MPUpdateMemberService mpUpdateMemberService;

	/**
	 * @param mpUpdateMemberService
	 * @uml.property  name="mpUpdateMemberService"
	 */
	public void setMpUpdateMemberService(MPUpdateMemberService mpUpdateMemberService) {
		this.mpUpdateMemberService = mpUpdateMemberService;
	}
	
	@RequestMapping
	public ModelAndView setView(String userID) {
		// 로그인 전
		if(userID == null || userID.equals(null) || userID == "" || userID.equals("")) {
			return new ModelAndView("redirect:/error/loginRequest.do");
		} //end- if
		
		// 로그인 후
		else {
			MemberVO memberVO = this.mpUpdateMemberService.getMemberInfo(userID);
			Map<String, Object> model = new HashMap<String, Object>();
				model.put("vo", memberVO);
				
			String fsinger = new String(memberVO.getF_singer());
			String[] fsinger_arr = fsinger.split(",");
			for(int i=0; i<fsinger_arr.length; i++) {
				model.put("f_singer"+(i+1), fsinger_arr[i]);
			} //end- for
			
			String fgenre = new String(memberVO.getF_genre());
			String[] fgenre_arr = fgenre.split(",");
			String[] genre_title = {"발라드", "댄스", "랩/힙합", "R&B/소울", "락", "팝", "트로트", "기타"};
			for(int a=0; a<fgenre_arr.length; a++) {
				for(int t=0; t<genre_title.length; t++) {
					if(fgenre_arr[a].equals( genre_title[t] )) {
						model.put("f_genre"+(t+1), "checked");
					}
				} //end- for
			} //end- for
	
			ModelAndView mav = new ModelAndView();
				mav.setViewName("/myPage/mpUpdateMember.jsp");
				mav.addAllObjects(model);
			return mav;
		} //end- else
		
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onSubmit(HttpServletRequest request, HttpSession session, MemberVO memberVO, BindingResult bindingResult) throws Exception {
		
		String userID = (String) session.getAttribute("id");
		
		String pass = this.mpUpdateMemberService.getPass(userID);
		
		if(memberVO.getPass().equals(pass)) {
			this.mpUpdateMemberService.updateMemberInfo(memberVO);
			return new ModelAndView("redirect:/myPage/myPageHome.do");
		} else {
			memberVO = this.mpUpdateMemberService.getMemberInfo(userID);
			Map<String, Object> model = new HashMap<String, Object>();
				model.put("vo", memberVO);
				
				String fsinger = new String(memberVO.getF_singer());
				String[] fsinger_arr = fsinger.split(",");
				for(int i=0; i<fsinger_arr.length; i++) {
					model.put("f_singer"+(i+1), fsinger_arr[i]);
				}
				
				String fgenre = new String(memberVO.getF_genre());
				String[] fgenre_arr = fgenre.split(",");
				String[] genre_title = {"발라드", "댄스", "랩/힙합", "R&B/소울", "락", "팝", "트로트", "기타"};
				for(int a=0; a<fgenre_arr.length; a++) {
					for(int t=0; t<genre_title.length; t++) {
						if(fgenre_arr[a].equals( genre_title[t] )) {
							model.put("f_genre"+(t+1), "checked");
						}
					}
				}
				
				model.put("value", "pass");
			ModelAndView mav = new ModelAndView();
				mav.setViewName("/myPage/mpUpdateMember.jsp");
				mav.addAllObjects(model);
			return mav;
			
		}
		
	}
	
}