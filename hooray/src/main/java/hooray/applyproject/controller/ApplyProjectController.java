package hooray.applyproject.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hooray.applyproject.service.ApplyProjectService;

@Controller
public class ApplyProjectController {

	private ApplyProjectService applyProjectService;
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String applyProject(HttpServletRequest request,HttpSession session){
		
		session=request.getSession();
		int confirmApply;
		int confirmApplyBefore;
		
		String email=(String)session.getAttribute("email");
		String pnumstr=request.getParameter("pnum");
		int pnum=Integer.valueOf(pnumstr);
		
		System.out.println(pnum);
		System.out.println(email);
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("email", email);
		map.put("pnum", pnum);
		
		//1은 이미 참여
		//2는 참여 성공
		//3은 실패
		
		confirmApplyBefore=applyProjectService.applyProjectBefore(map);
		if(confirmApplyBefore==1){
			return "1";
		}
		
		else{
		confirmApply=applyProjectService.applyProject(map);
		}
		
		if(confirmApply==1){
			return "2";
		}
		
		else{
			
			return "3";
		}
		
		
	}
	public ApplyProjectService getApplyProjectService() {
		return applyProjectService;
	}
	public void setApplyProjectService(ApplyProjectService applyProjectService) {
		this.applyProjectService = applyProjectService;
	}
	
	
	
}
