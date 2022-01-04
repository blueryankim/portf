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


	/*LogDate�� ó���� ������Ʈ�� �������� ���� Appdate�� �Բ� �Է��� ���̴�.
	 * LogDate�� ���� ���� ���� ���� ä���� �������� ǥ�����ֱ� ���� ����� ���̴�.
	 * Appdate�� �������� �ϴ� ä�� ���븸 ���� �� ���̴�. �� Appdate�� �ִ� �Ѱ谪�̴�.
	 * Sysdate�� ���ؼ� 15���� ä�� ���븸 �������� �� ���̴�. ������������ start_row 1 end_row 15 
	 * 15�� �߿��� ���� ó���� �ð��� session�� �����ѵ� ���� ��ũ���� ���ؼ� ���� �ö󰡸鼭 �����͸� �������� �� ���̴�.
	 * �׻� �����뼱 ���� Appdate����
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
	
	//appdate�� ������� ������Ʈ�� �����ϰ� �� �ð��� ���Ѵ�. appdate�� ����ڰ�
	//������Ʈ�� ������ ���Ŀ� ä�� �޽����� �� �� �ֵ��� ���ش�.
	
	projectAppDate=chattingService.getAppDate(model);
	
	session.setAttribute("appdate", projectAppDate);
	
	model=new HashMap<String,Object>();
	model.put("projectNum", projectNum);
	model.put("start_row", 1);
	model.put("end_row", 15);
	model.put("appdate", projectAppDate);
	model.put("email", email);
	
	//�α� ����Ʈ�� �⺻���� �ؼ� ���� ���� ä�� ���� ������ Ȯ���ϵ��� ����. �����ڸ� ���� â���� ������ ������ �� ����� ���̴�.	

	
	List<ChattingVO> chattingList=chattingService.getChattingList(model);

	//chalastdate�� ����Ʈ ���ڰ� ���� �õ� ������ chalatestdate�� ����
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
	
	//�ƹ� �����Ͱ� ���� ���� ����ؾ� �Ѵ�.
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
	
	//�α� ����Ʈ�� �⺻���� �ؼ� ���� ���� ä�� ���� ������ Ȯ���ϵ��� ����. �����ڸ� ���� â���� ������ ������ �� ����� ���̴�.	

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
