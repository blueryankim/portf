package finder.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import finder.member.model.IdConfirmAndLoginVO;
import finder.member.service.IdConfirmAndLoginService;

@Controller
public class IdConfirmAndLoginController {

	private IdConfirmAndLoginService ics;
	
	@RequestMapping
	public ModelAndView idConfirm(IdConfirmAndLoginVO icvo) throws Exception{
		String message;
		int idExistConfirm;
		int inputConfirm;
		idExistConfirm=ics.idExistConfirm(icvo.getLoginid());
		ModelAndView mav=new ModelAndView();
		if(idExistConfirm==0){
			//아이디가 존재하지 않습니다.
			message="아이디가 존재하지 않습니다.";
			
			mav.addObject("message",message);
			mav.addObject("idconfirmflag","0");
			mav.setViewName("/login/idconfirmandlogin.jsp");
			
		}
		
		else{
			
		inputConfirm=ics.inputConfirm(icvo);	
		if(inputConfirm==0){
			message="아이디나 비밀번호가 맞지 않습니다.";
			mav.addObject("idconfirmflag","1");
			mav.addObject("message",message);
			mav.setViewName("/login/idconfirmandlogin.jsp");
			
		}
		
		else{
			
			//String timearr=ics.getTimelineArr(icvo.getLoginid());
			
			mav.addObject("idconfirmflag","2");
			mav.addObject("id",icvo.getLoginid() );
			mav.setViewName("/login/idconfirmandlogin.jsp"); //setViewName설정
			
			//if(timearr=="popular"){
				
			
			}
			
			
		}
		
		return mav;
		
		
		
	}
	
	
	public void setIcs(IdConfirmAndLoginService ics) {
		this.ics = ics;
	}
	
	
	
	
}
