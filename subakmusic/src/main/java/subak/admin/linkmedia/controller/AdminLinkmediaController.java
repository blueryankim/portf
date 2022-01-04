package subak.admin.linkmedia.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminLinkmediaController {
	
	@RequestMapping
	public String setView(HttpSession session){
		if (session.getAttribute("id") == null) {
			return "redirect:/home/home.do";
		} else if (!session.getAttribute("id").equals("admin")) {
			return "redirect:/home/home.do";
		}

		return "/admin/admin_linkmedia.jsp";
	}
}
