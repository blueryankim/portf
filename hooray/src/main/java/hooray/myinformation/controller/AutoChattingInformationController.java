package hooray.myinformation.controller;

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

import hooray.myinformation.model.ProjectVO;
import hooray.myinformation.service.MyInformationService;

@Controller
public class AutoChattingInformationController {

	private MyInformationService myInformationService;
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String getAutoChattingInfor(HttpServletRequest request,HttpSession session) throws JsonProcessingException{
		
		
		session=request.getSession();
		String email=(String)session.getAttribute("email");
		@SuppressWarnings("unchecked")
		List<ProjectVO> projectList=(List<ProjectVO>)session.getAttribute("projectList");
		
		List<ProjectVO> freshProjectList=myInformationService.refreshList(projectList,email);
		
		//flag
		//email
		//projectNum 다 얻어와서 List로 구해야 한다.
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pList",freshProjectList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(map);
	}
	public MyInformationService getMyInformationService() {
		return myInformationService;
	}
	public void setMyInformationService(MyInformationService myInformationService) {
		this.myInformationService = myInformationService;
	}
	
}
