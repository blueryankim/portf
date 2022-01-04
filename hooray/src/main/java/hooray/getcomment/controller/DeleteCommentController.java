package hooray.getcomment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hooray.getcomment.service.GetCommentService;

@Controller
public class DeleteCommentController {

	private GetCommentService getCommentService;
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String deleteComment(HttpServletRequest request){
		
		int commentNum=Integer.valueOf(request.getParameter("commentNum"));
		
		getCommentService.deleteComment(commentNum);
		
		return "1";
	}
	
	public GetCommentService getGetCommentService() {
		return getCommentService;
	}
	public void setGetCommentService(GetCommentService getCommentService) {
		this.getCommentService = getCommentService;
	}
	
	
}
