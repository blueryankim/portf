package hooray.getproject.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import hooray.getproject.model.GetProjectVO;
import hooray.getproject.service.GetProjectsService;

@Controller
public class GetProjectsController {
	private GetProjectsService getProjectsService;
	
	//Ajax가 아닐 겨웅에 실행
	@RequestMapping(value="/project/getprojectsfirst.do" ,method=RequestMethod.GET ,produces="application/json; charset=utf8")
	public ModelAndView getProjects(HttpServletRequest request, HttpSession session){
		

	
		Date latestDate;
		session=request.getSession();
		String search_type=request.getParameter("search_type");
		String email=(String)session.getAttribute("email");
		int index;
		String subEmail;
		session.setAttribute("latestDate", null);
		//자원봉사, 재능기부, 공연행사, 상품판매별로 가져오기 위해서

		
		//자원봉사, 재능기부, 공연행사, 상품판매별로 찾아오기 분류
		
		Map<String,Object> model=new HashMap<String,Object>();
		
		model.put("search_type",search_type);
		model.put("start_row", 1);
		model.put("end_row", 6);
		
		if(request.getParameter("num")==null){
			
			model.put("flag", "1");
		}
		
		
		if(search_type=="latest" || search_type.equals("latest")){
		//latestDate=getProjectsService.getLatestDate();
		//model.put("latest_date", latestDate);
		
		List<GetProjectVO> projectList=getProjectsService.getProjects(model);
		
		if(projectList.size()>=1){
		latestDate=projectList.get(projectList.size()-1).getRegdate();
		session.setAttribute("latestDate", latestDate);
		}
	
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("projectList", projectList);
		map.put("search_type",search_type);
		//스크롤 이벤트를 할 때 구별하기 위해서
		map.put("flag", 1);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addAllObjects(map);
		mav.setViewName("/projectschart/allprojectspage.jsp");
		
		return mav;
		
		}
		
		else{
		
		index=email.indexOf('@');
		subEmail=email.substring(0, index);
		subEmail=subEmail.trim();
		System.out.println(subEmail);
		model.put("email",subEmail);
		List<GetProjectVO> projectList=getProjectsService.getProjects(model);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("projectList", projectList);
		map.put("search_type",search_type);
		map.put("flag", 1);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addAllObjects(map);
		mav.setViewName("/projectschart/allprojectspage.jsp");
		
		return mav;
		}
		
	}
	
	@RequestMapping(value="/project/getprojectsajax.do" ,method=RequestMethod.GET, produces="application/json; charset=utf8")
	@ResponseBody
	public String getProjectsAjax(HttpServletRequest request, HttpSession session) throws JsonProcessingException{
		
		//Ajax로 실행되는 경우
		HttpHeaders resHeaders = new HttpHeaders();
		resHeaders.add("Content-Type", "application/json;charset=UTF-8");
		
		String subEmail;
		int index; 
		Date latestDate;
		session=request.getSession();
		String search_type=request.getParameter("search_type");
		String email=(String)session.getAttribute("email");
		
		int num=Integer.valueOf(request.getParameter("num"));
		
		Map<String,Object> model=new HashMap<String,Object>();
		model.put("search_type",search_type);
		model.put("flag", "0");
		
		
		if(search_type=="latest"||search_type.equals("latest")){
		
		if(session.getAttribute("latestDate")!=null){	
		latestDate=(Date)session.getAttribute("latestDate");
		System.out.println(latestDate);
		model.put("latest_date", latestDate);
		model.put("start_row", 1);
		model.put("end_row", 6);
		}
		
		
		}
		
		else{
		int end_row=6*num;
		int start_row=end_row-5;
				
		model.put("start_row",start_row);
		model.put("end_row", end_row);
			
		index=email.indexOf('@');
		subEmail=email.substring(0, index);
		subEmail=subEmail.trim();
		model.put("email",subEmail);
		}
		
	
		List<GetProjectVO> projectList=getProjectsService.getProjects(model);
		
		if(projectList.size()>=1){
		latestDate=projectList.get(projectList.size()-1).getRegdate();
		System.out.println(latestDate);
		session.setAttribute("latestDate", latestDate);
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("projectList", projectList);
		map.put("search_type",search_type);

	
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(map);
	}

	@RequestMapping(value="/project/getprojectkind.do", method=RequestMethod.GET)
	public ModelAndView getProjectsKind(HttpServletRequest request, HttpSession session){
		
		
		Date latestDate;
		session=request.getSession();
		String search_type=request.getParameter("search_type");
		String email=(String)session.getAttribute("email");
		int projectKind=Integer.valueOf(request.getParameter("projectkind"));
		int index;
		String subEmail;
		session.setAttribute("latestDate", null);
		//자원봉사, 재능기부, 공연행사, 상품판매별로 가져오기 위해서

		
		//자원봉사, 재능기부, 공연행사, 상품판매별로 찾아오기 분류
		
		Map<String,Object> model=new HashMap<String,Object>();
		
		model.put("projectKind", projectKind);
		model.put("search_type",search_type);
		model.put("start_row", 1);
		model.put("end_row", 6);
		
		if(request.getParameter("num")==null){
			
			model.put("flag", "1");
		}
		
		
		if(search_type=="latest" || search_type.equals("latest")){
		//latestDate=getProjectsService.getLatestDate();
		//model.put("latest_date", latestDate);
		
		List<GetProjectVO> projectList=getProjectsService.getKindProjects(model);
		
		if(projectList.size()>=1){
		latestDate=projectList.get(projectList.size()-1).getRegdate();
		session.setAttribute("latestDate", latestDate);
		}
	
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("projectList", projectList);
		map.put("search_type",search_type);
		map.put("flag", 2);
		map.put("projectKind", projectKind);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addAllObjects(map);
		mav.setViewName("/projectschart/allprojectspage.jsp");
		
		return mav;
		
		}
		
		else{
		
		index=email.indexOf('@');
		subEmail=email.substring(0, index);
		subEmail=subEmail.trim();
		
		model.put("email",subEmail);
		List<GetProjectVO> projectList=getProjectsService.getKindProjects(model);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("projectList", projectList);
		map.put("search_type",search_type);
		map.put("flag", 2);
	
		
		
		ModelAndView mav=new ModelAndView();
		
		mav.addAllObjects(map);
		mav.setViewName("/projectschart/allprojectspage.jsp");
		
		return mav;
		}
	}
	
		
	
		@RequestMapping(value="/project/getprojectskindajax.do" ,method=RequestMethod.GET, produces="application/json; charset=utf8")
		@ResponseBody
		public String getProjectsKindAjax(HttpServletRequest request, HttpSession session) throws JsonProcessingException{
			
			//Ajax로 실행되는 경우
			HttpHeaders resHeaders = new HttpHeaders();
			resHeaders.add("Content-Type", "application/json;charset=UTF-8");
			
			String subEmail;
			int index; 
			Date latestDate;
			session=request.getSession();
			String search_type=request.getParameter("search_type");
			String email=(String)session.getAttribute("email");
			int projectKind=Integer.valueOf(request.getParameter("projectkind"));
			
			int num=Integer.valueOf(request.getParameter("num"));
			
			Map<String,Object> model=new HashMap<String,Object>();
			model.put("search_type",search_type);
			model.put("flag", "0");
			model.put("projectKind", projectKind);
			
			if(search_type=="latest"||search_type.equals("latest")){
			
			if(session.getAttribute("latestDate")!=null){	
			latestDate=(Date)session.getAttribute("latestDate");
		
			model.put("latest_date", latestDate);
			model.put("start_row", 1);
			model.put("end_row", 6);
			}
			
			
			}
			
			else{
			int end_row=6*num;
			int start_row=end_row-5;
					
			model.put("start_row",start_row);
			model.put("end_row", end_row);
				
			index=email.indexOf('@');
			subEmail=email.substring(0, index);
			subEmail=subEmail.trim();
			model.put("email",subEmail);
			}
			
		
			List<GetProjectVO> projectList=getProjectsService.getProjects(model);
			
			if(projectList.size()>=1){
			latestDate=projectList.get(projectList.size()-1).getRegdate();
			System.out.println(latestDate);
			session.setAttribute("latestDate", latestDate);
			}
			
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("projectList", projectList);
			map.put("search_type",search_type);
			System.out.println("키테코리");
		
			ObjectMapper mapper = new ObjectMapper();
			
			return mapper.writeValueAsString(map);
		}

		
		@RequestMapping(value="/project/getprojectselect.do", method=RequestMethod.POST)
		public ModelAndView getProjectsSelect(HttpServletRequest request, HttpSession session){
			
			Date latestDate;
			session=request.getSession();
			String searchselect=request.getParameter("search_select");
			String searchproject=request.getParameter("search_project");
			
			System.out.println(searchselect);
			System.out.println(searchproject);
		
			session.setAttribute("latestDate", null);
		
			
			Map<String,Object> model=new HashMap<String,Object>();
			
			model.put("searchselect", searchselect);
			model.put("searchproject",searchproject);
			model.put("start_row", 1);
			model.put("end_row", 9);
			
			if(request.getParameter("num")==null){
				
				model.put("flag", "1");
			}
			
			
			List<GetProjectVO> projectList=getProjectsService.getSelectProjects(model);
			
			if(projectList.size()>=1){
			latestDate=projectList.get(projectList.size()-1).getRegdate();
			session.setAttribute("latestDate", latestDate);
			}
		
			
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("projectList", projectList);
			map.put("search_type","latest");
			map.put("flag", 3);
			map.put("searchselect", searchselect);
			map.put("searchproject", searchproject);
	
			
			ModelAndView mav=new ModelAndView();
			
			mav.addAllObjects(map);
			mav.setViewName("/projectschart/allprojectspage.jsp");
			
			return mav;
			
			}	
		
		@RequestMapping(value="/project/getprojectsselectajax.do" ,method=RequestMethod.GET, produces="application/json; charset=utf8")
		@ResponseBody
		public String getProjectsSelectAjax(HttpServletRequest request, HttpSession session) throws JsonProcessingException{
			
	
			Date latestDate;
			session=request.getSession();
			String searchselect=request.getParameter("search_select");
			String searchproject=request.getParameter("search_project");

			
			Map<String,Object> model=new HashMap<String,Object>();
			
			model.put("flag", "0");
			model.put("searchselect", searchselect);
			model.put("searchproject", searchproject);
			
		
			
			if(session.getAttribute("latestDate")!=null){	
			latestDate=(Date)session.getAttribute("latestDate");
		
			model.put("latest_date", latestDate);
			model.put("start_row", 1);
			model.put("end_row", 6);
			}
			
		
		
			List<GetProjectVO> projectList=getProjectsService.getSelectProjects(model);
			
			if(projectList.size()>=1){
			latestDate=projectList.get(projectList.size()-1).getRegdate();
			System.out.println(latestDate);
			session.setAttribute("latestDate", latestDate);
			}
			
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("projectList", projectList);
			map.put("search_type","latest");
			System.out.println("키테코리");
		
			ObjectMapper mapper = new ObjectMapper();
			
			return mapper.writeValueAsString(map);
		}

		
	
	public GetProjectsService getGetProjectsService() {
		return getProjectsService;
	}

	public void setGetProjectsService(GetProjectsService getProjectsService) {
		this.getProjectsService = getProjectsService;
	}
	
	
}
