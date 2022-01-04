package hooray.chatting.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hooray.chatting.model.ChattingVO;
import hooray.chatting.service.ChattingService;

@Controller
public class UploadChattingMessageController {

		private ChattingVO chattingVO;
		private ChattingService chattingService;
@RequestMapping(method=RequestMethod.POST)
@ResponseBody
public String uploadChattingMessage(HttpServletRequest request,HttpSession session){
	
	session=request.getSession();
	chattingVO.setContent(request.getParameter("content"));
	chattingVO.setEmail((String)session.getAttribute("email"));
	chattingVO.setName((String)session.getAttribute("name"));
	chattingVO.setPnum(Integer.valueOf(request.getParameter("projectNum")));

	
	chattingService.uploadChattingMessage(chattingVO);
	
	
	

	
	
	
	return "1";
}
public ChattingVO getChattingVO() {
	return chattingVO;
}
public void setChattingVO(ChattingVO chattingVO) {
	this.chattingVO = chattingVO;
}
public ChattingService getChattingService() {
	return chattingService;
}
public void setChattingService(ChattingService chattingService) {
	this.chattingService = chattingService;
}



}
