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
		
		//�̸����� �������� �ʴ� ��� flag=1
		//�̸����� ���������� ��й�ȣ�� �ٸ� ��� flag=2
		//�̸����̳� ��й�ȣ�� �´� ��� flag=3
		if(emailCheckFlag==0){
			return "1";  
		}
		
		else{ //�̸����� �����ϴ� ���
			
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
