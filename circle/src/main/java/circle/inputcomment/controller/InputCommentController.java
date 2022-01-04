package circle.inputcomment.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import circle.inputcomment.service.InputCommentService;

@Controller
public class InputCommentController {

	private InputCommentService ics;
	
	@RequestMapping
	public ModelAndView inputComment(HttpSession session,HttpServletRequest request)throws Exception{
		
		Map<String,Object> insertcommentmap=new HashMap<String,Object>();
		
		int gulnum=Integer.parseInt(request.getParameter("gulnum"));
		insertcommentmap.put("gulnum", request.getParameter("gulnum"));
		insertcommentmap.put("comment", request.getParameter("comment"));
		insertcommentmap.put("id", session.getAttribute("id"));
		insertcommentmap.put("writer",session.getAttribute("writer"));
		
		ics.insertComment(insertcommentmap);
		ics.updateTimelinetDate(gulnum);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/inputcomment/inputcomment.jsp");
		mav.addObject("gulnum",request.getParameter("gulnum"));
		return mav;
		
	}

	public void setIcs(InputCommentService ics) {
		this.ics = ics;
	}
	
	
	
}
