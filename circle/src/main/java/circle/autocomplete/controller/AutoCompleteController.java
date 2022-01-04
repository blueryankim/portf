package circle.autocomplete.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import circle.autocomplete.model.AutoCompleteVO;
import circle.autocomplete.service.AutoCompleteService;

@Controller
public class AutoCompleteController {

	
	private AutoCompleteService acs;
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView autoComplete(@RequestParam("term")String query ) throws Exception{
		
		java.net.URLDecoder.decode(query,"UTF-8");
		System.out.println(query);
		List<AutoCompleteVO> autocompletelist=acs.autoComplete(query);
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("autocompletelist",autocompletelist);
		mav.setViewName("/autocomplete/autocomplete.jsp");
		return mav;
		
		
	}
	public void setAcs(AutoCompleteService acs) {
		this.acs = acs;
	}
	
	
	
}
