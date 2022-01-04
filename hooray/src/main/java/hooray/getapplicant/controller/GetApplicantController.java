package hooray.getapplicant.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hooray.applyproject.service.ApplyProjectService;
import hooray.chatting.service.ChattingService;
import hooray.getapplicant.model.GetApplicantVO;
import hooray.getapplicant.service.GetApplicantService;
import hooray.getcomment.service.GetCommentService;
import hooray.getproject.model.GetProjectVO;
import hooray.getproject.service.GetAProjectService;

@Controller
public class GetApplicantController {

	private GetApplicantService getApplicantService;
	private GetAProjectService getAProjectService;
	private GetProjectVO getProjectVO;
	private ApplyProjectService applyProjectService;
	private GetCommentService getCommentService;
	private ChattingService chattingService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getApplicantList(HttpServletRequest request,HttpSession session){
		
		//프로젝트 정보
		//내가 참여하고 있는지 정보
		//최신순으로 프로젝트에 참여하는 사람들 목록
		
		int projectNum=Integer.valueOf(request.getParameter("projectNum"));
		String email=(String)session.getAttribute("email");
		int applicantCount;
		int confirmApply;
		int chooseflag;
		int commentCount;
		int memberProjectCount;
		int unreadChaCount;
		chooseflag=Integer.valueOf(request.getParameter("flag"));//재활용
		
	
		List<GetApplicantVO> appList=getApplicantService.getApplicantList(projectNum);
		applicantCount=getApplicantService.getApplicantCount(projectNum);
		
		//프로젝트 내용 가져오기
		getProjectVO=getAProjectService.getAProject(projectNum);
		
		Map<String,Object> model=new HashMap<String,Object>();
		model.put("email", email);
		model.put("pnum", projectNum);
		confirmApply=applyProjectService.applyProjectBefore(model);
		System.out.println("*****");
		System.out.println(confirmApply);
		commentCount=getCommentService.getCommentCount(projectNum);
		
		for(int i=0;i<appList.size();i++){
		memberProjectCount=getApplicantService.getMemberProjectCount(appList.get(i).getEmail());
		appList.get(i).setProjectCount(memberProjectCount);
		}
		
		model=new HashMap<String,Object>();
		model.put("projectNum", projectNum);
		model.put("email", email);
		
		if(email==null||email.equals("")){
			unreadChaCount=0;	
		}
		else{
			unreadChaCount=chattingService.getUnreadCount(model);

		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("unreadChaCount", unreadChaCount);
		map.put("applyflag", confirmApply);
		map.put("aProject", getProjectVO);
		map.put("appList", appList);
		map.put("chooseFlag",chooseflag);
		map.put("commentCount", commentCount);
		map.put("applicantCount", applicantCount);
		
		
		ModelAndView mav=new ModelAndView();
		mav.addAllObjects(map);
		mav.setViewName("/project/projectapplicant.jsp");
		
		return mav;
		
	}

	public GetApplicantService getGetApplicantService() {
		return getApplicantService;
	}

	public void setGetApplicantService(GetApplicantService getApplicantService) {
		this.getApplicantService = getApplicantService;
	}

	public GetAProjectService getGetAProjectService() {
		return getAProjectService;
	}

	public void setGetAProjectService(GetAProjectService getAProjectService) {
		this.getAProjectService = getAProjectService;
	}

	public ApplyProjectService getApplyProjectService() {
		return applyProjectService;
	}

	public void setApplyProjectService(ApplyProjectService applyProjectService) {
		this.applyProjectService = applyProjectService;
	}

	public GetProjectVO getGetProjectVO() {
		return getProjectVO;
	}

	public void setGetProjectVO(GetProjectVO getProjectVO) {
		this.getProjectVO = getProjectVO;
	}

	public GetCommentService getGetCommentService() {
		return getCommentService;
	}

	public void setGetCommentService(GetCommentService getCommentService) {
		this.getCommentService = getCommentService;
	}

	public ChattingService getChattingService() {
		return chattingService;
	}

	public void setChattingService(ChattingService chattingService) {
		this.chattingService = chattingService;
	}
	
	
	
	
	
}
