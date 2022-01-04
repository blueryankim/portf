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
			//���̵� �������� �ʽ��ϴ�.
			message="���̵� �������� �ʽ��ϴ�.";
			
			mav.addObject("message",message);
			mav.addObject("idconfirmflag","0");
			mav.setViewName("/login/idconfirmandlogin.jsp");
			
		}
		
		else{
			
		inputConfirm=ics.inputConfirm(icvo);	
		if(inputConfirm==0){
			message="���̵� ��й�ȣ�� ���� �ʽ��ϴ�.";
			mav.addObject("idconfirmflag","1");
			mav.addObject("message",message);
			mav.setViewName("/login/idconfirmandlogin.jsp");
			
		}
		
		else{
			
			//String timearr=ics.getTimelineArr(icvo.getLoginid());
			
			mav.addObject("idconfirmflag","2");
			mav.addObject("id",icvo.getLoginid() );
			mav.setViewName("/login/idconfirmandlogin.jsp"); //setViewName����
			
			//if(timearr=="popular"){
				
			
			}
			
			
		}
		
		return mav;
		
		
		
	}
	
	
	public void setIcs(IdConfirmAndLoginService ics) {
		this.ics = ics;
	}
	
	
	
	
}
