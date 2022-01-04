package subak.checkmydown.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.checkmydown.model.CheckMyDownVO;
import subak.checkmydown.service.CheckMyDownService;

@Controller
public class CheckMyDownController {
	
	/**
	 * @uml.property  name="checkmydownservice"
	 * @uml.associationEnd  
	 */
	private CheckMyDownService checkmydownservice;
	@RequestMapping
	public ModelAndView checkMyDown(CheckMyDownVO checkmydownvo,HttpServletRequest request){
		
		
		System.out.println(request.getParameter("songnum"));
		String flag;
		CheckMyDownVO checkmydown=checkmydownservice.songPurchaseCheck(checkmydownvo);
		
		
		if(checkmydown==null)
		{
			flag="0";
		}
		else{
			flag="1";
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("flag",flag);
		mav.setViewName("/songpurchase/downloadcheck.jsp");
		return mav;
		
	}
	/**
	 * @return
	 * @uml.property  name="checkmydownservice"
	 */
	public CheckMyDownService getCheckmydownservice() {
		return checkmydownservice;
	}
	/**
	 * @param checkmydownservice
	 * @uml.property  name="checkmydownservice"
	 */
	public void setCheckmydownservice(CheckMyDownService checkmydownservice) {
		this.checkmydownservice = checkmydownservice;
	}


	
	

	

}
