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

//����� �������� �Ͱ� ó���� ��ü �������� ���� ����.
//�ʿ��� �����ʹ� ������Ʈ�� ���� ������, ��� ������ �ΰ����� ���������� �����ؾ� �Ѵ�.

//���ǿ� ���� �ֱ��� ��� �ð��� ������ ���̴�. �� ������ ���߿� ����� ����Ҷ� �� ���� �͵� �Բ� �������� ���ؼ�
@Controller
public class GetCommentController {

	private GetCommentService getCommentService;
	private GetAProjectService getAProjectService;
	private GetProjectVO getProjectVO;
	private ApplyProjectService applyProjectService;
	private Paging commentPaging;
	private GetCommentVO getCommentVO;
	
	//��� ��������� ����¡ ����� ����Ѵ�.
	@RequestMapping(value="/project/getcommentfirst.do", method=RequestMethod.GET)
	public ModelAndView getAllComment(HttpServletRequest request,HttpSession session){
		
		int projectNum=Integer.valueOf(request.getParameter("projectNum"));
		int confirmApply;
		int chooseflag;
		int commentCount;//��� ������������
		
		Date lastCommentDate; //������ ����� �ð��� �����ؼ� ���߿� Ajax�� �����ö� ����Ѵ�.
		String memberemail;
		
		session=request.getSession();
		memberemail=(String)session.getAttribute("email");
		chooseflag=Integer.valueOf(request.getParameter("flag"));//��Ȱ��
		
		session.setAttribute("lastCommentDate", null);
		
		
		//���� ���� ��� ����¡�� ���� ó���� ���� ���ش�.
		String pageNum=request.getParameter("pageNum");//���ڿ��� ���� ������ ������ ��ȭ����.
		if(pageNum==null || pageNum==""){
			pageNum="1";
		}
		
		int currentPage=Integer.parseInt(pageNum);
		int pageSize=10; //�������� ������ ������ ��
		int pagenavi=5; //��������ȣ ������ ��
	
		commentCount=getCommentService.getCommentCount(projectNum);
		
		commentPaging.setPaging(pageSize, pagenavi, commentCount, currentPage);
		
		//������Ʈ�� ������ �����´�.
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
		
		//lastCommentDate�� ���ٸ� ���� ���� �ø��� ����� ó��, �׷��� Ȥ�ø� ��츦 ����ؼ�
		//���� ���� ���� �ִ� ����� lastCommentDate�� ���ϰ� �� ���� ����� �ִ��� Ȯ���ϰ� ��������.
		if(session.getAttribute("lastCommentDate")==null || session.getAttribute("lastCommentDate")==""){
			Date lastCommentDate;
			getCommentService.uploadComment(getCommentVO);
			//���� ���� �ø� ����� �ð��� �������°� �´�.
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
			//���� �ֽŽð�
			session.setAttribute("lastCommentDate", lastCommentDate);
			
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("commentCount", commentCount);
	
			map.put("cList", cList);
			ObjectMapper mapper = new ObjectMapper();
			System.out.println(map);
			
			return mapper.writeValueAsString(map);
			
		}/*
		
		*/
		
		
		//lastCommentDate�� �ִٸ� ���� �� ����� �ð��� �� �ð��� �������� �ϰ� ���� ���� �ø� CommentDate ���̿� ����� �����´�.
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

			//���� �ֽŽð�
			
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
