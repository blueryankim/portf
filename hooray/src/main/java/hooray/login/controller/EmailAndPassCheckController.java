package hooray.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hooray.login.service.EmailAndPassCheckService;

@Controller
public class EmailAndPassCheckController {

	private EmailAndPassCheckService emailAndPassCheckService;
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String emailAndPassCheck(HttpServletRequest req,HttpSession session){
		
		int emailCheckFlag;
		String name;

		String email=req.getParameter("email");
		String password=req.getParameter("password");
		System.out.println("hello");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("email", email);
		map.put("password", password);
		System.out.println(email);
		
		emailCheckFlag=emailAndPassCheckService.checkEmail(email);
		name=emailAndPassCheckService.emailAndPassCheck(map);
		
		//이메일이 존재하지 않는 경우 flag=1
		//이메일은 존재하지만 비밀번호가 다른 경우 flag=2
		//이메일이나 비밀번호가 맞는 경우 flag=3
		if(emailCheckFlag==0){
			return "1";  
		}
		
		else{ //이메일이 존재하는 경우
			
			if(name.equals("")|| name==""|| name==null){
				return "2";
			}
			
			else{
				session=req.getSession();
				session.setAttribute("email", email);
				session.setAttribute("name", name);
				return "3";
			}
		}
	}

	public EmailAndPassCheckService getEmailAndPassCheckService() {
		return emailAndPassCheckService;
	}

	public void setEmailAndPassCheckService(EmailAndPassCheckService emailAndPassCheckService) {
		this.emailAndPassCheckService = emailAndPassCheckService;
	}
	
	
}
