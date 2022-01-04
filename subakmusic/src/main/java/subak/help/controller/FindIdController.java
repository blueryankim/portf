package subak.help.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import subak.help.service.FindIdService;

@Controller
public class FindIdController {
	/**
	 * @uml.property  name="findIdService"
	 * @uml.associationEnd  
	 */
	private FindIdService findIdService;

	/**
	 * @param findIdService
	 * @uml.property  name="findIdService"
	 */
	public void setFindIdService(FindIdService findIdService) {
		this.findIdService = findIdService;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	ModelAndView modelView(HttpServletRequest request){
		System.out.println("ID찾기 controller");
		ModelAndView mav = new ModelAndView();
		Map<String,Object> model = new HashMap<String,Object>();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		String checkEmail = findIdService.getEmail(name);
		
		if(checkEmail == null){
			model.put("FindError", "이름이 존재하지 않습니다.");
			mav.setViewName("/help/help_temp.jsp");
		}else{
			if(checkEmail.equals(email)){
				model.put("id", findIdService.getId(email));
				model.put("name", name);
				model.put("email", email);
				System.out.println("Success!! : findid = "+findIdService.getId(email));
				mav.setViewName("/help/help_temp.jsp");
			}else{
				model.put("FindError", "Email이 잘못되었습니다.");
				mav.setViewName("/help/help_temp.jsp");
			}
		}
		mav.addAllObjects(model);
		return mav;
	}
}
