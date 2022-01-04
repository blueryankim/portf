package hooray.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LogoutController {

	@RequestMapping
	@ResponseBody
	public String logout(HttpServletRequest req, HttpSession session){
		
		session=req.getSession();
		
		session.setAttribute("email", null);
		session.setAttribute("name", null);
		
		return "1";
		
	}
}
