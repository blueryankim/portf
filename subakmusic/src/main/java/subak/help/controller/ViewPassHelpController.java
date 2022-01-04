package subak.help.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewPassHelpController {
	@RequestMapping()
	ModelAndView modelView(@RequestParam(value="email", required=false) String email, @RequestParam(value="name", required=false) String name,@RequestParam(value="id", required=false) String id){
		ModelAndView mav = new ModelAndView();
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("name", name);
		model.put("email", email);
		model.put("id", id);
	
		mav.addAllObjects(model);
		mav.setViewName("/help/help_pass.jsp");
		return mav;
	}
}
