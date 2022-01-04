package hooray.getproject.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hooray.applyproject.service.ApplyProjectService;
import hooray.getcomment.service.GetCommentService;
import hooray.getproject.model.GetProjectVO;
import hooray.getproject.service.GetAProjectService;
import hooray.project.service.PlusCountService;

@Controller
public class GetAProjectController {
	
	private GetAProjectService getAProjectService;
	private ApplyProjectService applyProjectService;
	private GetProjectVO getAProjectVO;
	private PlusCountService plusCountService;
	private GetCommentService getCommentService;

	@RequestMapping(value="/project/getaproject.do", method=RequestMethod.GET)
	public ModelAndView getAProject(HttpServletRequest req,HttpSession session){
		
		int confirmApply;
		Integer projectNum;
		String memberemail;
		String Flag;
		int chooseFlag;
		int commentCount;
		session=req.getSession();
		projectNum=Integer.valueOf(req.getParameter("projectNum"));
		Flag=req.getParameter("flag");
		memberemail=(String)session.getAttribute("email");
		
		if(Flag==null ||Flag=="" || Flag.equals("")){
			
			chooseFlag=1;
		}
		
		else{
			chooseFlag=Integer.valueOf(Flag);
		}
		
		getAProjectVO=getAProjectService.getAProject(projectNum);
		
		/*이미 프로젝트에 참여중인지 확인*/
		Map<String,Object> model=new HashMap<String,Object>();
		model.put("pnum", projectNum);
		model.put("email", memberemail);
		//지원한 사람 확인
		confirmApply=applyProjectService.applyProjectBefore(model);
		plusCountService.plusCount(projectNum);
		commentCount=getCommentService.getCommentCount(projectNum);
				
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("applyflag", confirmApply);
		map.put("aProject", getAProjectVO);
		map.put("chooseFlag", chooseFlag);
		map.put("commentCount", commentCount);
		
		System.out.println(getAProjectVO.getLeavedate());
		
		ModelAndView mav=new ModelAndView();
		mav.addAllObjects(map);
		mav.setViewName("/oneproject/oneprojectpage.jsp");
		return mav;
	}
	
	@RequestMapping(value="/project/getaprojectforupdate.do", method=RequestMethod.GET)
	public ModelAndView getAProjectForUpdate(HttpServletRequest req,HttpSession session){
		
		int projectNum;
		String memberemail;
		session=req.getSession();
		projectNum=Integer.valueOf(req.getParameter("projectNum"));
		memberemail=(String)session.getAttribute("email");
		
		getAProjectVO=getAProjectService.getAProject(projectNum);
				
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("aProject", getAProjectVO);
		
		System.out.println(getAProjectVO.getLeavedate());
		
		ModelAndView mav=new ModelAndView();
		mav.addAllObjects(map);
		mav.setViewName("/project/updateproject.jsp");
		return mav;
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

	public GetProjectVO getGetAProjectVO() {
		return getAProjectVO;
	}

	public void setGetAProjectVO(GetProjectVO getAProjectVO) {
		this.getAProjectVO = getAProjectVO;
	}

	public PlusCountService getPlusCountService() {
		return plusCountService;
	}

	public void setPlusCountService(PlusCountService plusCountService) {
		this.plusCountService = plusCountService;
	}

	public GetCommentService getGetCommentService() {
		return getCommentService;
	}

	public void setGetCommentService(GetCommentService getCommentService) {
		this.getCommentService = getCommentService;
	}

	
	
	
	
}
