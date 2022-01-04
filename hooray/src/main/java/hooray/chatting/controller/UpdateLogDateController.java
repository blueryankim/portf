package hooray.chatting.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hooray.chatting.service.ChattingService;

@Controller
public class UpdateLogDateController {


private ChattingService chattingService;

@RequestMapping(method=RequestMethod.GET)
@ResponseBody
public String updateLogDate(HttpServletRequest request, HttpSession session){
	
	String email=(String)session.getAttribute("email");
	int projectNum=Integer.valueOf(request.getParameter("projectNum"));
	
	Map<String,Object> map=new HashMap<String,Object>();
	
	map.put("email", email);
	map.put("projectNum", projectNum);
	
	chattingService.updateLogDate(map);
	
	return "1";
	
}



public ChattingService getChattingService() {
	return chattingService;
}
public void setChattingService(ChattingService chattingService) {
	this.chattingService = chattingService;
}


}
