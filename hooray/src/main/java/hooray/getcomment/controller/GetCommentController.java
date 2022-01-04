package hooray.getcomment.controller;

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

import hooray.applyproject.service.ApplyProjectService;
import hooray.getcomment.model.GetCommentVO;
import hooray.getcomment.model.Paging;
import hooray.getcomment.service.GetCommentService;
import hooray.getproject.model.GetProjectVO;
import hooray.getproject.service.GetAProjectService;

//등록후 가져오는 것과 처음에 전체 가져오는 것을 구분.
//필요한 데이터는 프로젝트에 대한 데이터, 댓글 데이터 두가지를 가져오도록 구현해야 한다.

//세션에 가장 최근의 댓글 시간을 저장할 것이다. 그 이유는 나중에 댓글을 등록할때 그 이전 것도 함께 가져오기 위해서
@Controller
public class GetCommentController {

	private GetCommentService getCommentService;
	private GetAProjectService getAProjectService;
	private GetProjectVO getProjectVO;
	private ApplyProjectService applyProjectService;
	private Paging commentPaging;
	private GetCommentVO getCommentVO;
	
	//댓글 가져오기는 페이징 기술을 사용한다.
	@RequestMapping(value="/project/getcommentfirst.do", method=RequestMethod.GET)
	public ModelAndView getAllComment(HttpServletRequest request,HttpSession session){
		
		int projectNum=Integer.valueOf(request.getParameter("projectNum"));
		int confirmApply;
		int chooseflag;
		int commentCount;//댓글 갯수가져오기
		
		Date lastCommentDate; //마지막 댓글의 시간을 저장해서 나중에 Ajax로 가져올때 사용한다.
		String memberemail;
		
		session=request.getSession();
		memberemail=(String)session.getAttribute("email");
		chooseflag=Integer.valueOf(request.getParameter("flag"));//재활용
		
		session.setAttribute("lastCommentDate", null);
		
		
		//가장 먼저 댓글 페이징을 위한 처리를 먼저 해준다.
		String pageNum=request.getParameter("pageNum");//문자열로 오기 때문에 정수로 변화해줌.
		if(pageNum==null || pageNum==""){
			pageNum="1";
		}
		
		int currentPage=Integer.parseInt(pageNum);
		int pageSize=10; //페이지당 보여줄 데이터 수
		int pagenavi=5; //페이지번호 보여줄 수
	
		commentCount=getCommentService.getCommentCount(projectNum);
		
		commentPaging.setPaging(pageSize, pagenavi, commentCount, currentPage);
		
		//프로젝트의 내용을 가져온다.
		getProjectVO=getAProjectService.getAProject(projectNum);
		
		Map<String,Object> pagingMap=new HashMap<String,Object>();
		
		pagingMap.put("start_row", commentPaging.getWriting_Start());
		pagingMap.put("end_row", commentPaging.getWriting_End());
		pagingMap.put("projectNum", projectNum);
		
		List<GetCommentVO> commentList=getCommentService.getAllComment(pagingMap);
		
		
		if(commentList.size()>=1){
		lastCommentDate=commentList.get(0).getRegdate();
		session.setAttribute("lastCommentDate", lastCommentDate);
		//session.setAttribute("projectNum", projectNum);
		}
		
		
		Map<String,Object> model=new HashMap<String,Object>();
		model.put("pnum", projectNum);
		model.put("email", memberemail);
		
		confirmApply=applyProjectService.applyProjectBefore(model);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("applyflag", confirmApply);
		map.put("aProject", getProjectVO);
		map.put("commentList", commentList);
		map.put("chooseFlag",chooseflag);
		map.put("commentCount", commentCount);
		map.put("pageNum",pageNum);
		map.put("cP", commentPaging);
		
		
		ModelAndView mav=new ModelAndView();
		
		mav.addAllObjects(map);
		mav.setViewName("/project/projectcomment.jsp");
		
		return mav;
	}
		
	@RequestMapping(value="/project/getcomment.do", method=RequestMethod.POST)
	@ResponseBody
	public String uploadComment(HttpServletRequest request,HttpSession session) throws JsonProcessingException{
		
		session=request.getSession();
		int projectNum=Integer.valueOf(request.getParameter("projectNum"));
		int commentCount;
		String email=(String)session.getAttribute("email");
		String flag=request.getParameter("flag");
		
		//System.out.println(flag);
		
		getCommentVO.setProjectNum(projectNum);
		getCommentVO.setComment((String)request.getParameter("comment"));
		getCommentVO.setEmail(email);
		getCommentVO.setName((String)session.getAttribute("name"));
		
		//lastCommentDate가 없다면 내가 지금 올리는 댓글이 처음, 그러니 혹시모를 경우를 대비해서
		//현재 내가 집어 넣는 댓글을 lastCommentDate로 정하고 그 이전 댓글이 있는지 확인하고 가져오자.
		if(session.getAttribute("lastCommentDate")==null || session.getAttribute("lastCommentDate")==""){
			Date lastCommentDate;
			getCommentService.uploadComment(getCommentVO);
			//현재 내가 올린 댓글의 시간을 가져오는게 맞다.
			Map<String,Object> model=new HashMap<String,Object>();
			model.put("projectNum", projectNum);
			model.put("email", email);
			
			lastCommentDate=getCommentService.getLastCommentDate(model);
			System.out.println(lastCommentDate);
			model=new HashMap<String,Object>();
			model.put("lastCommentDate", lastCommentDate);
			model.put("flag",flag);
			model.put("projectNum", projectNum);
			List<GetCommentVO> cList=getCommentService.getCommentList(model);
			
			for(int i=0; i<cList.size();i++){
				Date date=cList.get(i).getRegdate();
				SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				cList.get(i).setDate(form.format(date));
			}
		
			
			System.out.println(cList.get(0).getRegdate());
	
			commentCount=getCommentService.getCommentCount(projectNum);

			System.out.println(cList.size());
			//가장 최신시간
			session.setAttribute("lastCommentDate", lastCommentDate);
			
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("commentCount", commentCount);
	
			map.put("cList", cList);
			ObjectMapper mapper = new ObjectMapper();
			System.out.println(map);
			
			return mapper.writeValueAsString(map);
			
		}/*
		
		*/
		
		
		//lastCommentDate가 있다면 현재 내 댓글의 시간을 이 시간을 기준으로 하고 내가 현재 올린 CommentDate 사이에 댓글을 가져온다.
		else{
			Date lastCommentDate=(Date)session.getAttribute("lastCommentDate");
			Date currentCommentDate;
			getCommentService.uploadComment(getCommentVO);
			
			Map<String,Object> model=new HashMap<String,Object>();
			model.put("projectNum", projectNum);
			model.put("email", email);
			currentCommentDate=getCommentService.getLastCommentDate(model);
			
			model=new HashMap<String,Object>();
			model.put("lastCommentDate", lastCommentDate);
			model.put("currentCommentDate", currentCommentDate);
			model.put("flag", flag);
			model.put("projectNum", projectNum);
			List<GetCommentVO> cList=getCommentService.getCommentList(model);
			commentCount=getCommentService.getCommentCount(projectNum);
			System.out.println(commentCount);

			for(int i=0; i<cList.size();i++){
				Date date=cList.get(i).getRegdate();
				SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				cList.get(i).setDate(form.format(date));
			}

			//가장 최신시간
			
			session.setAttribute("lastCommentDate", currentCommentDate);

			
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("cList", cList);
			map.put("commentCount",commentCount);
			ObjectMapper mapper = new ObjectMapper();
			
	
			return mapper.writeValueAsString(map);
			}
		

	}
		

	public GetCommentService getGetCommentService() {
		return getCommentService;
	}

	public void setGetCommentService(GetCommentService getCommentService) {
		this.getCommentService = getCommentService;
	}

	public GetAProjectService getGetAProjectService() {
		return getAProjectService;
	}

	public void setGetAProjectService(GetAProjectService getAProjectService) {
		this.getAProjectService = getAProjectService;
	}

	public GetProjectVO getGetProjectVO() {
		return getProjectVO;
	}

	public void setGetProjectVO(GetProjectVO getProjectVO) {
		this.getProjectVO = getProjectVO;
	}

	public ApplyProjectService getApplyProjectService() {
		return applyProjectService;
	}

	public void setApplyProjectService(ApplyProjectService applyProjectService) {
		this.applyProjectService = applyProjectService;
	}

	public Paging getCommentPaging() {
		return commentPaging;
	}

	public void setCommentPaging(Paging commentPaging) {
		this.commentPaging = commentPaging;
	}

	public GetCommentVO getGetCommentVO() {
		return getCommentVO;
	}

	public void setGetCommentVO(GetCommentVO getCommentVO) {
		this.getCommentVO = getCommentVO;
	}

	
	
	
	
}
