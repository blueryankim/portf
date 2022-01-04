package circle.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import circle.member.service.SearchUniversityService;

@Controller
public class SearchUniversityController {

	private SearchUniversityService sus;

	@RequestMapping
	ModelAndView searchUniversity(HttpServletRequest request) throws Exception{
		
		String uniname=request.getParameter("uniname");
		
		List<String> uniList = // ��ü�� or �˻��ϰ��� �ϴ� ��
				sus.searchUniversity(uniname); //map�� ����	
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("unilist",uniList);
		mav.setViewName("/member/searchuniversity.jsp");
		return mav;
	}
	
	
	public void setSus(SearchUniversityService sus) {
		this.sus = sus;
	}
	
	
	
}
