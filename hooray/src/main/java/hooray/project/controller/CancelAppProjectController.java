package hooray.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hooray.project.service.CancelAppProjectService;

@Controller
public class CancelAppProjectController {
	
	private CancelAppProjectService cancelAppProjectService;

	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String cancelAppProject(HttpServletRequest request,HttpSession session){
		
		session=request.getSession();
		int projectNum;
		String email=(String)session.getAttribute("email");
		projectNum=Integer.valueOf(request.getParameter("pnum"));
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("email", email);
		map.put("projectNum", projectNum);
		
		cancelAppProjectService.cancelAppProject(map);
		
		return "1";
	}

	public CancelAppProjectService getCancelAppProjectService() {
		return cancelAppProjectService;
	}

	public void setCancelAppProjectService(CancelAppProjectService cancelAppProjectService) {
		this.cancelAppProjectService = cancelAppProjectService;
	}
	
	
}
