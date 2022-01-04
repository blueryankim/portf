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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import hooray.chatting.model.ChattingVO;
import hooray.chatting.service.ChattingService;

@Controller
public class BringOldMessageController {

	private ChattingService chattingService;
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String bringOldMessage(HttpServletRequest request,HttpSession session) throws JsonProcessingException{
		
		Date projectAppDate;
		Date projectLastDate;
		
		session=request.getSession();
		projectAppDate=(Date)session.getAttribute("appdate");
		projectLastDate=(Date)session.getAttribute("chalastdate");
		int projectNum=Integer.valueOf(request.getParameter("projectNum"));
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("projectNum", projectNum);
		map.put("appdate", projectAppDate);
		map.put("lastdate", projectLastDate);
		map.put("start_row", 1);
		map.put("end_row", 15);
		
		List<ChattingVO> oldChattingList=chattingService.bringOldMessage(map);
		
		if(oldChattingList.size()>1){
			
			session.setAttribute("chalastdate", oldChattingList.get(oldChattingList.size()-1).getRegdate());
		
			for(int i=0; i<oldChattingList.size();i++){
				Date date=oldChattingList.get(i).getRegdate();
				SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				oldChattingList.get(i).setDate(form.format(date));
			}
		
		}
		
		else{
			
			return "0";
		}
		
		map=new HashMap<String,Object>();
		map.put("oldChattingList", oldChattingList);
		
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
