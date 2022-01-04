package hooray.chatting.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import hooray.chatting.model.ChattingVO;
import hooray.chatting.service.ChattingService;

@Controller
public class ChattingController {

	private ChattingService chattingService;


	/*LogDate는 처음에 프로젝트에 참여하자 마자 Appdate와 함께 입력할 것이다.
	 * LogDate는 단지 내가 읽지 않은 채팅의 갯수만을 표현해주기 위해 사용할 뿐이다.
	 * Appdate를 기준으로 하는 채팅 내용만 가져 올 것이다. 곧 Appdate는 최대 한계값이다.
	 * Sysdate를 통해서 15개의 채팅 내용만 가져오게 할 것이다. 오름차순으로 start_row 1 end_row 15 
	 * 15개 중에서 가장 처음의 시간을 session에 저장한뒤 이후 스크롤을 통해서 위로 올라가면서 데이터를 가져오게 할 것이다.
	 * 항상 마지노선 값은 Appdate까지
	 * */
	
	@RequestMapping(value="/chatting/getchamessagefirst.do", method=RequestMethod.GET)
	public ModelAndView getChattingMessage(HttpServletRequest request,HttpSession session){
	
	session=request.getSession();
	String email=(String)session.getAttribute("email");
	int projectNum;
	String projectOwner;
	Date projectAppDate;
	session.setAttribute("chalatestdate", null);
	session.setAttribute("chalastdate", null);
	projectNum=Integer.valueOf(request.getParameter("projectNum"));
	
	Map<String,Object> model=new HashMap<String,Object>();
	model.put("projectNum", projectNum);
	model.put("email", email);
	
	//appdate는 사용자의 프로젝트를 참여하게 된 시간을 말한다. appdate는 사용자가
	//프로젝트를 참여한 이후에 채팅 메시지만 볼 수 있도록 해준다.
	
	projectAppDate=chattingService.getAppDate(model);
	
	session.setAttribute("appdate", projectAppDate);
	
	model=new HashMap<String,Object>();
	model.put("projectNum", projectNum);
	model.put("start_row", 1);
	model.put("end_row", 15);
	model.put("appdate", projectAppDate);
	model.put("email", email);
	
	//로그 데이트를 기본으로 해서 읽지 않은 채팅 내용 갯수를 확인하도록 하자. 지원자를 위한 창에서 내용을 가져올 때 사용할 것이다.	

	
	List<ChattingVO> chattingList=chattingService.getChattingList(model);

	//chalastdate는 데이트 숫자가 작은 올드 데이터 chalatestdate의 구별
	//
	if(chattingList.size()>=1){
		Date latestDate=chattingList.get(chattingList.size()-1).getRegdate();
		session.setAttribute("chalatestdate", latestDate);
		session.setAttribute("chalastdate",chattingList.get(0).getRegdate() );
	}

	/*
	 * lastdate
	 * 
	 * latestdate 
	 * */
	projectOwner=chattingService.getProjectOwner(projectNum);
	
	Map<String,Object> map=new HashMap<String,Object>();
	map.put("chattingList", chattingList);
	map.put("projectOwner", projectOwner);
	map.put("projectNum",projectNum);
	
	ModelAndView mav=new ModelAndView();
	mav.addAllObjects(map);
	mav.setViewName("/chatting/chattingpage.jsp");
	
	return mav;
}
	
	
	@RequestMapping(value="/chatting/getchamessage.do", method=RequestMethod.GET)
	@ResponseBody
	public String getAutoChattingMessage(HttpServletRequest request,HttpSession session) throws JsonProcessingException{
	
	session=request.getSession();
	
	int projectNum;
	Date chalatestdate;
	Date projectAppDate;
	List<ChattingVO> chattingList;
	String email=(String)session.getAttribute("email");
	int chattingpeople;
	
	projectNum=Integer.valueOf(request.getParameter("projectNum"));
	
	//아무 데이터가 없을 때를 고려해야 한다.
	if(session.getAttribute("chalatestdate")==null){
		
		projectAppDate=(Date)session.getAttribute("appdate");
		Map<String,Object> model=new HashMap<String,Object>();
		model=new HashMap<String,Object>();
		model.put("projectNum", projectNum);
		model.put("start_row", 1);
		model.put("end_row", 15);
		model.put("appdate", projectAppDate);
		model.put("email", email);
		
		chattingList=chattingService.getChattingList(model);
		chattingpeople=chattingService.getChattingPeopleCount(projectNum);
		
		if(chattingList.size()>=1){
			Date latestDate=chattingList.get(chattingList.size()-1).getRegdate();
			session.setAttribute("chalatestdate", latestDate);
			session.setAttribute("chalastdate",chattingList.get(0).getRegdate() );
	
			for(int i=0; i<chattingList.size();i++){
				Date date=chattingList.get(i).getRegdate();
				SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				chattingList.get(i).setDate(form.format(date));
			}
		
		}
		
		
		
		
		
	}
	
	else{
	Map<String,Object> model=new HashMap<String,Object>();
	chalatestdate=(Date)session.getAttribute("chalatestdate");
	
	model=new HashMap<String,Object>();
	model.put("projectNum", projectNum);
	model.put("chalatestdate", chalatestdate);
	
	//로그 데이트를 기본으로 해서 읽지 않은 채팅 내용 갯수를 확인하도록 하자. 지원자를 위한 창에서 내용을 가져올 때 사용할 것이다.	

	chattingList=chattingService.getChattingList(model);
	chattingpeople=chattingService.getChattingPeopleCount(projectNum);

	if(chattingList.size()>=1){
		Date lastestDate=chattingList.get(chattingList.size()-1).getRegdate();
		session.setAttribute("chalatestdate", lastestDate);
		
		
		for(int i=0; i<chattingList.size();i++){
			Date date=chattingList.get(i).getRegdate();
			SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			chattingList.get(i).setDate(form.format(date));
		}
		
	}
	
	}
	
	Map<String,Object> map=new HashMap<String,Object>();
	map.put("chattingList", chattingList);
	map.put("chattingPeopleCount", chattingpeople);
	
	ObjectMapper mapper = new ObjectMapper();
	
	return mapper.writeValueAsString(map);
}

public ChattingService getChattingService() {
	return chattingService;
}
public void setChattingService(ChattingService chattingService) {
	this.chattingService = chattingService;
}

}
