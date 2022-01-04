package subak.help.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import subak.help.service.FindPassService;

@Controller
public class FindPassController {
	/**
	 * @uml.property  name="findPassService"
	 * @uml.associationEnd  
	 */
	private FindPassService findPassService;

	/**
	 * @param findPassService
	 * @uml.property  name="findPassService"
	 */
	public void setFindPassService(FindPassService findPassService) {
		this.findPassService = findPassService;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	ModelAndView modelView(HttpServletRequest request){
		System.out.println("Passã�� controller");
		ModelAndView mav = new ModelAndView();
		Map<String,Object> model = new HashMap<String,Object>();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		
		String checkEmail = findPassService.getEmail(name);
		String checkId = findPassService.getId(email);
		
		if(checkEmail == null){
			model.put("PassError", "�̸��� �������� �ʽ��ϴ�.");
			mav.setViewName("/help/help_pass.jsp");
		}else{
			if(checkEmail.equals(email)&&checkId.equals(id)){
				model.put("id", id);
				model.put("name", name);
				model.put("email", email);
				model.put("pass", findPassService.getPass(id));
				mav.setViewName("/help/help_pass.jsp");
			}else if(!checkEmail.equals(email)){
				model.put("PassError", "Email�� �߸��Ǿ����ϴ�.");
				mav.setViewName("/help/help_pass.jsp");
			}else if(!checkId.equals(id)){
				model.put("PassError", "Id�� �߸��Ǿ����ϴ�.");
				mav.setViewName("/help/help_pass.jsp");
			}
		}
		mav.addAllObjects(model);
		return mav;
	}
}

