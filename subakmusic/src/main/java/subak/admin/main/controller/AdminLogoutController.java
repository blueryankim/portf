package subak.admin.main.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminLogoutController {
	@RequestMapping
	ModelAndView modelView(HttpSession session){
		ModelAndView mav = new ModelAndView();
		Map<String,Object> model = new HashMap<String,Object>();
		mav.setViewName("redirect:/home/home.do");
		if(session.getId()!=null && !session.equals("")){
			session.invalidate();
			System.out.println("���� ���� �Ϸ�");
			return mav;
		}
		model.put("error", "�߸��� �����Դϴ�.");
		mav.addAllObjects(model);
		return mav;
	}

}
