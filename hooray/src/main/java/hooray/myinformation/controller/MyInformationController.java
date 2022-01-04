package hooray.myinformation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hooray.myinformation.model.MyInformationVO;
import hooray.myinformation.model.Paging;
import hooray.myinformation.model.ProjectVO;
import hooray.myinformation.service.MyInformationService;

@Controller
public class MyInformationController {

	private MyInformationService myInformationService;
	private Paging myProjectPaging;
	@SuppressWarnings("unchecked")
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getMyInformation(HttpServletRequest request,HttpSession session){
		
		//가장 핵심은 리스트를 가져오는 것이 핵심이다. 핵심에 맞춰서 구성할 것.
		//flag 1:나의 프로젝트, 2:참여중인 프로젝트 3:마감 프로젝트
		session=request.getSession();
		String email=(String)session.getAttribute("email");
		String flag=request.getParameter("flag");
		int myProjectCount;
		int appProjectCount;
		int endProjectCount;
		int currentPage;	
		String pageNum;
		List<ProjectVO> projectList;
		session.setAttribute("projectList", null);
		
		
		//나의 정보 가져오기
		MyInformationVO myInformationVO=myInformationService.getMyInformation(email);
				
		Map<String,Object> map=new HashMap<String,Object>();
				//나의 프로젝트 카운트 가져오기
		map=(Map<String,Object>)myInformationService.getMyProjectCount(email);
		
		myProjectCount=(int)map.get("myProjectCount");	
		appProjectCount=(int)map.get("appProjectCount");	
		endProjectCount=(int)map.get("endProjectCount");	
		
		//페이징
		pageNum=request.getParameter("pageNum");
		if(pageNum==null || pageNum==""){
			pageNum="1";
		}
		
		currentPage=Integer.parseInt(pageNum);
		int pageSize=10; //페이지당 보여줄 데이터 수
		int pagenavi=5; //페이지번호 보여줄 수
	
		//프로젝트 리스트 가져오기
		if(flag=="1" || flag.equals("1")){
		myProjectPaging.setPaging(pageSize, pagenavi, myProjectCount, currentPage);
		
		
		Map<String,Object> pagingMap=new HashMap<String,Object>();
		
		pagingMap.put("start_row", myProjectPaging.getWriting_Start());
		pagingMap.put("end_row", myProjectPaging.getWriting_End());
		pagingMap.put("email", email);
		
		projectList=myInformationService.getMyProjectList(pagingMap);
		
		}
		
		else if(flag=="2"||flag.equals("2")){
		myProjectPaging.setPaging(pageSize, pagenavi, appProjectCount, currentPage);
			
		Map<String,Object> pagingMap=new HashMap<String,Object>();
			
		pagingMap.put("start_row", myProjectPaging.getWriting_Start());
		pagingMap.put("end_row", myProjectPaging.getWriting_End());
		pagingMap.put("email", email);
			
		projectList=myInformationService.getAppProjectList(pagingMap);
			
		}
		
		else{
		myProjectPaging.setPaging(pageSize, pagenavi, endProjectCount, currentPage);
			
		Map<String,Object> pagingMap=new HashMap<String,Object>();
				
		pagingMap.put("start_row", myProjectPaging.getWriting_Start());
		pagingMap.put("end_row", myProjectPaging.getWriting_End());
		pagingMap.put("email", email);
				
		projectList=myInformationService.getEndProjectList(pagingMap);	
			
		}
		
		map=new HashMap<String,Object>();
		session.setAttribute("projectList", projectList);
	
		map.put("myInformationVO", myInformationVO);
		map.put("myProjectCount",myProjectCount);
		map.put("appProjectCount",appProjectCount);
		map.put("endProjectCount",endProjectCount);
		map.put("pP",myProjectPaging);
		map.put("projectList",projectList);
		map.put("flag",flag);
		
		
		ModelAndView mav=new ModelAndView();
		mav.addAllObjects(map);
		mav.setViewName("/member/myinformation.jsp");
		
		return mav;
	}
	public MyInformationService getMyInformationService() {
		return myInformationService;
	}
	public void setMyInformationService(MyInformationService myInformationService) {
		this.myInformationService = myInformationService;
	}
	public Paging getMyProjectPaging() {
		return myProjectPaging;
	}
	public void setMyProjectPaging(Paging myProjectPaging) {
		this.myProjectPaging = myProjectPaging;
	}
	
	
	
}
