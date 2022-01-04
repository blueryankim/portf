package hooray.getcomment.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hooray.getcomment.service.GetCommentService;

@Controller
public class UpdateCommentController {

	private GetCommentService getCommentService;
	
@RequestMapping(method=RequestMethod.POST)
@ResponseBody
public String updateComment(HttpServletRequest request){
	
	int commentNum=Integer.valueOf(request.getParameter("commentNum"));
	String comment=request.getParameter("comment");
	
	Map<String,Object> map=new HashMap<String,Object>();
	
	map.put("commentNum", commentNum);
	map.put("comment", comment);
	
	getCommentService.updateComment(map);
	
	return "1";
}

public GetCommentService getGetCommentService() {
	return getCommentService;
}

public void setGetCommentService(GetCommentService getCommentService) {
	this.getCommentService = getCommentService;
}


}
