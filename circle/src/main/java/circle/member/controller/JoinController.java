package circle.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import circle.member.model.JoinVO;
import circle.member.service.JoinService;

@Controller
public class JoinController {

	private JoinService joinservice;
	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView joinMember(JoinVO joinVO,HttpServletRequest request) throws Exception {
		
		
		String path="/"+joinVO.getId();
		
		joinVO.setProfileimg("../userbasicimage");
		joinVO.setTimelinearr("popular");
		joinservice.insertMember(joinVO);
		@SuppressWarnings("deprecation")
		String makepath=request.getRealPath("/memberimage")+path;
		File makememberimage=new File(makepath);
		//songnum에 따라 *폴더*를 만든다.
		if(!makememberimage.exists()){
			makememberimage.mkdirs();
			
			}
		
		

		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/member/insertmember.jsp");
		return mav;
		
	
	}


	public void setJoinservice(JoinService joinservice) {
		this.joinservice = joinservice;
	}
	
	
	
}
