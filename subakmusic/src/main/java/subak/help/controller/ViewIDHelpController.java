package subak.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewIDHelpController {
	@RequestMapping
	public String setView() {
		return "/help/help_temp.jsp";
	}
}
